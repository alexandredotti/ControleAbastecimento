program PostoABC;

uses
  Vcl.Forms,
  Principal in 'View\Principal.pas' {frmPrincipal},
  Conexao in 'Model\Conexao.pas',
  FiredacQuery in 'Model\FiredacQuery.pas',
  Tanque in 'Model\Tanque.pas',
  Bomba in 'Model\Bomba.pas',
  Abastecimento in 'Model\Abastecimento.pas',
  TanqueDAO in 'Model\TanqueDAO.pas' {$R *.res},
  FactoryConexao in 'Model\FactoryConexao.pas',
  FiredacConexao in 'Model\FiredacConexao.pas',
  BombaDAO in 'Model\BombaDAO.pas',
  AbastecimentoDAO in 'Model\AbastecimentoDAO.pas',
  TanqueController in 'Controller\TanqueController.pas',
  BombaController in 'Controller\BombaController.pas',
  AbastecimentoController in 'Controller\AbastecimentoController.pas',
  ufConsultaBase in 'View\ufConsultaBase.pas' {frmConsultaBase},
  ufEditorBase in 'View\ufEditorBase.pas' {frmEditorBase},
  ufTanque in 'View\ufTanque.pas' {frmTanque},
  ufTanqueEditor in 'View\ufTanqueEditor.pas' {frmTanqueEditor},
  ufBomba in 'View\ufBomba.pas' {frmBomba},
  ufBombaEditor in 'View\ufBombaEditor.pas' {frmBombaEditor},
  ufAbastecimento in 'View\ufAbastecimento.pas' {frmAbastecimento},
  ufAbastecimentoEditor in 'View\ufAbastecimentoEditor.pas' {frmAbastecimentoEditor},
  ufImpressaoAbastecimentos in 'View\ufImpressaoAbastecimentos.pas' {frmImpressaoAbastecimentos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmImpressaoAbastecimentos, frmImpressaoAbastecimentos);
  Application.Run;
end.
