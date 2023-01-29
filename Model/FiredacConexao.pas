unit FiredacConexao;

interface

uses Conexao, FireDAC.Comp.Client, System.SysUtils;

type
  TFiredacConexao = class(TInterfacedObject, iConexao)
  private
    FConexao : TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iConexao;
    function Connection : TObject;
  end;

implementation

{ TFiredacConexao }

function TFiredacConexao.Connection: TObject;
begin
  Result := FConexao;
end;

constructor TFiredacConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FConexao.Params.DriverID := 'FB';
  FConexao.Params.Database := 'localhost/3050:C:\Users\Alexandre\Desktop\Teste Técnico\PostoABC.FDB';
  FConexao.Params.UserName := 'SYSDBA';
  FConexao.Params.Password := 'root';
  FConexao.Connected := true;
end;

destructor TFiredacConexao.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

class function TFiredacConexao.New: iConexao;
begin
  Result := Self.Create;
end;

end.
