unit ufBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufConsultaBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, BombaController;

type
  TfrmBomba = class(TfrmConsultaBase)
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    BombaController : TBombaController;
  public
    { Public declarations }
  end;

var
  frmBomba: TfrmBomba;

implementation

{$R *.dfm}
uses ufBombaEditor;

procedure TfrmBomba.btnEditarClick(Sender: TObject);
begin
  inherited;
  BombaController.Editar;
  BombaController.Listar;
end;

procedure TfrmBomba.btnExcluirClick(Sender: TObject);
begin
  inherited;
  BombaController.Excluir;
  BombaController.Listar;
end;

procedure TfrmBomba.btnNovoClick(Sender: TObject);
begin
  inherited;
  BombaController.Novo;
  BombaController.Listar;
end;

procedure TfrmBomba.FormCreate(Sender: TObject);
begin
  inherited;
  BombaController := TBombaController.Create;
  BombaController.SetDataSouceGrid(dsGrade);
end;

procedure TfrmBomba.FormShow(Sender: TObject);
begin
  inherited;
  BombaController.Listar;
end;

end.
