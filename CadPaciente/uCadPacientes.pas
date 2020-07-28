unit uCadPacientes;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls, MaskEdit, Spin, ECGroupCtrls,
   rxctrls, DateTimePicker, BCPanel, BCButton, RTTICtrls, ExCheckCtrls, uClassPaciente, uClassResponsavelPaciente,
   uClassSinaisSintomas, uClassEnfermidades, uClassEndereco, uClassContatos, uClassAnamnese, uClassDadosProfissionais;

type

   { TfrmCadPaciente }

   TfrmCadPaciente = class(TForm)
      bvContatos: TBevel;
      bvDadosBasicos: TBevel;
      bvEndereco: TBevel;
      bvEndereco1: TBevel;
      bvResponsavel: TBevel;
      bvSinaisSintomas: TBevel;
      bvSinaisSintomas1: TBevel;
      cboxConsAcucar: TComboBox;
      cboxFioDental: TComboBox;
      cboxEscovacao: TComboBox;
      cboxEstCivil: TComboBox;
      cboxOperadoraCasa: TComboBox;
      cboxOperadoraCel1: TComboBox;
      cboxOperadoraCel2: TComboBox;
      cboxOperadoraTelRecado: TComboBox;
      cboxOperadoraTelTrab: TComboBox;
      cboxUFCasa: TComboBox;
      cboxUFEmpresa: TComboBox;
      cboxUFNascimento: TComboBox;
      chkboxAtivo: TCheckBox;
      dtpkNascimento: TDateTimePicker;
      edtAntecFamiliar: TEdit;
      edtBairro: TEdit;
      edtBairroEmpresa: TEdit;
      edtCargo: TEdit;
      edtCidade: TEdit;
      edtCidadeEmpresa: TEdit;
      edtCodPaciente: TEdit;
      edtComplemento: TEdit;
      edtComplEmpresa: TEdit;
      edtDDDCasa: TEdit;
      edtDDDCel1: TEdit;
      edtDDDCel2: TEdit;
      edtDDDTelRecado: TEdit;
      edtDDDTelTrab: TEdit;
      edtHabitosViciosos: TEdit;
      edtIdentidadePaciente: TEdit;
      edtIdentidadeResp: TEdit;
      edtIdentidadeResp1: TEdit;
      edtLogradEmpresa: TEdit;
      edtLogradouro: TEdit;
      edtEmail: TEdit;
      edtNacionalidade: TEdit;
      edtNaturalidade: TEdit;
      edtNomeConjuge: TEdit;
      edtNomeEmpresa: TEdit;
      edtNomeMae: TEdit;
      edtNomePaciente: TEdit;
      edtNomePai: TEdit;
      edtNomeResp: TEdit;
      edtNumEndEmpresa: TEdit;
      edtApreensivoTratamento: TEdit;
      edtMenopausa: TEdit;
      edtTratamentoMedico: TEdit;
      edtTomaRemedio: TEdit;
      edtAlergiaAnestesia: TEdit;
      edtAlgumaAlergia: TEdit;
      edtFoiHospitalizado: TEdit;
      edtTaGravida: TEdit;
      edtNumEndereco: TEdit;
      edtOrgaoExpedidorResp1: TEdit;
      edtOrgaoExpedPaciente: TEdit;
      edtOrgaoExpedResp: TEdit;
      edtParentesco: TEdit;
      edtPessoaRecado: TEdit;
      gbApreensivoTrat: TGroupBox;
      gbQtdFilhos: TGroupBox;
      gbMenopausa: TGroupBox;
      gbTratMedico: TGroupBox;
      gbTomaRemedio: TGroupBox;
      gbAlergiaAnestesia: TGroupBox;
      gbAlgumaAlergia: TGroupBox;
      gbHospitalizado: TGroupBox;
      gbTaGravida: TGroupBox;
      gbQtdGravidez: TGroupBox;
      lblAids: TLabel;
      lblDisritmiaEpilepsia: TLabel;
      lblUlceraHepatica: TLabel;
      lblTuberculose: TLabel;
      lblSinusite: TLabel;
      lblSifilis: TLabel;
      lblProblemaHormonal: TLabel;
      lblIctericia: TLabel;
      lblHepatite: TLabel;
      lblHemofilia: TLabel;
      lblHanseniase: TLabel;
      lblGonorreia: TLabel;
      lblGlaucoma: TLabel;
      lblFebreReumatica: TLabel;
      lblDoencaRenal: TLabel;
      lblTumorBoca: TLabel;
      lblDoencaCoracao: TLabel;
      lblDiabetes: TLabel;
      lblAsma: TLabel;
      lblAnemia: TLabel;
      lblPoucaSaliva: TLabel;
      lblTonturaDesmaio: TLabel;
      lblSangramentoAnormal: TLabel;
      lblRespiraPelaBoca: TLabel;
      lblRangeDentes: TLabel;
      lblMiccaoFrequente: TLabel;
      lblMaCicatrizacao: TLabel;
      lblIndigestaoFrequente: TLabel;
      lblFebreFrequente: TLabel;
      lblEstaloMandibula: TLabel;
      lblEmagrecimentoAcentuado: TLabel;
      lblDorOuvidoFrequente: TLabel;
      lblDorCabecaFrequente: TLabel;
      lblDorFacial: TLabel;
      lblDificuldadeMastigar: TLabel;
      lblDificuldadeEngolir: TLabel;
      lblCoceiraAnormal: TLabel;
      lblCansaFacil: TLabel;
      lblAntecFamiliar: TLabel;
      lblApreensivoTrat: TLabel;
      lblQualAlergia: TLabel;
      lblHospitalizado: TLabel;
      lblPQFoiHospitalizado: TLabel;
      lblTaGravida: TLabel;
      lblPrevisaoParto: TLabel;
      lblQtdGravidez: TLabel;
      lblQtdFilhos: TLabel;
      lblMenopausa: TLabel;
      lblPQApreensivoTrat: TLabel;
      lblQuandoMenopausa: TLabel;
      lblTratMedico: TLabel;
      lblQualTratMedico: TLabel;
      lblTomaRemedio: TLabel;
      lblTomaQualRemedio: TLabel;
      lblAlergiaAnestesia: TLabel;
      lblAlergiaQualAnestesia: TLabel;
      lblAlgumaAlergia: TLabel;
      lblBairro: TLabel;
      lblBairroEmpresa: TLabel;
      lblCargo: TLabel;
      lblCel1: TLabel;
      lblCelular2: TLabel;
      lblCEPCasa: TLabel;
      lblCEPEmpresa: TLabel;
      lblCidade: TLabel;
      lblCidadeEmpresea: TLabel;
      lblCodigoPaciente: TLabel;
      lblComplemento: TLabel;
      lblComplEmpresa: TLabel;
      lblConsAcucar: TLabel;
      lblCPFPaciente: TLabel;
      lblCPFResp: TLabel;
      lblCPFResp1: TLabel;
      lblDDDCasa: TLabel;
      lblDDDCel1: TLabel;
      lblDDDCel2: TLabel;
      lblDDDTelRecado: TLabel;
      lblDDDTelTrab: TLabel;
      lblDtNascimento: TLabel;
      lblEscovacao: TLabel;
      lblEstadoCivil: TLabel;
      lblHabitosViciosos: TLabel;
      lblIdentidadePaciente: TLabel;
      lblIdentidadeResp: TLabel;
      lblIdentidadeResp1: TLabel;
      lblLogradEmpresa: TLabel;
      lblLogradouro: TLabel;
      lblEmail: TLabel;
      lblMae: TLabel;
      lblNacionalidade: TLabel;
      lblNaturalidade: TLabel;
      lblNomeConjuge: TLabel;
      lblNomeEmpresa: TLabel;
      lblNomeResponsavel: TLabel;
      lblNumEndEmpresa: TLabel;
      lblNumEndereco: TLabel;
      lblObsAnatHistPatol: TLabel;
      lblOperadoraCasa: TLabel;
      lblOperadoraCel: TLabel;
      lblOperadoraTelTrab: TLabel;
      lblOperadorCel2: TLabel;
      lblOperadorTelRecado: TLabel;
      lblOrgaoExpedidorResp1: TLabel;
      lblOrgaoExpedPaciente: TLabel;
      lblOrgaoExpResp: TLabel;
      lblPaciente: TLabel;
      lblPai: TLabel;
      lblParaDataVazia: TLabel;
      lblParentesco: TLabel;
      lblPessoaRecado: TLabel;
      lblSexo: TLabel;
      lblAlteracaoPetite: TLabel;
      lblCalorExagerado: TLabel;
      lblTelCasa: TLabel;
      lblTelRecado: TLabel;
      lblTelTrab: TLabel;
      lblUF: TLabel;
      lblUFCasa: TLabel;
      lblUFEmpresa: TLabel;
      lblUsoFioDental: TLabel;
      memoObsAnatHistPatol: TMemo;
      mskedtCEPCasa: TMaskEdit;
      mskedtCEPEmpresa: TMaskEdit;
      mskedtCPFPaciente: TMaskEdit;
      mskedtCPFResp: TMaskEdit;
      mskedtTelCasa: TMaskEdit;
      btnAlteraCadastro: TBitBtn;
      btnApagaCadastro: TBitBtn;
      btnGravaCadastro: TBitBtn;
      btnCancelaCadastro: TBitBtn;
      btnSaiCadastro: TBitBtn;
      edtOrgaoExpedidorResp: TEdit;
      lblOrgaoExpedidorResp: TLabel;
      lblNomeResp: TLabel;
      lblIdade: TLabel;
      lblCodPaciente: TLabel;
      lblNomePaciente: TLabel;
      miglstCadPaciente: TImageList;
      mskedtCel1: TMaskEdit;
      mskedtCel2: TMaskEdit;
      mskedtTelRecado: TMaskEdit;
      mskedtTelTrab: TMaskEdit;
      pcCadPaciente: TPageControl;
      pnlAnamnese: TBCPanel;
      pnlBotoes: TBCPanel;
      btnNovoCadastro: TBitBtn;
      btnFechar: TBCButton;
      imgLogoTitulo: TImage;
      pnlCadPaciente: TBCPanel;
      pnlCodigoNomeIdade: TBCPanel;
      pnlContatos: TBCPanel;
      pnlDadosBasicos: TBCPanel;
      pnlDadosProfissionais: TBCPanel;
      pnlEndereco: TBCPanel;
      pnlEnfermidades: TBCPanel;
      pnlResponsavel: TBCPanel;
      pnlSinaisSintomas: TBCPanel;
      pnlTitulo: TBCPanel;
      btnProcuraPaciente: TSpeedButton;
      rbexNaoMenopausa: TRadioButtonEx;
      rbexNaoTaGravida: TRadioButtonEx;
      rbexNaoTomaRemedio: TRadioButtonEx;
      rbexNaoAlergiaAnestesia: TRadioButtonEx;
      rbexNaoAlgumaAlergia: TRadioButtonEx;
      rbexNaoFoiHospitalizado: TRadioButtonEx;
      rbexNaoTratMedico: TRadioButtonEx;
      rbexSimApreesTratDent: TRadioButtonEx;
      rbexNaoApreesTratDent: TRadioButtonEx;
      rbexSimMenopausa: TRadioButtonEx;
      rbexSimTaGravida: TRadioButtonEx;
      rbexSimTomaRemedio: TRadioButtonEx;
      rbexSimAlergiaAnestesia: TRadioButtonEx;
      rbexSimAlgumaAlergia: TRadioButtonEx;
      rbexSimFoiHospitalizado: TRadioButtonEx;
      rbexSimTratMedico: TRadioButtonEx;
      rgexDisritmiaEpilepsia: TRadioGroupEx;
      rgexUlceraHepatica: TRadioGroupEx;
      rgexTuberculose: TRadioGroupEx;
      rgexSinusite: TRadioGroupEx;
      rgexSifilis: TRadioGroupEx;
      rgexProblemaHormonal: TRadioGroupEx;
      rgexIctericia: TRadioGroupEx;
      rgexHepatite: TRadioGroupEx;
      rgexHemofilia: TRadioGroupEx;
      rgexHanseniase: TRadioGroupEx;
      rgexGonorreia: TRadioGroupEx;
      rgexGlaucoma: TRadioGroupEx;
      rgexFebreReumatica: TRadioGroupEx;
      rgexDoencaRenal: TRadioGroupEx;
      rgexTumorBoca: TRadioGroupEx;
      rgexDoencaCoracao: TRadioGroupEx;
      rgexDiabetes: TRadioGroupEx;
      rgexAsma: TRadioGroupEx;
      rgexAnemia: TRadioGroupEx;
      rgexAlteracaoApetite: TRadioGroupEx;
      rgexAids: TRadioGroupEx;
      rgexPoucaSaliva: TRadioGroupEx;
      rgexTonturasDesmaios: TRadioGroupEx;
      rgexSangramentoAnormal: TRadioGroupEx;
      rgexRespiraPelaBoca: TRadioGroupEx;
      rgexRangeDentes: TRadioGroupEx;
      rgexMiccaoFrequente: TRadioGroupEx;
      rgexMaCicatrizacao: TRadioGroupEx;
      rgexIndigestaoFrequente: TRadioGroupEx;
      rgexFebreFrequente: TRadioGroupEx;
      rgexEstaloMandibula: TRadioGroupEx;
      rgexEmagrecimentoAcentuado: TRadioGroupEx;
      rgexDorOuvidoFrequente: TRadioGroupEx;
      rgexDorCabecaFrequente: TRadioGroupEx;
      rgexDorFacial: TRadioGroupEx;
      rgexDificuldadeMastigar: TRadioGroupEx;
      rgexCansaFacil: TRadioGroupEx;
      rgexDificuldadeEngolir: TRadioGroupEx;
      rgexCoceiraAnormal: TRadioGroupEx;
      rgexCalorExagerado: TRadioGroupEx;
      rgexSexo: TRadioGroupEx;
      scrboxAnamnese: TScrollBox;
      spedtQtdGravidez: TSpinEdit;
      spedtQtdFilhos: TSpinEdit;
      tabAnamnese: TTabSheet;
      tabContatos: TTabSheet;
      tabDadosBasicos: TTabSheet;
      tabDadosProfissionais: TTabSheet;
      tabEndereco: TTabSheet;
      tabEnfermidades: TTabSheet;
      tabResponsavel: TTabSheet;
      tabSinaisSintomas: TTabSheet;
      procedure btnAlteraCadastroClick(Sender: TObject);
      procedure btnApagaCadastroClick(Sender: TObject);
      procedure btnCancelaCadastroClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnGravaCadastroClick(Sender: TObject);
      procedure btnNovoCadastroClick(Sender: TObject);
      procedure btnProcuraPacienteClick(Sender: TObject);
      procedure cboxEstCivilChange(Sender: TObject);
      procedure edtCodPacienteChange(Sender: TObject);
      procedure edtNomePacienteChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure mskedtCel1Enter(Sender: TObject);
      procedure mskedtCel1Exit(Sender: TObject);
      procedure mskedtCel2Enter(Sender: TObject);
      procedure mskedtCel2Exit(Sender: TObject);
      procedure mskedtTelCasaEnter(Sender: TObject);
      procedure mskedtTelCasaExit(Sender: TObject);
      procedure mskedtTelRecadoEnter(Sender: TObject);
      procedure mskedtTelRecadoExit(Sender: TObject);
      procedure mskedtTelTrabEnter(Sender: TObject);
      procedure mskedtTelTrabExit(Sender: TObject);
      procedure pcCadPacienteChange(Sender: TObject);
      procedure pcCadPacienteChanging(Sender: TObject; var AllowChange: Boolean);
      procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   private
      procedure HabilitaControles(controle: TWinControl);
      procedure DesabilitaControles(controle: TWinControl);
      procedure EstadoBotoes;

      procedure LimpaControles(controle: TWinControl);

      function RetornoMascaraContatos(tamanho: integer): string;

      procedure DesabilitaTemaRadioButtonEX(Sender: TObject);

      procedure CasoHomem;

      {================================= FUNÇÕES E PROCEDIMENTOS DE CADASTRO  ====================================================}

      procedure EdicaoDadosBasicos(objPaciente: TPaciente);

   public
      function RetornoRadioGroup(ItemIndex: integer): string;
      procedure PreencheFormDadosBasicos(objDados: TPaciente);
      procedure PreencheFormResponsavel(idPaciente: integer);
   end;

   TipoEstado = (teNavegacao, teInclusao, teEdicao);

var
   frmCadPaciente: TfrmCadPaciente;
   capitura : boolean = false;
   px, py : integer;
   estado : TipoEstado = teNavegacao;    // teNavegacao, teInclusao, teEdicao
   objDadosBasicos : TPaciente;
   objDadosBasicosAntesAlteracao : TPaciente;

implementation

uses
   uClassControlePaciente, uFrmMensagem, uDadosBasicos, uResponsavel, uEndereco, uContatos, uDadoProfissional, uAnamnese,
   uSinaisSintomas, uEnfermidades;


{$R *.lfm}

{ TfrmCadPaciente }

procedure TfrmCadPaciente.btnFecharClick(Sender: TObject);
var
   frmMensagem : TfrmMensagem;
begin
   if estado in [teInclusao, teEdicao] then
      try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('A T E N Ç Ã O', tiInformacao, 'Você deve cancelar ou gravar o registro antes de sair!');
      finally
         FreeAndNil(frmMensagem);
      end
   else
      frmCadPaciente.Close;
end;

procedure TfrmCadPaciente.btnGravaCadastroClick(Sender: TObject);
begin
   case pcCadPaciente.ActivePageIndex of
      0 : begin
             if estado in [teInclusao] then
                DadosBasicos.InclusaoDadosBasicos(Self)
             else if estado in [teEdicao] then
             begin
                objDadosBasicos := DadosBasicos.CarregaObjDadosBasicos(objDadosBasicos, Self);
                EdicaoDadosBasicos(objDadosBasicos);
             end;
          end;
      1 : begin
             if estado in [teInclusao] then
                Responsavel.InclusaoResponsavel(Self);
          end;

      2 : begin
             if estado in [teInclusao] then
                Endereco.InclusaoEndereco(Self);
          end;

      3 : begin
             if estado in [teInclusao] then
                Contatos.InclusaoContatos(Self);
          end;

      4 : begin
             if estado in [teInclusao] then
                DadosProfissionais.InclusaoDadoProfissional(Self);
          end;

      5 : begin
          if estado in [teInclusao] then
             Anamnese.InclusaoAnamnese(Self);
          end;

      6 : begin
             if estado in [teInclusao] then
                SinaisSintomas.InclusaoSinaisSintomas(Self);
          end;

      7 : begin
             if estado in [teInclusao] then
                Enfermidades.InclusaoEnfermidades(Self);
          end;
   end;



end;

procedure TfrmCadPaciente.btnCancelaCadastroClick(Sender: TObject);
begin
   if estado in [teEdicao] then
    begin
      PreencheFormDadosBasicos(objDadosBasicosAntesAlteracao);
      FreeAndNil(objDadosBasicosAntesAlteracao);
    end
   else
      LimpaControles(pcCadPaciente.ActivePage);

   estado := teNavegacao;
   //EstadoBotoes;
   DesabilitaControles(pcCadPaciente.ActivePage);
end;

procedure TfrmCadPaciente.btnAlteraCadastroClick(Sender: TObject);
begin
   estado := teEdicao;
   //EstadoBotoes;
   HabilitaControles(pcCadPaciente.ActivePage);
   objDadosBasicosAntesAlteracao := TPaciente.Create;
   objDadosBasicosAntesAlteracao := DadosBasicos.CarregaObjDadosBasicos(objDadosBasicosAntesAlteracao, Self);
end;

procedure TfrmCadPaciente.btnApagaCadastroClick(Sender: TObject);
var
   objControlePaciente : TControlePaciente;
   frmMensagem : TfrmMensagem;
begin
   frmMensagem := TfrmMensagem.Create(Self);
   frmMensagem.InfoFormMensagem('Apagar Registro?', tiDuvida, 'Tem certeza que você deseja apagar o cadastro de:' + LineEnding +
                  edtNomePaciente.Text + '?');

   if frmMensagem.resultadoBtn = mrOK then
    begin
       objControlePaciente := TControlePaciente.Create;
       try
          if objControlePaciente.ApagarCadastroBasico(StrToInt(edtCodPaciente.Text)) then
           begin
             frmMensagem.InfoFormMensagem('I N F O R M A Ç Ã O',tiInformacao, 'O Cadastro foi apagado com sucesso.');

             LimpaControles(pcCadPaciente.ActivePage);
             //EstadoBotoes;
             DesabilitaControles(pcCadPaciente.ActivePage);
           end;
       finally
          FreeAndNil(objControlePaciente);
       end;
    end;
    FreeAndNil(frmMensagem);
end;

procedure TfrmCadPaciente.btnNovoCadastroClick(Sender: TObject);
begin
   estado := teInclusao;
   HabilitaControles(pcCadPaciente.ActivePage);
   //EstadoBotoes;
   LimpaControles(pcCadPaciente.ActivePage);
   if pcCadPaciente.PageIndex = 0 then
   begin
      lblCodPaciente.Caption := 'Código: ';
      lblNomePaciente.Caption := 'Nome do Paciente: ';
      lblIdade.Caption := 'Idade: ';
      if pcCadPaciente.PageIndex = 0 then
      begin
         chkboxAtivo.Checked := true;
         edtNomePaciente.SetFocus;
      end;
   end;
   if rgexSexo.ItemIndex = 1 then
      CasoHomem;
end;

procedure TfrmCadPaciente.btnProcuraPacienteClick(Sender: TObject);
var
   objControlePaciente : TControlePaciente;
begin
   try
      objControlePaciente := TControlePaciente.Create;
      objControlePaciente.ChamaLocalizar;
   finally
      FreeAndNil(objControlePaciente);
   end;
end;

procedure TfrmCadPaciente.cboxEstCivilChange(Sender: TObject);
begin
   if cboxEstCivil.Text = 'Solteiro(a)' then
      edtNomeConjuge.Enabled := true
   else
    begin
       edtNomeConjuge.Clear;
       edtNomeConjuge.Enabled := false;
    end;
end;

procedure TfrmCadPaciente.edtCodPacienteChange(Sender: TObject);
begin
   if edtCodPaciente.GetTextLen > 5 then
      exit
   else
   begin
      edtCodPaciente.Text := LeftStr('0', 1) + edtCodPaciente.Text; // A IDÉIA É PREENCHER COM ZEROS A ESQUERDA O CÓDIGO DO PACIENTE.
      if edtCodPaciente.Text = EmptyStr then
      begin
         btnAlteraCadastro.Enabled := false;
         btnApagaCadastro.Enabled := false;
      end
      else
      begin
         btnAlteraCadastro.Enabled := true;
         btnApagaCadastro.Enabled := true;
      end;
   end;
end;

procedure TfrmCadPaciente.edtNomePacienteChange(Sender: TObject);
begin
   lblNomePaciente.Caption := 'Nome do Paciente: ' + edtNomePaciente.Text;
end;

procedure TfrmCadPaciente.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   FreeAndNil(objDadosBasicos);
end;

procedure TfrmCadPaciente.FormCreate(Sender: TObject);
begin
   objDadosBasicos := TPaciente.Create;
end;

procedure TfrmCadPaciente.FormShow(Sender: TObject);
var
   objControlePaciente : TControlePaciente;
begin
   pcCadPaciente.TabIndex := 0;
   try
      objControlePaciente := TControlePaciente.Create;
      if objControlePaciente.TblPacienteVazia = true then
      begin
         btnProcuraPaciente.Enabled := false;
         btnAlteraCadastro.Enabled := false;
         btnApagaCadastro.Enabled := false;
      end;
   finally
      FreeAndNil(objControlePaciente);
   end;
   DesabilitaTemaRadioButtonEX(Sender);
end;

procedure TfrmCadPaciente.mskedtCel1Enter(Sender: TObject);
var
   telefone: string;
begin
   telefone := mskedtCel1.Text;
   mskedtCel1.EditMask := EmptyStr;
   mskedtCel1.MaxLength := 10;
   mskedtCel1.Text := telefone;
end;

procedure TfrmCadPaciente.mskedtCel1Exit(Sender: TObject);
var
   telefone: string;
begin
   telefone := mskedtCel1.Text;
   mskedtCel1.EditMask := RetornoMascaraContatos(Length(mskedtCel1.Text));
   mskedtCel1.Text := telefone;
end;

procedure TfrmCadPaciente.mskedtCel2Enter(Sender: TObject);
var
   telefone: string;
begin
   telefone := mskedtCel2.Text;
   mskedtCel2.EditMask := EmptyStr;
   mskedtCel2.MaxLength := 10;
   mskedtCel2.Text := telefone;
end;

procedure TfrmCadPaciente.mskedtCel2Exit(Sender: TObject);
var
   telefone: string;
begin
   telefone := mskedtCel2.Text;
   mskedtCel2.EditMask := RetornoMascaraContatos(Length(mskedtCel2.Text));
   mskedtCel2.Text := telefone;
end;

procedure TfrmCadPaciente.mskedtTelCasaEnter(Sender: TObject);
var
   telefone: string;
begin
   telefone := mskedtTelCasa.Text;
   mskedtTelCasa.EditMask := EmptyStr;
   mskedtTelCasa.MaxLength := 9;
   mskedtTelCasa.Text := telefone;
end;

procedure TfrmCadPaciente.mskedtTelCasaExit(Sender: TObject);
var
   telefone: string;
begin
   telefone := mskedtTelCasa.Text;
   mskedtTelCasa.EditMask := RetornoMascaraContatos(Length(mskedtTelCasa.Text));
   mskedtTelCasa.Text := telefone;
end;

procedure TfrmCadPaciente.mskedtTelRecadoEnter(Sender: TObject);
var
   telefone: string;
begin
   telefone := mskedtTelRecado.Text;
   mskedtTelRecado.EditMask := EmptyStr;
   mskedtTelRecado.MaxLength := 10;
   mskedtTelRecado.Text := telefone;
end;

procedure TfrmCadPaciente.mskedtTelRecadoExit(Sender: TObject);
var
   telefone: string;
begin
   telefone := mskedtTelRecado.Text;
   mskedtTelRecado.EditMask := RetornoMascaraContatos(Length(mskedtTelRecado.Text));
   mskedtTelRecado.Text := telefone;
end;

procedure TfrmCadPaciente.mskedtTelTrabEnter(Sender: TObject);
var
   telefone: string;
begin
   telefone := mskedtTelTrab.Text;
   mskedtTelTrab.EditMask := EmptyStr;
   mskedtTelTrab.MaxLength := 9;
   mskedtTelTrab.Text := telefone;
end;

procedure TfrmCadPaciente.mskedtTelTrabExit(Sender: TObject);
var
   telefone: string;
begin
   telefone := mskedtTelTrab.Text;
   mskedtTelTrab.EditMask := RetornoMascaraContatos(Length(mskedtTelTrab.Text));
   mskedtTelTrab.Text := telefone;
end;

procedure TfrmCadPaciente.pcCadPacienteChange(Sender: TObject);
begin
   if pcCadPaciente.ActivePage = tabAnamnese then
   begin
      frmCadPaciente.Height := Screen.WorkAreaHeight;
      frmCadPaciente.Top := 0;
   end
   else
   begin
       frmCadPaciente.Height := 547;
       frmCadPaciente.Top := (Screen.WorkAreaHeight div 2 - frmCadPaciente.Height div 2) + 14;
   end;
   //EstadoBotoes;
end;

procedure TfrmCadPaciente.pcCadPacienteChanging(Sender: TObject; var AllowChange: Boolean);
begin
   if estado in [teEdicao, teInclusao] then
   begin
      AllowChange := false;
      try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('A T E N Ç Ã O', tiInformacao, 'Você deve gravar ou cancelar a operação atual');
      finally
         FreeAndNil(frmMensagem);
      end;

   end;
end;

procedure TfrmCadPaciente.pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   capitura := true;
   if capitura then
   begin
      px := X;
      py := Y;
   end;
end;

procedure TfrmCadPaciente.pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   if capitura then
   begin
      Left := (Left + X) - px;
      Top := (Top + Y) - py;
   end;
end;

procedure TfrmCadPaciente.pnlTituloMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   capitura := false;
end;

procedure TfrmCadPaciente.HabilitaControles(controle: TWinControl);
begin
    if controle is TTabSheet then
      HabilitaControles(TWinControl(controle.Controls[0]))      {*******************************************************************}
   else                                                         {**   Identificar qual o TabSheet, seus controles internos, para  **}
   if controle is TScrollBox then                               {**                então habilitar o Panel                        **}
      HabilitaControles(TWinControl(controle.Controls[0]))      {*******************************************************************}
   else
   if controle is TBCPanel then
      TBCPanel(controle).Enabled := true;
end;

procedure TfrmCadPaciente.DesabilitaControles(controle: TWinControl);
begin
   if controle is TTabSheet then
      DesabilitaControles(TWinControl(controle.Controls[0]))   {*******************************************************************}
   else                                                        {**   Identificar qual o TabSheet, seus controles internos, para  **}
   if controle is TScrollBox then                              {**                então desabilitar o Panel                      **}
      DesabilitaControles(TWinControl(controle.Controls[0]))   {*******************************************************************}
   else
   if controle is TBCPanel then
      TBCPanel(controle).Enabled := false;
end;

procedure TfrmCadPaciente.EstadoBotoes;
begin
   if (estado = teInclusao) OR (estado = teEdicao) then
   begin
      btnNovoCadastro.Enabled := false;
      btnAlteraCadastro.Enabled := false;
      btnApagaCadastro.Enabled := false;
      btnGravaCadastro.Enabled := true;
      btnCancelaCadastro.Enabled := true;
      btnProcuraPaciente.Enabled := false;
   end
   else
   if estado = teNavegacao then
      if pcCadPaciente.PageIndex = 0 then
      begin
         btnNovoCadastro.Enabled := true;
         if edtNomePaciente.Text <> EmptyStr then
         begin
            btnAlteraCadastro.Enabled := true;
            btnApagaCadastro.Enabled := true;
         end
         else
         begin
            btnAlteraCadastro.Enabled := false;
            btnApagaCadastro.Enabled := false;
         end;
         btnGravaCadastro.Enabled := false;
         btnCancelaCadastro.Enabled := false;
         btnProcuraPaciente.Enabled := true;
      end
      else if pcCadPaciente.PageIndex <> 0 then
       begin           { TODO 1 -oTerence -cCadastro de Paciente : Incluir verificação de ID para saber se já existe cadastro ou não }
          if edtNomePaciente.Text = EmptyStr then
           begin
              btnNovoCadastro.Enabled := false;
              btnAlteraCadastro.Enabled := false;
              btnApagaCadastro.Enabled := false;
           end
          else if edtNomePaciente.Text <> EmptyStr then
           begin
              btnNovoCadastro.Enabled := true;
              btnAlteraCadastro.Enabled := true;
              btnApagaCadastro.Enabled := true;
           end;
       end;
end;

procedure TfrmCadPaciente.LimpaControles(controle: TWinControl);
var
   i : integer;
begin
    if controle is TTabSheet then
      LimpaControles(TWinControl(controle.Controls[0]))      {*******************************************************************}
   else                                                      {**   Identificar qual o TabSheet, seus controles internos, para  **}
   if controle is TScrollBox then                            {**        então identificar o Panel e limpar os controles        **}
      LimpaControles(TWinControl(controle.Controls[0]))      {*******************************************************************}
   else
   if controle is TBCPanel then
      for i := 0 to controle.ControlCount -1 do
      begin
         if controle.Controls[i] is TEdit then
            (controle.Controls[i] as TCustomEdit).Clear;
         if controle.Controls[i] is TComboBox then
            (controle.Controls[i] as TComboBox).ItemIndex := -1;
         if controle.Controls[i] is TRadioButton then
            (controle.Controls[i] as TRadioButton).Checked := false;
         if controle.Controls[i] is TDateTimePicker then
            (controle.Controls[i] as TDateTimePicker).Date := NullDate;
         if controle.Controls[i] is TCheckBox then
            (controle.Controls[i] as TCheckBox).Checked := false;

      end;
end;

function TfrmCadPaciente.RetornoRadioGroup(ItemIndex: integer): string;
begin
   case ItemIndex of            {** Função para retornar True ou False dos RadioGroups **}
      0 : result := 'S';
      1 : result := 'N';
      else
         result := EmptyStr;
   end;
end;

function TfrmCadPaciente.RetornoMascaraContatos(tamanho: integer): string;
begin
   if tamanho = 8 then
      result := '!9000-0000;0;_'
   else if tamanho >= 9 then
      result := '!99-9000-0000;0;_';;
end;

procedure TfrmCadPaciente.DesabilitaTemaRadioButtonEX(Sender: TObject);
var
   i : integer = 0;
begin
   for i := 0 to ComponentCount - 1 do
   begin
      if Components[i] is TRadioButtonEx then
         (Components[i] as TRadioButtonEx).ThemedCaption := false;
   end;
end;

procedure TfrmCadPaciente.CasoHomem;
begin
   gbTaGravida.Enabled := false;
   gbQtdGravidez.Enabled := false;
   gbQtdFilhos.Enabled := false;
   gbMenopausa.Enabled := false;
end;

procedure TfrmCadPaciente.EdicaoDadosBasicos(objPaciente: TPaciente);
var
   objControlePaciente : TControlePaciente;
begin
   if Trim(edtNomePaciente.Text) = '' then
    begin
       try
          frmMensagem := TfrmMensagem.Create(Self);
          frmMensagem.InfoFormMensagem('Alteração no cadastro do paciente', tiInformacao, 'O nome do paciente deve ser preenchido!');
       finally
          FreeAndNil(frmMensagem);
       end;
       edtNomePaciente.SetFocus;
       exit;
    end;
   try
      objControlePaciente := TControlePaciente.Create;
      if objControlePaciente.EdicaoDadosBasicos(objDadosBasicos) then
       begin
         try
            frmMensagem := TfrmMensagem.Create(Self);
            frmMensagem.InfoFormMensagem('Alteração no cadastro do paciente', tiInformacao, 'Paciente alterado com sucesso!');
         finally
            FreeAndNil(frmMensagem);
         end;
       end;

      DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
   end;
end;

procedure TfrmCadPaciente.PreencheFormDadosBasicos(objDados: TPaciente);
begin
   edtCodPaciente.Text := IntToStr(objDados.idPaciente);
   edtNomePaciente.Text := objDados.nomePaciente;
   if objDados.ativo = 'A' then
      chkboxAtivo.Checked := true
   else
      chkboxAtivo.Checked := false;

   edtNomePai.Text := objDados.nomePai;
   edtNomeMae.Text := objDados.nomeMae;
   cboxEstCivil.Text := objDados.estadoCivil;
   edtNomeConjuge.Text := objDados.nomeConjuge;
   //if objDados.sexo = 'F' then
   //   rbtnFeminino.Checked := true
   //else if objDados.sexo = 'M' then
   //   rbtnMasculino.Checked := true;

   case objDados.sexo of
      'F' : rgexSexo.ItemIndex := 0;
      'M' : rgexSexo.ItemIndex := 1;
      else
         rgexSexo.ItemIndex := -1;
   end;

   if objDados.dataNascimento = StrToDate('30/12/1899') then
    begin
       dtpkNascimento.Date :=  NullDate;
       lblIdade.Caption := 'Idade: '
    end
   else
    begin
       dtpkNascimento.Date := objDados.dataNascimento;
       lblIdade.Caption := objDados.RetornoIdadeCompleta;
    end;

   edtNaturalidade.Text := objDados.naturalidade;
   cboxUFNascimento.Text := objDados.ufNascimento;
   edtNacionalidade.Text := objDados.nacionalidade;
   mskedtCPFPaciente.Text := objDados.CPF;
   edtIdentidadePaciente.Text := objDados.identidadePaciente;
   edtOrgaoExpedPaciente.Text := objDados.orgaoExpedidorID;

   lblCodPaciente.Caption := 'Código: ' + edtCodPaciente.Text;
   lblNomePaciente.Caption := 'Nome do Paciente: ' + edtNomePaciente.Text;

 {--------------------------------------------CHAMAR SELECT DO RESPONSAVEL-----------------------------------------------------------}
   PreencheFormResponsavel(objDados.idPaciente);
end;

procedure TfrmCadPaciente.PreencheFormResponsavel(idPaciente: integer);
var
   objResponsavel : TResponsavelPaciente;
   objControlePaciente : TControlePaciente;
begin
   objResponsavel := TResponsavelPaciente.Create;
   objControlePaciente := TControlePaciente.Create;
   try
      objResponsavel := objControlePaciente.SelectResponsavel(idPaciente, objResponsavel);
      objDadosBasicos.idResponsavel := objResponsavel.idResponsavel;
      edtNomeResp.Text := objResponsavel.nomeResponsavel;
      edtParentesco.Text := objResponsavel.parentesco;
   finally
      FreeAndNil(objResponsavel);
   end;
end;

end.

