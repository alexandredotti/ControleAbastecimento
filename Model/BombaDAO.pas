unit BombaDAO;

interface

uses Bomba, Conexao, System.SysUtils, Data.DB, Tanque;

type
  TBombaDAO = class(TInterfacedObject, iBomba)
  private
    { private declarations }
    FQuery : iQuery;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Salvar(aBomba: TBomba);
    procedure Excluir(aBomba: Integer);
    function Listar(ADataSource: TDataSource): iBomba;
  end;
implementation

uses
  FactoryConexao;

constructor TBombaDAO.Create;
begin
  FQuery := TFactoryConexao.New.Query;
end;

destructor TBombaDAO.Destroy;
begin
  inherited;
end;

procedure TBombaDAO.Salvar(aBomba: TBomba);
begin
  try
    if (aBomba.Id = 0) then
    begin
      FQuery.ExecSQL(
        Format('INSERT INTO BOMBA (DS_BOMBA, ID_TANQUE) VALUES (%S, %S)'
        ,[aBomba.DS_BOMBA, aBomba.ID_TANQUE]));
    end
    else
    begin
      FQuery.ExecSQL(
        Format('UPDATE BOMBA SET DS_BOMBA = %S, ID_TANQUE = %S WHERE ID = %S'
        ,[aBomba.DS_BOMBA, aBomba.ID_TANQUE, aBomba.ID]));
    end;

  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

procedure TBombaDAO.Excluir(aBomba: Integer);
begin
  try
    FQuery.ExecSQL(
      Format('DELETE FROM BOMBA WHERE ID = %S'
      ,[aBomba]));
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

function TBombaDAO.Listar(ADataSource: TDataSource): iBomba;
begin
  try
    Result := self;
    FQuery.ExecSQL('SELECT * FROM BOMBA');
    ADataSource.DataSet := FQuery.Query as TDataSet;
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

end.
