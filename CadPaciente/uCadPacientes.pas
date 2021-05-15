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
      edtCodContatos: TEdit;
      edtCodDadosProf: TEdit;
      edtCodAnamnese: TEdit;
      edtCodEndDadosProf: TEdit;
      edtCodEnfermidades: TEdit;
      edtCodSinaisSintomas: TEdit;
      edtCodDocPaciente: TEdit;
      edtCodDocResp: TEdit;
      edtCodEndPaciente: TEdit;
      edtCodResponsavel: TEdit;
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
//      edtIdentidadeResp1: TEdit;
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
      procedure rbexSimAlergiaAnestesiaChange(Sender: TObject);
      procedure rbexSimAlgumaAlergiaChange(Sender: TObject);
      procedure rbexSimApreesTratDentChange(Sender: TObject);
      procedure rbexSimFoiHospitalizadoChange(Sender: TObject);
      procedure rbexSimMenopausaChange(Sender: TObject);
      procedure rbexSimTaGravidaChange(Sender: TObject);
      procedure rbexSimTomaRemedioChange(Sender: TObject);
      procedure rbexSimTratMedicoChange(Sender: TObject);
   private
      procedure HabilitaControles(controle: TWinControl);
      procedure DesabilitaControles(controle: TWinControl);
      procedure EstadoBotoes;

      procedure LimpaControles(controle: TWinControl);

      function RetornoMascaraContatos(tamanho: integer): string;

      procedure DesabilitaTemaRadioButtonEX(Sender: TObject);

      procedure CasoHomem;

      procedure DesabilitaEditsSimNaoAnamnese;

      {================================= FUNÇÕES E PROCEDIMENTOS DE CADASTRO  ====================================================}

   public
      function RetornoRadioGroup(ItemIndex: integer): string;
      procedure PreencheAbaDadosBasicos(objDados: TPaciente);
      procedure PreencheAbaResponsavel(idPaciente: integer);
      procedure PreencheAbaEndereco(idPaciente: integer);
      procedure PreencheAbaContatos(idPaciente: integer);
      procedure PreencheAbaDadosProf(idPaciente: integer);
      procedure PreencheAbaAnamnese(idPaciente: integer);
      procedure PreencheAbaSinaisSintomas(idPaciente: integer);
      procedure PreencheAbaEnfermidades(idPaciente: integer);
      procedure SelectPaciente(idPaciente: integer);
   end;

   TipoEstado = (teNavegacao, teInclusao, teEdicao);

var
   frmCadPaciente: TfrmCadPaciente;
   capitura : boolean = false;
   px, py : integer;
   estado : TipoEstado = teNavegacao;    // teNavegacao, teInclusao, teEdicao
//   objDadosBasicos : TPaciente;
   objDadosBasicosAntesAlteracao : TPaciente;
   topPosition : integer;

implementation

uses
   uClassControlePaciente, uFrmMensagem, uLocalizarPaciente, uDadosBasicos, uResponsavel, uEndereco, uContatos, uDadoProfissional,
   uAnamnese, uSinaisSintomas, uEnfermidades, uDocumentos;


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
             DadosBasicos.InclusaoOuEdicaoDadosBasicos(Self);
             //Caso o CPF ou o Nº de identidade não estejam vazios, proceder a inserção/edição
             if (trim(mskedtCPFPaciente.Text) <> EmptyStr) or (trim(edtIdentidadePaciente.Text) <> EmptyStr) then
                Documentos.InclusaoOuEdicaoDocumentos(Self, 3); // 3 = TBLPACIENTE
          end;                                                  // 4 = TBLRESPONSAVEL
                                                                // 5 = TBLDENTISTA
      1 : begin
             Responsavel.InclusaoOuEdicaoResponsavel(Self);
             //Caso o CPF ou o Nº de identidade não estejam vazios, proceder a inserção/edição
             if (Trim(mskedtCPFResp.Text) <> EmptyStr) or (Trim(edtIdentidadeResp.Text) <> EmptyStr) then
                Documentos.InclusaoOuEdicaoDocumentos(Self, 4);   // 3 = TBLPACIENTE
          end;                                                    // 4 = TBLRESPONSAVEL
                                                                  // 5 = TBLDENTISTA
      2 : begin
             Endereco.InclusaoOuEdicaoEndereco(Self, 8);  // 8 = TBL_PACIENTE
                                                          // 9 = TBL_DADOSPROF
          end;

      3 : begin
             Contatos.InclusaoOuEdicaoContatos(Self);
          end;

      4 : begin
             DadosProfissionais.InclusaoOuEdicaoDadoProf(Self);
             if (Trim(edtLogradEmpresa.Text) <> EmptyStr) then      // 8 = TBL_PACIENTE
                Endereco.InclusaoOuEdicaoEndereco(Self, 9);;       // 9 = TBL_DADOSPROF
             //if estado in [teInclusao] then
             //   DadosProfissionais.InclusaoDadoProfissional(Self);
          end;

      5 : begin
          Anamnese.InclusaoOuEdicaoAnamnese(Self)
          end;

      6 : begin
             SinaisSintomas.InclusaoOuEdicaoSinaisSintomas(Self)
          end;

      7 : begin
             Enfermidades.InclusaoOuEdicaoEnfermidades(Self);
          end;
   end;



end;

procedure TfrmCadPaciente.btnCancelaCadastroClick(Sender: TObject);
begin
   if estado in [teEdicao] then
    begin
      PreencheAbaDadosBasicos(objDadosBasicosAntesAlteracao);
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
   frmMensagem : TfrmMensagem;
begin
   frmMensagem := TfrmMensagem.Create(nil);
   frmMensagem.InfoFormMensagem('Apagar Registro?', tiDuvida, 'Tem certeza que você deseja apagar o cadastro de ' +
                                pcCadPaciente.ActivePage.Caption + 'do:' + LineEnding + edtNomePaciente.Text + '?');

   case pcCadPaciente.ActivePageIndex of
      0 : if frmMensagem.resultadoBtn = mrOK then //Caso o resultado da mensagem seja SIM transmite o código para deleção
             DadosBasicos.ApagarDadosBasico(StrToInt(frmCadPaciente.edtCodPaciente.Text));

      //1 : if frmMensagem.resultadoBtn = mrOK then
      //       Responsavel.ApagarResponsavel(); { TODO 10 -oTerence -cCadastro : Deleção de Responsável }
      //2 : ;
      //3 : ;
      //4 : ;
      //5 : ;
      //6 : ;
      //7 : ;
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

   if pcCadPaciente.PageIndex = 1 then
   begin
      edtCodResponsavel.Text := '0';
      edtCodDocResp.Text := '0';
   end;

   if pcCadPaciente.PageIndex = 2 then
    begin
       edtCodEndPaciente.Text := '0';
    end;

   if pcCadPaciente.PageIndex = 3 then;
      edtCodContatos.Text := '0';

   if pcCadPaciente.PageIndex = 4 then
      begin
         edtCodDadosProf.Text := '0';
         edtCodEndDadosProf.Text := '0';
      end;

   if pcCadPaciente.PageIndex = 5 then
   begin
      edtCodAnamnese.Text := '0';
      DesabilitaEditsSimNaoAnamnese;
      if (rgexSexo.ItemIndex = 1) or (rgexSexo.ItemIndex = -1) then
       begin
          gbTaGravida.Enabled := false;
          gbQtdGravidez.Enabled := false;
          gbQtdFilhos.Enabled := false;
          gbMenopausa.Enabled := false;
       end
      else
       begin
          gbTaGravida.Enabled := true;
          gbQtdGravidez.Enabled := true;
          gbQtdFilhos.Enabled := true;
          gbMenopausa.Enabled := true;
       end;
   end;

   if pcCadPaciente.PageIndex = 6 then
      edtCodSinaisSintomas.Text := '0';

   if pcCadPaciente.PageIndex = 7 then;
      edtCodEnfermidades.Text := '0';

end;

procedure TfrmCadPaciente.btnProcuraPacienteClick(Sender: TObject);
var
//   objControlePaciente : TControlePaciente;
   frmLocacilarPaciente : TfrmLocalizaPaciente;
begin
   //try
   //   objControlePaciente := TControlePaciente.Create;
   //   objControlePaciente.ChamaLocalizar;
   //finally
   //   FreeAndNil(objControlePaciente);
   //end;

   try
      frmLocacilarPaciente := TfrmLocalizaPaciente.Create(nil);
      frmLocacilarPaciente.FormQueChamou(self.Name);
      frmLocacilarPaciente.ShowModal;
   finally
      FreeAndNil(frmLocacilarPaciente);
   end;
end;

procedure TfrmCadPaciente.cboxEstCivilChange(Sender: TObject);
begin
   if cboxEstCivil.Text = 'Casado(a)' then
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
//   FreeAndNil(objDadosBasicos);
end;

procedure TfrmCadPaciente.FormCreate(Sender: TObject);
begin
//   objDadosBasicos := TPaciente.Create;
end;

procedure TfrmCadPaciente.FormShow(Sender: TObject);
var
   objControlePaciente : TControlePaciente;
begin
   topPosition := frmCadPaciente.Top;
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
       frmCadPaciente.Top := topPosition;
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

procedure TfrmCadPaciente.rbexSimAlergiaAnestesiaChange(Sender: TObject);
begin
   if rbexSimAlergiaAnestesia.Checked then
      edtAlergiaAnestesia.Enabled := true
   else if rbexSimAlergiaAnestesia.Checked = false then
        edtAlergiaAnestesia.Enabled := false;
end;

procedure TfrmCadPaciente.rbexSimAlgumaAlergiaChange(Sender: TObject);
begin
   if rbexSimAlgumaAlergia.Checked then
      edtAlgumaAlergia.Enabled := true
   else if rbexSimAlgumaAlergia.Checked = false then
      edtAlgumaAlergia.Enabled := false;
end;

procedure TfrmCadPaciente.rbexSimApreesTratDentChange(Sender: TObject);
begin
    if rbexSimApreesTratDent.Checked then
      edtApreensivoTratamento.Enabled := true
   else if rbexSimApreesTratDent.Checked = false then
      edtApreensivoTratamento.Enabled := false;
end;

procedure TfrmCadPaciente.rbexSimFoiHospitalizadoChange(Sender: TObject);
begin
   if rbexSimFoiHospitalizado.Checked then
      edtFoiHospitalizado.Enabled := true
   else if rbexSimFoiHospitalizado.Checked = false then
      edtFoiHospitalizado.Enabled := false;
end;

procedure TfrmCadPaciente.rbexSimMenopausaChange(Sender: TObject);
begin
   if rbexSimMenopausa.Checked then
      edtMenopausa.Enabled := true
   else if rbexSimMenopausa.Checked = false then
      edtMenopausa.Enabled := false;
end;

procedure TfrmCadPaciente.rbexSimTaGravidaChange(Sender: TObject);
begin
   if rbexSimTaGravida.Checked then
      edtTaGravida.Enabled := true
   else if rbexSimTaGravida.Checked = false then
      edtTaGravida.Enabled := false;
end;

procedure TfrmCadPaciente.rbexSimTomaRemedioChange(Sender: TObject);
begin
   if rbexSimTomaRemedio.Checked then
      edtTomaRemedio.Enabled := true
   else if rbexSimTomaRemedio.Checked = false then
      edtTomaRemedio.Enabled := false;
end;

procedure TfrmCadPaciente.rbexSimTratMedicoChange(Sender: TObject);
begin
   if rbexSimTratMedico.Checked then
      edtTratamentoMedico.Enabled := true
   else if rbexSimTratMedico.Checked = false then
      edtTratamentoMedico.Enabled := false;
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
       begin
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
         if controle.Controls[i] is TEdit and Visible = true then
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

procedure TfrmCadPaciente.DesabilitaEditsSimNaoAnamnese;
begin
   edtApreensivoTratamento.Enabled := false;
   edtTratamentoMedico.Enabled := false;
   edtTomaRemedio.Enabled := false;
   edtAlergiaAnestesia.Enabled := false;
   edtAlgumaAlergia.Enabled := false;
   edtFoiHospitalizado.Enabled := false;
   edtTaGravida.Enabled := false;
   edtMenopausa.Enabled := false;
end;

procedure TfrmCadPaciente.PreencheAbaDadosBasicos(objDados: TPaciente);
begin
   edtCodPaciente.Text := IntToStr(objDados.idPaciente);
   edtNomePaciente.Text := objDados.nomePaciente;
   edtCodDocPaciente.Text := IntToStr(objDados.documento.idDocumentos);

   if objDados.ativo = 'A' then
      chkboxAtivo.Checked := true
   else
      chkboxAtivo.Checked := false;

   edtNomePai.Text := objDados.nomePai;
   edtNomeMae.Text := objDados.nomeMae;
   cboxEstCivil.Text := objDados.estadoCivil;
   edtNomeConjuge.Text := objDados.nomeConjuge;

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
   edtCodDocPaciente.Text := IntToStr(objDados.documento.idDocumentos);
   mskedtCPFPaciente.Text := objDados.documento.cpf;
   edtIdentidadePaciente.Text := objDados.documento.identidade;
   edtOrgaoExpedPaciente.Text := objDados.documento.orgaoExpedidor;


   lblCodPaciente.Caption := 'Código: ' + edtCodPaciente.Text;
   lblNomePaciente.Caption := 'Nome do Paciente: ' + edtNomePaciente.Text;

end;

procedure TfrmCadPaciente.PreencheAbaResponsavel(idPaciente: integer);
var
   objResponsavel : TResponsavelPaciente;
   objControlePaciente : TControlePaciente;
begin
   objResponsavel := TResponsavelPaciente.Create;
   objControlePaciente := TControlePaciente.Create;
   try
      objResponsavel := objControlePaciente.SelectResponsavel(idPaciente, objResponsavel);
      edtCodResponsavel.Text := IntToStr(objResponsavel.idResponsavel);
      edtNomeResp.Text := objResponsavel.nomeResponsavel;
      edtParentesco.Text := objResponsavel.parentesco;
      edtCodResponsavel.Text := IntToStr(objResponsavel.idResponsavel);
      mskedtCPFResp.Text := objResponsavel.cpfResponsavel;
      edtIdentidadeResp.Text := objResponsavel.identidadeResponsavel;
      edtOrgaoExpedResp.Text := objResponsavel.orgaoExpedidor;
      edtCodDocResp.Text := IntToStr(objResponsavel.identidadeResponsavel);
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objResponsavel);
   end;
end;

procedure TfrmCadPaciente.PreencheAbaEndereco(idPaciente: integer);
var
   objEndereco : TEndereco;
   objControlePaciente : TControlePaciente;
begin
   try
      objEndereco := TEndereco.Create;
      objControlePaciente := TControlePaciente.Create;
      objEndereco := objControlePaciente.SelectEndereco(idPaciente, objEndereco);
      edtCodEndPaciente.Text := IntToStr(objEndereco.idEndereco);
      edtLogradouro.Text := objEndereco.logradouro;
      edtNumEndereco.Text := objEndereco.numero;
      edtComplemento.Text := objEndereco.complemento;
      edtBairro.Text := objEndereco.bairro;
      edtCidade.Text := objEndereco.cidade;
      cboxUFCasa.Text := objEndereco.estado;
      mskedtCEPCasa.Text := objEndereco.cep;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objEndereco);
   end;
end;

procedure TfrmCadPaciente.PreencheAbaContatos(idPaciente: integer);
var
   objContatos : TContatos;
   objControlePaciente : TControlePaciente;
begin
   try
      objContatos := TContatos.Create;
      objControlePaciente := TControlePaciente.Create;
      objContatos := objControlePaciente.SelectContatos(idPaciente, objContatos) ;
      edtCodContatos.Text := IntToStr(objContatos.idContatos);
      edtDDDCasa.Text := objContatos.dddTelCasa;
      mskedtTelCasa.Text := objContatos.telefoneCasa;
      cboxOperadoraCasa.Text := objContatos.operadoraTelCasa;
      edtDDDCel1.Text := objContatos.dddCelular1;
      mskedtCel1.Text := objContatos.NumeroCelular1;
      cboxOperadoraCel1.Text := objContatos.operadoraCelular1;
      edtDDDCel2.Text := objContatos.dddCelular2;
      mskedtCel2.Text := objContatos.numeroCelular2;
      cboxOperadoraCel2.Text := objContatos.operadoraCelular2;
      edtDDDTelTrab.Text := objContatos.dddTelTrabalho;
      mskedtTelTrab.Text := objContatos.telefoneTrabalho;
      cboxOperadoraTelTrab.Text := objContatos.operadoraTelTrabalho;
      edtDDDTelRecado.Text := objContatos.dddTelRecado;
      mskedtTelRecado.Text := objContatos.telefoneRecado;
      cboxOperadoraTelRecado.Text := objContatos.operadoraTelRecado;
      edtPessoaRecado.Text := objContatos.nomePessoaTelRecado;
      edtEmail.Text := objContatos.email;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objContatos);
   end;
end;

procedure TfrmCadPaciente.PreencheAbaDadosProf(idPaciente: integer);
var
   objDadosProf : TDadosProfissionais;
   objControlePaciente : TControlePaciente;
begin
   try
      objDadosProf := TDadosProfissionais.Create;
      objControlePaciente := TControlePaciente.Create;
      objDadosProf := objControlePaciente.SelectDadosProfissionais(idPaciente, objDadosProf);
      edtCodDadosProf.Text := IntToStr(objDadosProf.idDadoProfissional);
      edtCodEndDadosProf.Text := IntToStr(objDadosProf.endereco.idEndereco);
      edtNomeEmpresa.Text := objDadosProf.nomeEmpresa;
      edtCargo.Text := objDadosProf.cargo;
      edtLogradEmpresa.Text := objDadosProf.endereco.logradouro;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objDadosProf);
   end;
end;

procedure TfrmCadPaciente.PreencheAbaAnamnese(idPaciente: integer);
var
   objAnamnese : TAnamnese;
   objControlePaciente : TControlePaciente;
begin
   try
      objAnamnese := TAnamnese.Create;
      objControlePaciente :=  TControlePaciente.Create;
      objAnamnese := objControlePaciente.SelectAnamnese(idPaciente, objAnamnese);
      edtCodAnamnese.Text := IntToStr(objAnamnese.idAnamnese);
      cboxConsAcucar.Text := objAnamnese.consumoAcucar;
      cboxEscovacao.Text := objAnamnese.escovacao;
      cboxFioDental.Text := objAnamnese.usoFioDental;
      memoObsAnatHistPatol.Text := objAnamnese.obsAnatomoHisto;
      edtHabitosViciosos.Text := objAnamnese.habitosViciosos;
      edtAntecFamiliar.Text := objAnamnese.antecedentesFamiliares;
      case objAnamnese.apreensivoTratDentario of
         'N' : begin
                  rbexNaoApreesTratDent.Checked := true;
                  rbexSimApreesTratDent.Checked := false;
               end;
         'S' : begin
                  rbexSimApreesTratDent.Checked := true;
                  rbexNaoApreesTratDent.Checked := false;
                  edtApreensivoTratamento.Text := objAnamnese.porqueApreensivo;
               end;
      end;

      case objAnamnese.tratamentoMedico of
         'N' : begin
                  rbexNaoTratMedico.Checked := true;
                  rbexSimTratMedico.Checked := false;
               end;
         'S' : begin
                  rbexNaoTratMedico.Checked := false;
                  rbexSimTratMedico.Checked := true;
                  edtTratamentoMedico.Text := objAnamnese.qualTratMedico;
               end;
      end;

      case objAnamnese.tomaMedicamento of
         'S' : begin
                  rbexSimTomaRemedio.Checked := true;
                  rbexNaoTomaRemedio.Checked := false;
                  edtTomaRemedio.Text := objAnamnese.tomaQualMedicamento;
               end;
         'N' : begin
                  rbexSimTomaRemedio.Checked := false;
                  rbexNaoTomaRemedio.Checked := true;
               end;
      end;

      case objAnamnese.alergiaAnestesia of
         'S' : begin
                  rbexSimAlergiaAnestesia.Checked := true;
                  rbexNaoAlergiaAnestesia.Checked := false;
                  edtAlergiaAnestesia.Text := objAnamnese.alergiaQualAnestesia;
               end;
         'N' : begin
                  rbexSimAlergiaAnestesia.Checked := false;
                  rbexNaoAlergiaAnestesia.Checked := true;
               end;
      end;

      case objAnamnese.algumaAlergia of
         'S' : begin
                  rbexSimAlgumaAlergia.Checked := true;
                  rbexNaoAlgumaAlergia.Checked := false;
                  edtAlgumaAlergia.Text := objAnamnese.algumaAlergia;
               end;
         'N' : begin
                  rbexSimAlgumaAlergia.Checked := false;
                  rbexNaoAlgumaAlergia.Checked := true;
               end;
      end;

      case objAnamnese.foiHospitalizado of
         'S' : begin
                  rbexSimFoiHospitalizado.Checked := true;
                  rbexNaoFoiHospitalizado.Checked := false;
                  edtFoiHospitalizado.Text := objAnamnese.porqueHospitalizado;
               end;
         'N' : begin
                  rbexSimFoiHospitalizado.Checked := false;
                  rbexNaoFoiHospitalizado.Checked := true;
               end;
      end;

      case objAnamnese.estaGravida of
         'S' : begin
                  rbexSimTaGravida.Checked := true;
                  rbexNaoTaGravida.Checked := false;
                  edtTaGravida.Text := objAnamnese.previsaoParto;
               end;
         'N' : begin
                  rbexSimTaGravida.Checked := false;
                  rbexNaoTaGravida.Checked := true;
               end;
      end;

      spedtQtdGravidez.Text := IntToStr(objAnamnese.teveQuantasGravidez);
      spedtQtdFilhos.Text := IntToStr(objAnamnese.quantosFilhos);

      case objAnamnese.chegouMenopausa of
         'S' : begin
                  rbexSimMenopausa.Checked := true;
                  rbexNaoMenopausa.Checked := false;
                  edtMenopausa.Text := objAnamnese.quandoChegouMenopausa;
               end;
         'N' : begin
                  rbexSimMenopausa.Checked := false;
                  rbexNaoMenopausa.Checked := true;
               end;
      end;
      CasoHomem;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objAnamnese);
   end;
end;

procedure TfrmCadPaciente.PreencheAbaSinaisSintomas(idPaciente: integer);
var
   objSinaisSintomas : TSinaisSintomas;
   objControlePaciente : TControlePaciente;
begin
   try
      objSinaisSintomas := TSinaisSintomas.Create;
      objControlePaciente := TControlePaciente.Create;
      objSinaisSintomas := objControlePaciente.SelectSinaisSintomas(idPaciente, objSinaisSintomas);
      case objSinaisSintomas.alteracaoApetite of
         'S' : rgexAlteracaoApetite.ItemIndex := 0;
         'N' : rgexAlteracaoApetite.ItemIndex := 1;
         else
            rgexCalorExagerado.ItemIndex := -1;
      end;

      case objSinaisSintomas.calorExagerado of
         'S' : rgexCalorExagerado.ItemIndex := 0;
         'N' : rgexCalorExagerado.ItemIndex := 1;
         else
            rgexCalorExagerado.ItemIndex := -1;
      end;

      case objSinaisSintomas.cansaFacil of
         'S' : rgexCansaFacil.ItemIndex := 0;
         'N' : rgexCansaFacil.ItemIndex := 1;
         else
            rgexCansaFacil.ItemIndex := -1;
      end;

      case objSinaisSintomas.coceiraAnormal of
         'S' : rgexCoceiraAnormal.ItemIndex := 0;
         'N' : rgexCoceiraAnormal.ItemIndex := 1;
         else
            rgexCoceiraAnormal.ItemIndex := -1;
      end;

      case objSinaisSintomas.dificuldadeEngolir of
         'S' : rgexDificuldadeEngolir.ItemIndex := 0;
         'N' : rgexDificuldadeEngolir.ItemIndex := 1;
         else
            rgexDificuldadeEngolir.ItemIndex := -1;
      end;

      case objSinaisSintomas.dificuldadeMastigar of
         'S' : rgexDificuldadeMastigar.ItemIndex := 0;
         'N' : rgexDificuldadeMastigar.ItemIndex := 1;
         else
            rgexDificuldadeMastigar.ItemIndex := -1;
      end;

      case objSinaisSintomas.dorFacial of
         'S' : rgexDorFacial.ItemIndex := 0;
         'N' : rgexDorFacial.ItemIndex := 1;
         else
            rgexDorFacial.ItemIndex := -1;
      end;

      case objSinaisSintomas.dorFrequenteCabeca of
         'S' : rgexDorCabecaFrequente.ItemIndex := 0;
         'N' : rgexDorCabecaFrequente.ItemIndex := 1;
         else
            rgexDorCabecaFrequente.ItemIndex := -1;
      end;

      case objSinaisSintomas.dorOuvidoFrequente of
         'S' : rgexDorOuvidoFrequente.ItemIndex := 0;
         'N' : rgexDorOuvidoFrequente.ItemIndex := 1;
         else
            rgexDorOuvidoFrequente.ItemIndex := -1;
      end;

      case objSinaisSintomas.emagrecimentoAcentuado of
         'S' : rgexEmagrecimentoAcentuado.ItemIndex := 0;
         'N' : rgexEmagrecimentoAcentuado.ItemIndex := 1;
         else
            rgexEmagrecimentoAcentuado.ItemIndex := -1;
      end;

      case objSinaisSintomas.estaloMandibula of
         'S' : rgexEstaloMandibula.ItemIndex := 0;
         'N' : rgexEstaloMandibula.ItemIndex := 1;
         else
            rgexEstaloMandibula.ItemIndex := -1;
      end;

      case objSinaisSintomas.febreFrequente of
         'S' : rgexFebreFrequente.ItemIndex := 0;
         'N' : rgexFebreFrequente.ItemIndex := 1;
         else
            rgexFebreFrequente.ItemIndex := -1;
      end;

      case objSinaisSintomas.indigestaoFrequente of
         'S' : rgexIndigestaoFrequente.ItemIndex := 0;
         'N' : rgexIndigestaoFrequente.ItemIndex := 1;
         else
            rgexIndigestaoFrequente.ItemIndex := -1;
      end;

      case objSinaisSintomas.maCicatrizacao of
         'S' : rgexMaCicatrizacao.ItemIndex := 0;
         'N' : rgexMaCicatrizacao.ItemIndex := 1;
         else
            rgexMaCicatrizacao.ItemIndex := -1;
      end;

      case objSinaisSintomas.miccaoFrequente of
         'S' : rgexMiccaoFrequente.ItemIndex := 0;
         'N' : rgexMiccaoFrequente.ItemIndex := 1;
         else
            rgexMiccaoFrequente.ItemIndex := -1;
      end;

      case objSinaisSintomas.rangeDentes of
         'S' : rgexRangeDentes.ItemIndex := 0;
         'N' : rgexRangeDentes.ItemIndex := 1;
         else
            rgexRangeDentes.ItemIndex := -1;
      end;

      case objSinaisSintomas.respiraPelaBoca of
         'S' : rgexRespiraPelaBoca.ItemIndex := 0;
         'N' : rgexRespiraPelaBoca.ItemIndex := 1;
         else
            rgexRespiraPelaBoca.ItemIndex := -1;
      end;

      case objSinaisSintomas.sangramentoAnormal of
         'S' : rgexSangramentoAnormal.ItemIndex := 0;
         'N' : rgexSangramentoAnormal.ItemIndex := 1;
         else
            rgexSangramentoAnormal.ItemIndex := -1;
      end;

      case objSinaisSintomas.tonturaDesmaio of
         'S' : rgexTonturasDesmaios.ItemIndex := 0;
         'N' : rgexTonturasDesmaios.ItemIndex := 1;
         else
            rgexTonturasDesmaios.ItemIndex := -1;
      end;

      case objSinaisSintomas.poucaSaliva of
         'S' : rgexPoucaSaliva.ItemIndex := 0;
         'N' : rgexPoucaSaliva.ItemIndex := 1;
         else
            rgexPoucaSaliva.ItemIndex := -1;
      end;

      edtCodSinaisSintomas.Text := IntToStr(objSinaisSintomas.idSinaisSintomas);

   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objSinaisSintomas);
   end;
end;

procedure TfrmCadPaciente.PreencheAbaEnfermidades(idPaciente: integer);
var
   objEnfermidades : TEnfermidades;
   objControlePaciente : TControlePaciente;
begin
   try
      objEnfermidades := TEnfermidades.Create;
      objControlePaciente := TControlePaciente.Create;
      objEnfermidades := objControlePaciente.SelectEnfermidades(idPaciente, objEnfermidades);
      case objEnfermidades.aids of
         'S' : rgexAids.ItemIndex := 0;
         'N' : rgexAids.ItemIndex := 1;
         else
            rgexAids.ItemIndex := -1;
      end;

      case objEnfermidades.anemia of
         'S' : rgexAnemia.ItemIndex := 0;
         'N' : rgexAnemia.ItemIndex := 1;
         else
            rgexAnemia.ItemIndex := -1;
      end;

      case objEnfermidades.asma of
         'S' : rgexAsma.ItemIndex := 0;
         'N' : rgexAsma.ItemIndex := 1;
         else
            rgexAsma.ItemIndex := -1;
      end;

      case objEnfermidades.diabete of
         'S' : rgexDiabetes.ItemIndex := 0;
         'N' : rgexDiabetes.ItemIndex := 1;
         else
            rgexDiabetes.ItemIndex := -1;
      end;

      case objEnfermidades.doencaCoracao of
         'S' : rgexDoencaCoracao.ItemIndex := 0;
         'N' : rgexDoencaCoracao.ItemIndex := 1;
         else
            rgexDoencaCoracao.ItemIndex := -1;
      end;

      case objEnfermidades.tumorBoca of
         'S' : rgexTumorBoca.ItemIndex := 0;
         'N' : rgexTumorBoca.ItemIndex := 1;
         else
            rgexTumorBoca.ItemIndex := -1;
      end;

      case objEnfermidades.doencaRenal of
         'S' : rgexDoencaRenal.ItemIndex := 0;
         'N' : rgexDoencaRenal.ItemIndex := 1;
         else
            rgexDoencaRenal.ItemIndex := -1;
      end;

      case objEnfermidades.disritmiaEpilepsia of
         'S' : rgexDisritmiaEpilepsia.ItemIndex := 0;
         'N' : rgexDisritmiaEpilepsia.ItemIndex := 1;
         else
            rgexDisritmiaEpilepsia.ItemIndex := -1;
      end;

      case objEnfermidades.febreReumatica of
         'S' : rgexFebreReumatica.ItemIndex := 0;
         'N' : rgexFebreReumatica.ItemIndex := 1;
         else
            rgexFebreReumatica.ItemIndex := -1;
      end;

      case objEnfermidades.glaucoma of
         'S' : rgexGlaucoma.ItemIndex := 0;
         'N' : rgexGlaucoma.ItemIndex := 1;
         else
            rgexGlaucoma.ItemIndex := -1;
      end;

      case objEnfermidades.gonorreia of
         'S' : rgexGonorreia.ItemIndex := 0;
         'N' : rgexGonorreia.ItemIndex := 1;
         else
            rgexGonorreia.ItemIndex := -1;
      end;

      case objEnfermidades.hanseniase of
         'S' : rgexHanseniase.ItemIndex := 0;
         'N' : rgexHanseniase.ItemIndex := 1;
         else
            rgexHanseniase.ItemIndex := -1;
      end;

      case objEnfermidades.hemofilia of
         'S' : rgexHemofilia.ItemIndex := 0;
         'N' : rgexHemofilia.ItemIndex := 1;
         else
            rgexHemofilia.ItemIndex := -1;
      end;

      case objEnfermidades.hepatite of
         'S' : rgexHepatite.ItemIndex := 0;
         'N' : rgexHepatite.ItemIndex := 1;
         else
            rgexHepatite.ItemIndex := -1;
      end;

      case objEnfermidades.ictericia of
         'S' : rgexIctericia.ItemIndex := 0;
         'N' : rgexIctericia.ItemIndex := 1;
         else
            rgexIctericia.ItemIndex := -1;
      end;

      case objEnfermidades.problemaHormonal of
         'S' : rgexProblemaHormonal.ItemIndex := 0;
         'N' : rgexProblemaHormonal.ItemIndex := 1;
         else
            rgexProblemaHormonal.ItemIndex := -1;
      end;

      case objEnfermidades.sifilis of
         'S' : rgexSifilis.ItemIndex := 0;
         'N' : rgexSifilis.ItemIndex := 1;
         else
            rgexSifilis.ItemIndex := -1;
      end;

      case objEnfermidades.sinusite of
         'S' : rgexSinusite.ItemIndex := 0;
         'N' : rgexSinusite.ItemIndex := 1;
         else
            rgexSinusite.ItemIndex := -1;
      end;

      case objEnfermidades.tuberculose of
         'S' : rgexTuberculose.ItemIndex := 0;
         'N' : rgexTuberculose.ItemIndex := 1;
         else
            rgexTuberculose.ItemIndex := -1;
      end;

      case objEnfermidades.ulceraHepatica of
         'S' : rgexUlceraHepatica.ItemIndex := 0;
         'N' : rgexUlceraHepatica.ItemIndex := 1;
         else
            rgexUlceraHepatica.ItemIndex := -1;
      end;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objEnfermidades);
   end;
end;

procedure TfrmCadPaciente.SelectPaciente(idPaciente: integer);
var
   objDadosBasicos : TPaciente;
   objControlePaciente : TControlePaciente;
begin
   try
      objDadosBasicos := TPaciente.Create;
      objControlePaciente := TControlePaciente.Create;
      objDadosBasicos := objControlePaciente.SelectDadosBasicos(idPaciente, objDadosBasicos);
      PreencheAbaDadosBasicos(objDadosBasicos);
      PreencheAbaResponsavel(idPaciente);
      PreencheAbaEndereco(idPaciente);
      PreencheAbaContatos(idPaciente);
      PreencheAbaDadosProf(idPaciente);
      PreencheAbaAnamnese(idPaciente);
      PreencheAbaSinaisSintomas(idPaciente);
      PreencheAbaEnfermidades(idPaciente);
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objDadosBasicos);
   end;
end;

end.

