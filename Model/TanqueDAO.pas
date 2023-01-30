unit TanqueDAO;

interface

uses Tanque, Conexao, System.SysUtils, Data.DB, System.Generics.Collections;

type
  TTanqueDAO = class(TInterfacedObject, iTanque)
  private
    { private declarations }
    FQuery : iQuery;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Salvar(aTanque: TTAnque);
    procedure Excluir(aID_Tanque: Integer);
    function Listar(ADataSource: TDataSource): iTanque;
    function GetList(): TList<TTanque>;
  end;
implementation

uses
  FactoryConexao;

constructor TTanqueDAO.Create;
begin
  FQuery := TFactoryConexao.New.Query;
end;

destructor TTanqueDAO.Destroy;
begin
  inherited;
end;

procedure TTanqueDAO.Salvar(aTanque: TTAnque);
var
  s: string;
begin
  try
    if (aTanque.Id = 0) then
    begin
      FQuery.ExecSQL(
        Format('INSERT INTO TANQUE (DS_TANQUE, TP_TANQUE) VALUES (%S, %d)'
        ,[QuotedStr(aTanque.DS_TANQUE), aTanque.TP_TANQUE]));
    end
    else
    begin
      s := Format('UPDATE TANQUE SET DS_TANQUE = %s, TP_TANQUE = %d WHERE ID = %d'
        ,[QuotedStr(aTanque.DS_TANQUE), aTanque.TP_TANQUE, aTanque.ID]);
      FQuery.ExecSQL(s);
    end;

  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

procedure TTanqueDAO.Excluir(aID_Tanque: Integer);
begin
  try
    FQuery.ExecSQL(
      Format('DELETE FROM TANQUE WHERE ID = %d'
      ,[aID_Tanque]));
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

function TTanqueDAO.Listar(ADataSource: TDataSource): iTanque;
begin
  try
    Result := self;
    FQuery.Open('SELECT * FROM TANQUE');
    ADataSource.DataSet := FQuery.Query as TDataSet;
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

function TTanqueDAO.GetList: TList<TTanque>;
var
  Tanque : TTanque;
begin
  Result := TList<TTanque>.Create;
   FQuery.Open('SELECT * FROM TANQUE');
  if (FQuery.Query as TDataSet).IsEmpty  then
    Exit;
  while (not (FQuery.Query as TDataSet).Eof) do
  begin
    Tanque := TTanque.Create;
    Tanque.ID := (FQuery.Query as TDataSet).FieldByName('ID').AsInteger;
    Tanque.DS_TANQUE := (FQuery.Query as TDataSet).FieldByName('DS_TANQUE').AsString;

    Result.Add(Tanque);

    (FQuery.Query as TDataSet).Next;
  end;
end;

end.
