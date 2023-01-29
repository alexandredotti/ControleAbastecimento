unit ufAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufConsultaBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, AbastecimentoController;

type
  TfrmAbastecimento = class(TfrmConsultaBase)
    btnRelatorio: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    AbastecimentoController : TAbastecimentoController;
  public
    { Public declarations }
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}
uses ufAbastecimentoEditor;

procedure TfrmAbastecimento.btnEditarClick(Sender: TObject);
begin
  inherited;
  AbastecimentoController.Editar;
end;

procedure TfrmAbastecimento.btnExcluirClick(Sender: TObject);
begin
  inherited;
  AbastecimentoController.Excluir;
end;

procedure TfrmAbastecimento.btnNovoClick(Sender: TObject);
begin
  inherited;
  if (frmAbastecimentoEditor = nil) then
  begin
    Application.CreateForm(TfrmAbastecimentoEditor, frmAbastecimentoEditor);
  end;
  frmAbastecimentoEditor.Show();
end;

procedure TfrmAbastecimento.FormCreate(Sender: TObject);
begin
  inherited;
  AbastecimentoController := TAbastecimentoController.Create;
  AbastecimentoController.SetDataSouceGrid(dsGrade);
  AbastecimentoController.Listar;
end;

end.
