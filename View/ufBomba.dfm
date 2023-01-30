inherited frmBomba: TfrmBomba
  Caption = 'Bomba'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited btnNovo: TButton
        OnClick = btnNovoClick
      end
      inherited btnEditar: TButton
        OnClick = btnEditarClick
      end
      inherited btnExcluir: TButton
        OnClick = btnExcluirClick
      end
    end
    inherited gdDados: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_BOMBA'
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_TANQUE'
          Title.Caption = 'Tanque'
          Visible = True
        end>
    end
  end
end
