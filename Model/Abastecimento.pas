unit Abastecimento;

interface

uses Bomba;

type
  TAbastecimento = class
  private
    FID: Integer;
    FDT_ABASTECIMENTO: TDateTime;
    FID_BOMBA: Integer;
    FNR_LITROS: Currency;
    FVL_TOTAL: Currency;
    FVL_IMPOSTO: Currency;
    procedure SetID(const aValue: Integer);
    procedure SetDT_ABASTECIMENTO(const aValue: TDateTime);
    procedure SetID_BOMBA(const aValue: Integer);
    procedure SetNR_LITROS(const aValue: Currency);
    procedure SetVL_TOTAL(const aValue: Currency);
    procedure SetVL_IMPOSTO(const aValue: Currency);
  public
    property ID: Integer read FID write SetID;
    property DT_ABASTECIMENTO: TDateTime read FDT_ABASTECIMENTO write SetDT_ABASTECIMENTO;
    property ID_BOMBA: Integer read FID_BOMBA write SetID_BOMBA;
    property NR_LITROS: Currency read FNR_LITROS write SetNR_LITROS;
    property VL_TOTAL: Currency read FVL_TOTAL write SetVL_TOTAL;
    property VL_IMPOSTO: Currency read FVL_IMPOSTO write SetVL_IMPOSTO;
  end;
implementation
{ TAbastecimento }
procedure TAbastecimento.SetID(const aValue: Integer);
begin
  FID := aValue;
end;
procedure TAbastecimento.SetDT_ABASTECIMENTO(const aValue: TDateTime);
begin
  FDT_ABASTECIMENTO := aValue;
end;
procedure TAbastecimento.SetID_BOMBA(const aValue: Integer);
begin
  FID_BOMBA := aValue;
end;
procedure TAbastecimento.SetNR_LITROS(const aValue: Currency);
begin
  FNR_LITROS := aValue;
end;
procedure TAbastecimento.SetVL_TOTAL(const aValue: Currency);
begin
  FVL_TOTAL := aValue;
end;
procedure TAbastecimento.SetVL_IMPOSTO(const aValue: Currency);
begin
  FVL_IMPOSTO := aValue;
end;
end.
