unit ufAbastecimentoEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufEditorBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.NumberBox;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbastecimentoEditor: TfrmAbastecimentoEditor;

implementation

{$R *.dfm}

end.