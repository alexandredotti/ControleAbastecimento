unit TanqueController;

interface

uses Tanque, TanqueDAO, SysUtils, Data.DB, ufTanqueEditor, Vcl.Forms;

type
  TTanqueController = class
  private
    { private declarations }
    FdsTanque: TDataSource;
    frmTanqueEditor: TfrmTanqueEditor;
    Tanque : TTanque;
    procedure SetDados;
    procedure GetDados;
  public
    procedure Salvar(aTanque: TTAnque);
    procedure Excluir();
    procedure SetDataSouceGrid(ADataSource: TDataSource);
    procedure Listar();
    procedure Editar();
  end;
implementation


procedure TTanqueController.Editar;
begin
  if (not Assigned(frmTanqueEditor)) then
    Application.CreateForm(TfrmTanqueEditor, frmTanqueEditor);
  GetDados;
  SetDados;
  frmTanqueEditor.Show;
end;

procedure TTanqueController.Excluir();
var
  TanqueDAO: TTanqueDAO;
begin
  try
    if (FdsTanque.DataSet.IsEmpty) then
      Exit;

    TanqueDAO := TTanqueDAO.Create;
    TanqueDAO.Excluir(FdsTanque.DataSet.FieldByName('ID').AsInteger);
    FreeAndNil(TanqueDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TTanqueController.GetDados;
begin
  Tanque := TTanque.Create;
  Tanque.ID := FdsTanque.DataSet.FieldByName('ID').AsInteger;
  Tanque.DS_TANQUE := FdsTanque.DataSet.FieldByName('DS_TANQUE').AsString;
  Tanque.TP_TANQUE := FdsTanque.DataSet.FieldByName('TP_TANQUE').AsInteger;
end;

procedure TTanqueController.Listar;
var
  TanqueDAO: TTanqueDAO;
begin
  try
    TanqueDAO := TTanqueDAO.Create;
    TanqueDAO.Listar(FdsTanque);
    FreeAndNil(TanqueDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TTanqueController.Salvar(aTanque: TTAnque);
var
  TanqueDAO: TTanqueDAO;
begin
  try
    TanqueDAO := TTanqueDAO.Create;
    TanqueDAO.Salvar(aTanque);
    FreeAndNil(TanqueDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TTanqueController.SetDados;
begin
  frmTanqueEditor.EditCodigo.Text := inttostr(Tanque.ID);
  frmTanqueEditor.EditDS_TANQUE.Text := Tanque.DS_TANQUE;
  frmTanqueEditor.ItemIndex := Tanque.TP_TANQUE;
end;

procedure TTanqueController.SetDataSouceGrid(ADataSource: TDataSource);
begin
  FdsTanque := ADataSource;
end;

end.