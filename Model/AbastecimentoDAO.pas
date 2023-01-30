unit AbastecimentoDAO;

interface

uses Abastecimento, Conexao, System.SysUtils, Data.DB, Data.SqlExpr;

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
var
  s, vl_imposto, vl_total, nr_litros: string;
begin
  try
    vl_imposto := StringReplace(CurrToStr(aAbastecimento.VL_IMPOSTO), ',', '.',[rfReplaceAll]);
    vl_total := StringReplace(CurrToStr(aAbastecimento.VL_TOTAL), ',', '.',[rfReplaceAll]);
    nr_litros := StringReplace(CurrToStr(aAbastecimento.NR_LITROS), ',', '.',[rfReplaceAll]);

    if (aAbastecimento.Id = 0) then
    begin
      s := 'INSERT INTO ABASTECIMENTO (DT_ABASTECIMENTO, ID_BOMBA, NR_LITROS,'
        +' VL_TOTAL, VL_IMPOSTO) VALUES'
        +' ('+QuotedStr(FormatDateTime('yyyy/mm/dd',aAbastecimento.DT_ABASTECIMENTO))
        +','+inttostr(aAbastecimento.ID_BOMBA)
        +','+nr_litros
        +','+vl_total
        +','+vl_imposto+')';

      FQuery.ExecSQL(s);
    end
    else
    begin
      s := 'UPDATE ABASTECIMENTO SET DT_ABASTECIMENTO = '+QuotedStr(FormatDateTime('yyyy/mm/dd',aAbastecimento.DT_ABASTECIMENTO))
        +', ID_BOMBA = '+inttostr(aAbastecimento.ID_BOMBA)
        +', NR_LITROS = '+nr_litros
        +', VL_TOTAL = '+vl_total
        +', VL_IMPOSTO = '+vl_imposto
        +' WHERE ID = '+inttostr(aAbastecimento.ID);

      FQuery.ExecSQL(s);
    end;

  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

procedure TAbastecimentoDAO.Excluir(aAbastecimento: Integer);
begin
  try
    FQuery.ExecSQL(
      Format('DELETE FROM ABASTECIMENTO WHERE ID = %d'
      ,[aAbastecimento]));
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

function TAbastecimentoDAO.Listar(ADataSource: TDataSource): iAbastecimento;
begin
  try
    Result := self;
    FQuery.Open('SELECT * FROM ABASTECIMENTO');
    ADataSource.DataSet := FQuery.Query as TDataSet;
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

end.
