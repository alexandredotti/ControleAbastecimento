unit BombaController;

interface

uses Bomba, BombaDAO, SysUtils, Data.DB, Vcl.Forms, Tanque;

type
  TBombaController = class
  private
    { private declarations }
    FdsBomba: TDataSource;
    Bomba : TBomba;
    procedure SetDados;
    procedure GetDados;
  public
    procedure Salvar(aBomba: TBomba);
    procedure Excluir();
    procedure SetDataSouceGrid(ADataSource: TDataSource);
    procedure Listar();
    procedure Editar();
  end;
implementation

uses ufBombaEditor;

procedure TBombaController.Editar;
begin
  if (not Assigned(frmBombaEditor)) then
    Application.CreateForm(TfrmBombaEditor, frmBombaEditor);
  GetDados;
  SetDados;
  frmBombaEditor.Show;
end;

procedure TBombaController.Excluir();
var
  BombaDAO: TBombaDAO;
begin
  try
    if (FdsBomba.DataSet.IsEmpty) then
      Exit;
    BombaDAO := TBombaDAO.Create;
    BombaDAO.Excluir(FdsBomba.DataSet.FieldByName('ID').AsInteger);
    FreeAndNil(BombaDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TBombaController.GetDados;
begin
  Bomba := TBomba.Create;
  Bomba.ID := FdsBomba.DataSet.FieldByName('ID').AsInteger;
  Bomba.DS_BOMBA := FdsBomba.DataSet.FieldByName('DS_BOMBA').AsString;
  Bomba.ID_TANQUE := FdsBomba.DataSet.FieldByName('ID_TANQUE').AsInteger;
end;

procedure TBombaController.Listar;
var
  BombaDAO: TBombaDAO;
begin
  try
    BombaDAO := TBombaDAO.Create;
    BombaDAO.Listar(FdsBomba);
    FreeAndNil(BombaDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TBombaController.Salvar(aBomba: TBomba);
var
  BombaDAO: TBombaDAO;
begin
  try
    BombaDAO := TBombaDAO.Create;
    BombaDAO.Salvar(aBomba);
    FreeAndNil(BombaDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TBombaController.SetDados;
begin
  frmBombaEditor.EditCodigo.Text := inttostr(Bomba.ID);
  frmBombaEditor.EditDS_BOMBA.Text := Bomba.DS_BOMBA;
  frmBombaEditor.ComboTanque.itemindex := Bomba.ID_TANQUE;
end;

procedure TBombaController.SetDataSouceGrid(ADataSource: TDataSource);
begin
  FdsBomba := ADataSource;
end;

end.
