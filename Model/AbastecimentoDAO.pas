unit AbastecimentoDAO;

interface

uses Abastecimento, Conexao, System.SysUtils, Data.DB;

type
  TAbastecimentoDAO = class(TInterfacedObject, iAbastecimento)
  private
    { private declarations }
    FQuery : iQuery;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Salvar(aAbastecimento: TAbastecimento);
    procedure Excluir(aAbastecimento: Integer);
    function Listar(ADataSource: TDataSource): iAbastecimento;
  end;
implementation

uses
  FactoryConexao;

constructor TAbastecimentoDAO.Create;
begin
  FQuery := TFactoryConexao.New.Query;
end;

destructor TAbastecimentoDAO.Destroy;
begin
  inherited;
end;

procedure TAbastecimentoDAO.Salvar(aAbastecimento: TAbastecimento);
begin
  try
    if (aAbastecimento.Id = 0) then
    begin
      FQuery.ExecSQL(
        Format('INSERT INTO ABASTECIMENTO (DT_ABASTECIMENTO, ID_BOMBA, NR_LITROS,'
        +' VL_TOTAL, VL_IMPOSTO) VALUES (%S, %S, %S, %S, %S)'
        ,[aAbastecimento.DT_ABASTECIMENTO, aAbastecimento.ID_BOMBA,
        aAbastecimento.NR_LITROS, aAbastecimento.VL_TOTAL, aAbastecimento.VL_IMPOSTO]));
    end
    else
    begin
      FQuery.ExecSQL(
        Format('UPDATE ABASTECIMENTO SET DT_ABASTECIMENTO = %S, ID_BOMBA = %S,'
        +' NR_LITROS = %S, VL_TOTAL = %S, VL_IMPOSTO = %S WHERE ID = %S'
        ,[aAbastecimento.DT_ABASTECIMENTO, aAbastecimento.ID_BOMBA,
        aAbastecimento.NR_LITROS, aAbastecimento.VL_TOTAL, aAbastecimento.VL_IMPOSTO
        ,aAbastecimento.ID]));
    end;

  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

procedure TAbastecimentoDAO.Excluir(aAbastecimento: Integer);
begin
  try
    FQuery.ExecSQL(
      Format('DELETE FROM ABASTECIMENTO WHERE ID = %S'
      ,[aAbastecimento]));
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

function TAbastecimentoDAO.Listar(ADataSource: TDataSource): iAbastecimento;
begin
  try
    Result := self;
    FQuery.ExecSQL('SELECT * FROM ABASTECIMENTO');
    ADataSource.DataSet := FQuery.Query as TDataSet;
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

end.
