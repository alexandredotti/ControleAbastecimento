unit ufAbastecimentoEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufEditorBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.NumberBox, Abastecimento, Vcl.WinXPickers, BombaDAO, Conexao, Bomba,
  System.Generics.Collections;

type
  TfrmAbastecimentoEditor = class(TfrmEditorBase)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edLitros: TNumberBox;
    edValor: TNumberBox;
    edImposto: TNumberBox;
    ComboBomba: TComboBox;
    Label2: TLabel;
    DT_ABASTECIMENTO: TDatePicker;
    Label1: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edValorChangeValue(Sender: TObject);
  private
    BombaDAO: iBomba;
    function ValidaEditor: Boolean;
    procedure SetItemsComboBomba(ABombas: TList<TBomba>);
    procedure CarregaComboBomba(const aCodBomba: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure SetDados(aAbastecimento : TAbastecimento);
    procedure SetIndexComboBomba;
  end;

var
  frmAbastecimentoEditor: TfrmAbastecimentoEditor;

implementation

{$R *.dfm}
uses AbastecimentoController;

{ TfrmAbastecimentoEditor }

procedure TfrmAbastecimentoEditor.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.CloseModal;
end;

procedure TfrmAbastecimentoEditor.btnSalvarClick(Sender: TObject);
var
  Abastecimento: TAbastecimento;
  AbastecimentoController : TAbastecimentoController;
begin
  inherited;
  if ValidaEditor then
  begin
    Abastecimento := TAbastecimento.create();
    AbastecimentoController := TAbastecimentoController.Create();

    if EditCodigo.Text <> '' then
      Abastecimento.ID := strToInt(EditCodigo.Text)
    else
      Abastecimento.ID := 0;

    Abastecimento.DT_ABASTECIMENTO := DT_ABASTECIMENTO.Date;
    Abastecimento.ID_BOMBA := Integer(ComboBomba.Items.Objects[ComboBomba.ItemIndex]);
    Abastecimento.NR_LITROS := edLitros.Value;
    Abastecimento.VL_TOTAL := edValor.Value;
    Abastecimento.VL_IMPOSTO := edImposto.Value;

    AbastecimentoController.Salvar(Abastecimento);
    ModalResult := mrOk;
  end;
end;

procedure TfrmAbastecimentoEditor.edValorChangeValue(Sender: TObject);
begin
  inherited;
  edImposto.Value := edValor.Value * 0.13;
end;

procedure TfrmAbastecimentoEditor.SetDados(aAbastecimento: TAbastecimento);
begin
  EditCodigo.Text := inttostr(aAbastecimento.ID);
  DT_ABASTECIMENTO.Date := aAbastecimento.DT_ABASTECIMENTO;
  edLitros.Value := aAbastecimento.NR_LITROS;
  edValor.Value := aAbastecimento.VL_TOTAL;
  edImposto.Value := aAbastecimento.VL_IMPOSTO;
  SetIndexComboBomba;
  CarregaComboBomba(aAbastecimento.ID_BOMBA);
end;

function TfrmAbastecimentoEditor.ValidaEditor: Boolean;
begin
  Result := False;
  if (VarIsNull(DT_ABASTECIMENTO.Date)) then
  begin
    Application.MessageBox(PWideChar('Informe a data do Abastecimento.'),
      'Cadastro de Abastecimento',MB_OK + MB_ICONINFORMATION);
    DT_ABASTECIMENTO.SetFocus;
    Exit;
  end;
  if (ComboBomba.ItemIndex = 0) then
  begin
    Application.MessageBox(PWideChar('Informe a Bomba que foi utilizada no Abastecimento.'),
      'Cadastro de Abastecimento',MB_OK + MB_ICONINFORMATION);
    ComboBomba.SetFocus;
    Exit;
  end;
  if edLitros.Value = 0 then
  begin
    Application.MessageBox(PWideChar('Informe a quantidade de Litros que foi Abastecido.'),
      'Cadastro de Abastecimento',MB_OK + MB_ICONINFORMATION);
    edLitros.SetFocus;
    Exit;
  end;
  if edValor.Value = 0 then
  begin
    Application.MessageBox(PWideChar('Informe o Valor Total do Abastecimento.'),
      'Cadastro de Abastecimento',MB_OK + MB_ICONINFORMATION);
    edValor.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfrmAbastecimentoEditor.SetItemsComboBomba(ABombas: TList<TBomba>);
var
  bomba: TBomba;
begin
  ComboBomba.Items.Clear;
  ComboBomba.AddItem('[Selecione]', TObject(0));
  for bomba in ABombas do
    ComboBomba.AddItem(bomba.ToString, TObject(bomba.Id));
end;

procedure TfrmAbastecimentoEditor.SetIndexComboBomba;
begin
  BombaDAO := TBombaDAO.Create;
  SetItemsComboBomba(BombaDAO.GetList());
end;

procedure TfrmAbastecimentoEditor.CarregaComboBomba(const aCodBomba: Integer);
var
  i: Integer;
begin
  for i := 0 to Pred(ComboBomba.GetCount) do
  begin
    ComboBomba.ItemIndex := i;
    if Integer(ComboBomba.Items.Objects[ComboBomba.ItemIndex]) = aCodBomba then
      Break;
  end;
end;

end.
