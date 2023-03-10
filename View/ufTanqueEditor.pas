unit ufTanqueEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufEditorBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  Tanque;

type
  TfrmTanqueEditor = class(TfrmEditorBase)
    Label1: TLabel;
    EditDS_TANQUE: TEdit;
    Label3: TLabel;
    ComboTipoComb: TComboBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    function ValidaEditor: Boolean;
    { Private declarations }

  public
    { Public declarations }
    procedure SetDados(aTanque : TTanque);
  end;

var
  frmTanqueEditor: TfrmTanqueEditor;

implementation

{$R *.dfm}
uses TanqueController;

procedure TfrmTanqueEditor.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.CloseModal;
end;

procedure TfrmTanqueEditor.btnSalvarClick(Sender: TObject);
var
  Tanque: TTanque;
  ControllerTanque : TTanqueController;
begin
  inherited;
  if ValidaEditor then
  begin
    Tanque := TTanque.create();
    ControllerTanque := TTanqueController.Create();

    if EditCodigo.Text <> '' then
      Tanque.ID := strToInt(EditCodigo.Text)
    else
      Tanque.ID := 0;

    Tanque.DS_TANQUE := EditDS_TANQUE.Text;
    Tanque.TP_TANQUE := ComboTipoComb.ItemIndex;
    ControllerTanque.Salvar(Tanque);
    ModalResult := mrOk;
  end;
end;

procedure TfrmTanqueEditor.SetDados(aTanque: TTanque);
begin
  EditCodigo.Text := inttostr(aTanque.ID);
  EditDS_TANQUE.Text := aTanque.DS_TANQUE;
  ComboTipoComb.ItemIndex := aTanque.TP_TANQUE;
end;

function TfrmTanqueEditor.ValidaEditor: Boolean;
begin
  Result := False;
  if (Trim(EditDS_TANQUE.Text) = '') then
  begin
    Application.MessageBox(PWideChar('Informe a descrição do Tanque.'),
      'Cadastro de Tanque',MB_OK + MB_ICONINFORMATION);
    EditDS_TANQUE.SetFocus;
    Exit;
  end;
  if (ComboTipoComb.ItemIndex = 0) then
  begin
    Application.MessageBox(PWideChar('Informe o tipo de Combustível do Tanque.'),
      'Cadastro de Tanque',MB_OK + MB_ICONINFORMATION);
    ComboTipoComb.SetFocus;
    Exit;
  end;
  Result := True;
end;

end.
