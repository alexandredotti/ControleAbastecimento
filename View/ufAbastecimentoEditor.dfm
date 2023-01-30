inherited frmAbastecimentoEditor: TfrmAbastecimentoEditor
  Caption = 'Abastecimento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label3: TLabel [1]
      Left = 31
      Top = 66
      Width = 30
      Height = 13
      Caption = 'Litros:'
    end
    object Label4: TLabel [2]
      Left = 9
      Top = 93
      Width = 52
      Height = 13
      Caption = 'ValorTotal:'
    end
    object Label5: TLabel [3]
      Left = 18
      Top = 120
      Width = 43
      Height = 13
      Caption = 'Imposto:'
    end
    object Label2: TLabel [4]
      Left = 25
      Top = 43
      Width = 36
      Height = 13
      Caption = 'Bomba:'
    end
    object Label1: TLabel [5]
      Left = 379
      Top = 22
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    inherited Panel2: TPanel
      TabOrder = 5
      inherited btnSalvar: TButton
        OnClick = btnSalvarClick
      end
    end
    inherited EditCodigo: TEdit
      Width = 90
      TabOrder = 4
      ExplicitWidth = 90
    end
    object edLitros: TNumberBox
      Left = 63
      Top = 63
      Width = 90
      Height = 21
      CurrencyString = 'Lt'
      Mode = nbmCurrency
      MaxLength = 4
      TabOrder = 1
    end
    object edValor: TNumberBox
      Left = 63
      Top = 90
      Width = 90
      Height = 21
      Mode = nbmCurrency
      MaxLength = 4
      TabOrder = 2
      OnChangeValue = edValorChangeValue
    end
    object edImposto: TNumberBox
      Left = 63
      Top = 117
      Width = 90
      Height = 21
      Enabled = False
      Mode = nbmCurrency
      MaxLength = 4
      ReadOnly = True
      TabOrder = 3
    end
    object ComboBomba: TComboBox
      Left = 63
      Top = 40
      Width = 173
      Height = 21
      TabOrder = 0
    end
    object DT_ABASTECIMENTO: TDatePicker
      Left = 407
      Top = 13
      Width = 100
      Date = 44955.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 6
    end
  end
end
