unit ufTanqueEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufEditorBase, Vcl.StdCtrls, Vcl.ExtCtrls, TanqueController;

type
  TfrmTanqueEditor = class(TfrmEditorBase)
    Label1: TLabel;
    EditDS_TANQUE: TEdit;
    Label3: TLabel;
    ComboTipoComb: TComboBox;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    ControllerTanque : TTanqueController;
  public
    { Public declarations }
  end;

var
  frmTanqueEditor: TfrmTanqueEditor;

implementation

{$R *.dfm}
uses Tanque;

procedure TfrmTanqueEditor.btnSalvarClick(Sender: TObject);
var
  Tanque: TTanque;
begin
  inherited;
  Tanque := TTanque.create();

  if EditCodigo.Text <> '' then
    Tanque.ID := EditCodigo.Text
  else
    Tanque.ID := 0;

  Tanque.DS_TANQUE := EditDS_TANQUE.Text;
  Tanque.TP_TANQUE := Integer(ComboTipoComb.Items.Objects[ComboTipoComb.ItemIndex];
  ControllerTanque.Salvar(Tanque);
  FreeAndNil(Tanque);
end;


end;

end.
