unit ufConsultaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, TanqueController;

type
  TfrmConsultaBase = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    gdDados: TDBGrid;
    dsGrade: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaBase: TfrmConsultaBase;


implementation

{$R *.dfm}




procedure TfrmConsultaBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Action := caFree;
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

end.
