unit AbastecimentoController;

interface

uses Abastecimento, AbastecimentoDAO, SysUtils, Data.DB, Vcl.Forms;

type
  TAbastecimentoController = class
  private
    { private declarations }
    FdsAbastecimento: TDataSource;
    Abastecimento: TAbastecimento;
    procedure SetDados;
    procedure GetDados;
  public
    procedure Salvar(aAbastecimento: TAbastecimento);
    procedure Excluir();
    procedure SetDataSouceGrid(ADataSource: TDataSource);
    procedure Listar();
    procedure Editar();
  end;
implementation


uses ufAbastecimentoEditor;

procedure TAbastecimentoController.Editar;
begin
  if (not Assigned(frmAbastecimentoEditor)) then
    Application.CreateForm(TfrmAbastecimentoEditor, frmAbastecimentoEditor);
  GetDados;
  SetDados;
  frmAbastecimentoEditor.Show;
end;

procedure TAbastecimentoController.Excluir();
var
  AbastecimentoDAO: TAbastecimentoDAO;
begin
  try
    if (FdsAbastecimento.DataSet.IsEmpty) then
      Exit;
    AbastecimentoDAO := TAbastecimentoDAO.Create;
    AbastecimentoDAO.Excluir(FdsAbastecimento.DataSet.FieldByName('ID').AsInteger);
    FreeAndNil(AbastecimentoDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TAbastecimentoController.GetDados;
begin
  Abastecimento := TAbastecimento.Create;
  Abastecimento.ID := FdsAbastecimento.DataSet.FieldByName('ID').AsInteger;
  Abastecimento.DT_ABASTECIMENTO := FdsAbastecimento.DataSet.FieldByName('DT_ABASTECIMENTO').AsDateTime;
  Abastecimento.ID_BOMBA := FdsAbastecimento.DataSet.FieldByName('ID_BOMBA').AsInteger;
  Abastecimento.NR_LITROS := FdsAbastecimento.DataSet.FieldByName('NR_LITROS').AsExtended;
  Abastecimento.VL_TOTAL :=  FdsAbastecimento.DataSet.FieldByName('VL_TOTAL').AsExtended;
  Abastecimento.VL_IMPOSTO := FdsAbastecimento.DataSet.FieldByName('VL_IMPOSTO').AsExtended;
end;

procedure TAbastecimentoController.Listar;
var
  AbastecimentoDAO: TAbastecimentoDAO;
begin
  try
    AbastecimentoDAO := TAbastecimentoDAO.Create;
    AbastecimentoDAO.Listar(FdsAbastecimento);
    FreeAndNil(AbastecimentoDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TAbastecimentoController.Salvar(aAbastecimento: TAbastecimento);
var
  AbastecimentoDAO: TAbastecimentoDAO;
begin
  try
    AbastecimentoDAO := TAbastecimentoDAO.Create;
    AbastecimentoDAO.Salvar(aAbastecimento);
    FreeAndNil(AbastecimentoDAO);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TAbastecimentoController.SetDados;
begin
  frmAbastecimentoEditor.EditCodigo.Text := inttostr(Abastecimento.ID);
  frmAbastecimentoEditor.edLitros.Value := Abastecimento.NR_LITROS;
  frmAbastecimentoEditor.edValor.Value := Abastecimento.VL_TOTAL;
  frmAbastecimentoEditor.edImposto.Value := Abastecimento.VL_IMPOSTO;
  frmAbastecimentoEditor.ComboBomba.ItemIndex := Abastecimento.ID_BOMBA;
end;

procedure TAbastecimentoController.SetDataSouceGrid(ADataSource: TDataSource);
begin
  FdsAbastecimento := ADataSource;
end;

end.