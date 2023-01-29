unit Bomba;

interface

uses Tanque, System.SysUtils;

type
  TBomba = class
  private
    FDS_BOMBA: String;
    FID: Integer;
    FID_TANQUE: Integer;
    procedure SetID(const aValue: Integer);
    procedure SetDS_BOMBA(const aValue: String);
    procedure SetID_TANQUE(const aValue: Integer);
  public
    property ID: Integer read FID write SetID;
    property DS_BOMBA: String read FDS_BOMBA write SetDS_BOMBA;
    property ID_TANQUE: Integer read FID_TANQUE write SetID_TANQUE;
    function ToString: String;
  end;
implementation
{ TBomba }
procedure TBomba.SetID(const aValue: Integer);
begin
  FID := aValue;
end;
procedure TBomba.SetDS_BOMBA(const aValue: String);
begin
  FDS_BOMBA := aValue;
end;
procedure TBomba.SetID_TANQUE(const aValue: Integer);
begin
  FID_TANQUE := aValue;
end;

function TBomba.ToString: String;
begin
  Result := Format('%d - %s', [Self.ID, Self.DS_BOMBA]);
end;

end.
