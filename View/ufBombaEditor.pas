unit ufBombaEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufEditorBase, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmBombaEditor = class(TfrmEditorBase)
    Label1: TLabel;
    EditDS_BOMBA: TEdit;
    ComboTanque: TComboBox;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBombaEditor: TfrmBombaEditor;

implementation

{$R *.dfm}

end.
