unit ufBombaEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufEditorBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  Tanque, System.Generics.Collections, Bomba, Conexao, TanqueDAO;

type
  TfrmBombaEditor = class(TfrmEditorBase)
    Label1: TLabel;
    EditDS_BOMBA: TEdit;
    ComboTanque: TComboBox;
    Label2: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    TanqueDAO: iTanque;
    procedure SetItemsComboTanque(ATanques: TList<TTanque>);
    function ValidaEditor: Boolean;
    procedure CarregaComboTanque(const aCodTanque: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure SetDados(aBomba : TBomba);
    procedure SetIndexComboTanque;

  end;

var
  frmBombaEditor: TfrmBombaEditor;

implementation

{$R *.dfm}

uses BombaController;

procedure TfrmBombaEditor.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.CloseModal;
end;

procedure TfrmBombaEditor.btnSalvarClick(Sender: TObject);
var
  Bomba: TBomba;
  ControllerBomba : TBombaController;
begin
  inherited;
  if ValidaEditor then
  begin
    Bomba := TBomba.Create();
    ControllerBomba := TBombaController.Create();

    if EditCodigo.Text <> '' then
      Bomba.ID := strToInt(EditCodigo.Text)
    else
      Bomba.ID := 0;

    Bomba.DS_BOMBA := EditDS_BOMBA.Text;
    Bomba.ID_TANQUE := Integer(ComboTanque.Items.Objects[ComboTanque.ItemIndex]);

    ControllerBomba.Salvar(Bomba);
    ModalResult := mrOk;
  end
end;

procedure TfrmBombaEditor.SetDados(aBomba: TBomba);
begin
  EditCodigo.Text := inttostr(aBomba.ID);
  EditDS_BOMBA.Text := aBomba.DS_BOMBA;
  SetIndexComboTanque;
  CarregaComboTanque(aBomba.ID_TANQUE);
end;

procedure TfrmBombaEditor.SetItemsComboTanque(ATanques: TList<TTanque>);
var
  tanque: TTanque;
begin
  ComboTanque.Items.Clear;
  ComboTanque.AddItem('[Selecione]', TObject(0));
  for tanque in ATanques do
    ComboTanque.AddItem(tanque.ToString, TObject(tanque.Id));
end;

procedure TfrmBombaEditor.SetIndexComboTanque;
begin
  TanqueDAO := TTanqueDAO.Create;
  SetItemsComboTanque(TanqueDAO.GetList());
end;

function TfrmBombaEditor.ValidaEditor: Boolean;
begin
  Result := False;
  if (Trim(EditDS_BOMBA.Text) = '') then
  begin
    Application.MessageBox(PWideChar('Informe a descrição da Bomba.'),
      'Cadastro de Bomba',MB_OK + MB_ICONINFORMATION);
    EditDS_BOMBA.SetFocus;
    Abort;
  end;
  if (ComboTanque.ItemIndex = 0) then
  begin
    Application.MessageBox(PWideChar('Informe o tanque para a Bomba.'),
      'Cadastro de Bomba',MB_OK + MB_ICONINFORMATION);
    ComboTanque.SetFocus;
    Abort;
  end;
  Result := True;
end;

procedure TfrmBombaEditor.CarregaComboTanque(const aCodTanque: Integer);
var
  i: Integer;
begin
  for i := 0 to Pred(ComboTanque.GetCount) do
  begin
    ComboTanque.ItemIndex := i;
    if Integer(ComboTanque.Items.Objects[ComboTanque.ItemIndex]) = aCodTanque then
      Break;
  end;
end;


end.
