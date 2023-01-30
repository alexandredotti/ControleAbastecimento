inherited frmAbastecimento: TfrmAbastecimento
  Caption = 'Abastecimento'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      ExplicitLeft = 2
      ExplicitTop = -5
      inherited btnNovo: TButton
        OnClick = btnNovoClick
      end
      inherited btnEditar: TButton
        OnClick = btnEditarClick
      end
      inherited btnExcluir: TButton
        OnClick = btnExcluirClick
      end
      object btnRelatorio: TButton
        Left = 512
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Relat'#243'rio'
        TabOrder = 3
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
          FieldName = 'DT_ABASTECIMENTO'
          Title.Caption = 'Data'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_LITROS'
          Title.Caption = 'Litros'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_TOTAL'
          Title.Caption = 'Valor Total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_IMPOSTO'
          Title.Caption = 'Valor Imposto'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_BOMBA'
          Title.Caption = 'Bomba'
          Visible = True
        end>
    end
  end
end
