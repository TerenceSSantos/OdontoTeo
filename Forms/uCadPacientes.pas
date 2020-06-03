unit uCadPacientes;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls, MaskEdit, ECGroupCtrls, rxctrls,
   DateTimePicker, BCPanel, BCButton, RTTICtrls, ExCheckCtrls, uClassPaciente, uClassResponsavelPaciente, uClassSinaisSintomas,
   uClassEnfermidades, uClassEndereco, uClassContatos, uClassAnamnese;

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
      cboxConsAcucar2: TComboBox;
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
      edtNumEndEmpresa1: TEdit;
      edtNumEndEmpresa10: TEdit;
      edtNumEndEmpresa2: TEdit;
      edtNumEndEmpresa3: TEdit;
      edtNumEndEmpresa4: TEdit;
      edtNumEndEmpresa5: TEdit;
      edtNumEndEmpresa6: TEdit;
      edtNumEndEmpresa7: TEdit;
      edtNumEndEmpresa8: TEdit;
      edtNumEndEmpresa9: TEdit;
      edtNumEndereco: TEdit;
      edtOrgaoExpedidorResp1: TEdit;
      edtOrgaoExpedPaciente: TEdit;
      edtOrgaoExpedResp: TEdit;
      edtParentesco: TEdit;
      edtPessoaRecado: TEdit;
      GroupBox1: TGroupBox;
      GroupBox10: TGroupBox;
      GroupBox11: TGroupBox;
      GroupBox12: TGroupBox;
      GroupBox2: TGroupBox;
      GroupBox3: TGroupBox;
      GroupBox4: TGroupBox;
      GroupBox5: TGroupBox;
      GroupBox6: TGroupBox;
      GroupBox7: TGroupBox;
      GroupBox8: TGroupBox;
      GroupBox9: TGroupBox;
      lblAids: TLabel;
      lblDisritmiaEpilepsia: TLabel;
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
      lblAntecFamiliar1: TLabel;
      lblAntecFamiliar10: TLabel;
      lblAntecFamiliar11: TLabel;
      lblAntecFamiliar12: TLabel;
      lblAntecFamiliar13: TLabel;
      lblAntecFamiliar14: TLabel;
      lblAntecFamiliar15: TLabel;
      lblAntecFamiliar16: TLabel;
      lblAntecFamiliar17: TLabel;
      lblAntecFamiliar18: TLabel;
      lblAntecFamiliar19: TLabel;
      lblAntecFamiliar2: TLabel;
      lblAntecFamiliar20: TLabel;
      lblAntecFamiliar3: TLabel;
      lblAntecFamiliar4: TLabel;
      lblAntecFamiliar5: TLabel;
      lblAntecFamiliar6: TLabel;
      lblAntecFamiliar7: TLabel;
      lblAntecFamiliar8: TLabel;
      lblAntecFamiliar9: TLabel;
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
      rbex1Filho: TRadioButtonEx;
      rbex9Gravidez: TRadioButtonEx;
      rbex1Gravidez: TRadioButtonEx;
      rbex2Gravidez: TRadioButtonEx;
      rbex3Gravidez: TRadioButtonEx;
      rbex4Gravidez: TRadioButtonEx;
      rbex5Gravidez: TRadioButtonEx;
      rbex6Gravidez: TRadioButtonEx;
      rbex7Gravidez: TRadioButtonEx;
      rbex8Gravidez: TRadioButtonEx;
      rbex2Filho: TRadioButtonEx;
      rbex3Filho: TRadioButtonEx;
      rbex4Filho: TRadioButtonEx;
      rbex5Filho: TRadioButtonEx;
      rbex6Filho: TRadioButtonEx;
      rbex7Filho: TRadioButtonEx;
      rbex8Filho: TRadioButtonEx;
      rbex9Filho: TRadioButtonEx;
      rbexSimTomaRemedio: TRadioButtonEx;
      rbexSimAlergiaAnestesia: TRadioButtonEx;
      rbexSimAlgumaAlergia: TRadioButtonEx;
      rbexSimFoiHospitalizado: TRadioButtonEx;
      rbexSimTratMedico: TRadioButtonEx;
      rgexDisritmiaEpilepsia: TRadioGroupEx;
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
      rgFebreReumatica: TRadioGroup;
      rgGlaucoma: TRadioGroup;
      rgGonorreia: TRadioGroup;
      rgHanseniase: TRadioGroup;
      rgHemofilia: TRadioGroup;
      rgHepatite: TRadioGroup;
      rgIctericia: TRadioGroup;
      rgProblemaHormonal: TRadioGroup;
      rgSifilis: TRadioGroup;
      rgSinusite: TRadioGroup;
      rgTuberculose: TRadioGroup;
      rgUlceraHepatica: TRadioGroup;
      ScrollBox1: TScrollBox;
      tabAnamnese: TTabSheet;
      tabContatos: TTabSheet;
      tabDadosBasicos: TTabSheet;
      tabDadosProfissionais: TTabSheet;
      tabEndereco: TTabSheet;
      tabEnfermidades: TTabSheet;
      tabResponsavel: TTabSheet;
      tabSinaisSintomas: TTabSheet;
      UpDown1: TUpDown;
      UpDown2: TUpDown;
      procedure btnAlteraCadastroClick(Sender: TObject);
      procedure btnApagaCadastroClick(Sender: TObject);
      procedure btnCancelaCadastroClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnGravaCadastroClick(Sender: TObject);
      procedure btnNovoCadastroClick(Sender: TObject);
      procedure btnProcuraPacienteClick(Sender: TObject);
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

      function RetornoRadioGroup(ItemIndex: integer): string;

      function RetornoMascaraContatos(tamanho: integer): string;

      procedure DesabilitaTemaRadioButtonEX(Sender: TObject);

      {================================= FUNÇÕES E PROCEDIMENTOS DE CADASTRO  ====================================================}

      function CarregaObjDadosBasicos(objDados: TPaciente): TPaciente;
      procedure InclusaoDadosBasicos;
      procedure EdicaoDadosBasicos(objPaciente: TPaciente);

      function CarregaObjResponsavel(objResponsavel: TResponsavelPaciente): TResponsavelPaciente;
      procedure InclusaoResponsavel;

      function CarregaObjEndereco(objEndereco: TEndereco): TEndereco;
      procedure InclusaoEndereco;

      function CarregaObjContatos(objContatos: TContatos) : TContatos;
      procedure InclusaoContatos;

      //function CarregaObjAnamnese(objAnamnese: TContatos) : TAnamnese;
      //procedure InclusaoAnamnese;

      function CarregaObjSinaisSintomas(objSinaisSintomas: TSinaisSintomas): TSinaisSintomas;
      procedure InclusaoSinaisSintomas;

      function CarregaObjEnfermidades(objEnfermidades: TEnfermidades): TEnfermidades;
      procedure InclusaoEnfermidades;

   public
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
   uClassControlePaciente, uFrmMensagem;


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
                InclusaoDadosBasicos
             else if estado in [teEdicao] then
             begin
                objDadosBasicos := CarregaObjDadosBasicos(objDadosBasicos);
                EdicaoDadosBasicos(objDadosBasicos);
             end;
          end;
      1 : begin
             if estado in [teInclusao] then
                InclusaoResponsavel;
          end;
      2 : begin
             if estado in [teInclusao] then
                InclusaoEndereco;
          end;
      3 : begin
             if estado in [teInclusao] then
                InclusaoContatos;
          end;
      7 : begin
             if estado in [teInclusao] then
                InclusaoSinaisSintomas;
          end;
      8 : begin
             if estado in [teInclusao] then
                InclusaoEnfermidades;
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
   EstadoBotoes;
   DesabilitaControles(pcCadPaciente.ActivePage);
end;

procedure TfrmCadPaciente.btnAlteraCadastroClick(Sender: TObject);
begin
   estado := teEdicao;
   EstadoBotoes;
   HabilitaControles(pcCadPaciente.ActivePage);
   objDadosBasicosAntesAlteracao := TPaciente.Create;
   objDadosBasicosAntesAlteracao := CarregaObjDadosBasicos(objDadosBasicosAntesAlteracao);
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
             EstadoBotoes;
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
   EstadoBotoes;
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
   EstadoBotoes;
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

function TfrmCadPaciente.CarregaObjDadosBasicos(objDados: TPaciente): TPaciente;
begin
   with objDados do               {** PREENCHER O OBJETO PACIENTE COM OS SEUS DADOS BASÍCOS QUE ESTÃO NO FORM **}
   begin
      if chkboxAtivo.Checked then
         ativo := 'A'
      else
         ativo := 'I';
      idPaciente := StrToInt(edtCodPaciente.Text);
      nomePaciente := edtNomePaciente.Text;
      nomePai := edtNomePai.Text;
      nomeMae := edtNomeMae.Text;
      estadoCivil := cboxEstCivil.Text;
      nomeConjuge := edtNomeConjuge.Text;
      //if rbtnFeminino.Checked then
      //   sexo := 'F'
      //else if rbtnMasculino.Checked then
      //   sexo := 'M';

      case rgexSexo.ItemIndex of
         0 : sexo := 'F';
         1 : sexo := 'M';
      end;
      if not(IsNullDate(dtpkNascimento.Date)) then
         dataNascimento := dtpkNascimento.Date;
      naturalidade := edtNaturalidade.Text;
      ufNascimento := cboxUFNascimento.Text;
      nacionalidade := edtNacionalidade.Text;
   end;
   result := objDados;
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
   i : integer;
begin
   for i := 0 to ComponentCount - 1 do
   begin
      if Components[i] is TRadioButtonEx then
         (Components[i] as TRadioButtonEx).ThemedCaption := false;
   end;
end;

procedure TfrmCadPaciente.InclusaoDadosBasicos;
var
   objControlePaciente : TControlePaciente;
   codigo : integer;
begin
   if Trim(edtNomePaciente.Text) = '' then
   begin
      try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('A T E N Ç Ã O', tiAviso, 'O nome do paciente deve ser preenchido!');
      finally
         FreeAndNil(frmMensagem);
      end;
      edtNomePaciente.SetFocus;
      exit;
   end;
   try
      objControlePaciente := TControlePaciente.Create;
      objDadosBasicos := CarregaObjDadosBasicos(objDadosBasicos);
      codigo := objControlePaciente.InclusaoDadosBasicos(objDadosBasicos);
      if codigo > 0 then
      begin
         try
            frmMensagem := TfrmMensagem.Create(Self);
            frmMensagem.InfoFormMensagem('Cadastro do paciente', tiInformacao, 'Paciente cadastrado com sucesso!');
         finally
            FreeAndNil(frmMensagem);
         end;
         lblCodPaciente.Caption := 'Código: ' + IntToStr(codigo);
         lblNomePaciente.Caption := 'Nome do Paciente: ' + edtNomePaciente.Text;
         if objDadosBasicos.dataNascimento <> StrToDate('30/12/1899')then
            lblIdade.Caption := objDadosBasicos.RetornoIdadeCompleta;
         edtCodPaciente.Text := IntToStr(codigo);

         DesabilitaControles(pcCadPaciente.ActivePage);
         estado := teNavegacao;
         EstadoBotoes;
      end
      else
         lblCodPaciente.Caption := 'Código: ';
   finally
      FreeAndNil(objControlePaciente);
   end;
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
      EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
   end;
end;

function TfrmCadPaciente.CarregaObjResponsavel(objResponsavel: TResponsavelPaciente): TResponsavelPaciente;
begin
   objResponsavel.idPaciente := StrToInt(edtCodPaciente.Text);
   objResponsavel.nomeResponsavel := edtNomeResp.Text;
   objResponsavel.parentesco := edtParentesco.Text;
   objResponsavel.cpfResponsavel := mskedtCPFResp.Text;
   objResponsavel.identidadeResponsavel := edtIdentidadeResp.Text;
   objResponsavel.orgaoExpedidorID := edtOrgaoExpedResp.Text;
   result := objResponsavel;
end;

procedure TfrmCadPaciente.InclusaoResponsavel;
var
   objResponsavel : TResponsavelPaciente;
   objControlePaciente : TControlePaciente;
begin
   try
      objResponsavel := TResponsavelPaciente.Create;
      objControlePaciente := TControlePaciente.Create;
      if objControlePaciente.InclusaoResponsavel(CarregaObjResponsavel(objResponsavel))then
       begin
          try
             frmMensagem := TfrmMensagem.Create(Self);
             frmMensagem.InfoFormMensagem('Cadastro do Responsável', tiInformacao, 'Cadastrado do Responsável realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
       end;

      DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objResponsavel);
   end;

end;

function TfrmCadPaciente.CarregaObjEndereco(objEndereco: TEndereco): TEndereco;
begin
   with objEndereco do
   begin
      idTblPaciente := StrToInt(edtCodPaciente.Text);
      logradouro := edtLogradouro.Text;
      numero := edtNumEndereco.Text;
      complemento := edtComplemento.Text;
      bairro := edtBairro.Text;
      cidade := edtCidade.Text;
      objEndereco.estado := cboxUFCasa.Text;
      cep := mskedtCEPCasa.Text;
   end;
   result := objEndereco;
end;

procedure TfrmCadPaciente.InclusaoEndereco;
var
   objEndereco : TEndereco;
   objControlePaciente : TControlePaciente;
begin
   try
      objEndereco := TEndereco.Create;
      objControlePaciente := TControlePaciente.Create;
      if objControlePaciente.InclusaoEndereco(CarregaObjEndereco(objEndereco))then
       begin
          try
             frmMensagem := TfrmMensagem.Create(Self);
             frmMensagem.InfoFormMensagem('Cadastro do Endereço do Paciente', tiInformacao, 'Cadastrado do Endereço realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
       end;

      DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objEndereco);
   end;
end;

function TfrmCadPaciente.CarregaObjContatos(objContatos: TContatos): TContatos;
begin
   with objContatos do
   begin
      idTblPaciente := StrToInt(edtCodPaciente.Text);
      dddTelCasa := edtDDDCasa.Text;
      telefoneCasa := mskedtTelCasa.Text;
      operadoraTelCasa := cboxOperadoraCasa.Text;
      dddCelular1 := edtDDDCel1.Text;
      NumeroCelular1 := mskedtCel1.Text;
      operadoraCelular1 := cboxOperadoraCel1.Text;
      dddCelular2 := edtDDDCel2.Text;
      numeroCelular2 := mskedtCel2.Text;
      operadoraCelular2 := cboxOperadoraCel2.Text;
      dddTelTrabalho := edtDDDTelTrab.Text;
      telefoneTrabalho := mskedtTelTrab.Text;
      operadoraTelTrabalho := cboxOperadoraTelTrab.Text;
      dddTelRecado := edtDDDTelRecado.Text;
      telefoneRecado := mskedtTelRecado.Text;
      operadoraTelRecado := cboxOperadoraTelRecado.Text;
      nomePessoaTelRecado := edtPessoaRecado.Text;
      email := edtEmail.Text;
   end;
   result := objContatos;
end;

procedure TfrmCadPaciente.InclusaoContatos;
var
   objContatos : TContatos;
   objControlePaciente : TControlePaciente;
begin
   try
      objContatos := TContatos.Create;
      objControlePaciente := TControlePaciente.Create;
      if objControlePaciente.InclusaoContatos(CarregaObjContatos(objContatos))then
       begin
          try
             frmMensagem := TfrmMensagem.Create(Self);
             frmMensagem.InfoFormMensagem('Cadastro dos Contatos do Paciente', tiInformacao, 'Cadastrado dos Contatos realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
       end;

      DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objContatos);
   end;
end;

function TfrmCadPaciente.CarregaObjSinaisSintomas(objSinaisSintomas: TSinaisSintomas): TSinaisSintomas;
begin
   with objSinaisSintomas do
   begin
      idTblPaciente := StrToInt(edtCodPaciente.Text);
      alteracaoApetite := RetornoRadioGroup(rgexAlteracaoApetite.ItemIndex);
      calorExagerado := RetornoRadioGroup(rgexCalorExagerado.ItemIndex);
      cansaFacil := RetornoRadioGroup(rgexCansaFacil.ItemIndex);
      coceiraAnormal := RetornoRadioGroup(rgexCoceiraAnormal.ItemIndex);
      dificuldadeEngolir := RetornoRadioGroup(rgexDificuldadeEngolir.ItemIndex);
      dificuldadeMastigar := RetornoRadioGroup(rgexDificuldadeMastigar.ItemIndex);
      dorFacial := RetornoRadioGroup(rgexDorFacial.ItemIndex);
      dorFrequenteCabeca := RetornoRadioGroup(rgexDorCabecaFrequente.ItemIndex);
      dorOuvidoFrequente := RetornoRadioGroup(rgexDorOuvidoFrequente.ItemIndex);
      emagrecimentoAcentuado := RetornoRadioGroup(rgexEmagrecimentoAcentuado.ItemIndex);
      estaloMandibula := RetornoRadioGroup(rgexEstaloMandibula.ItemIndex);
      febreFrequente := RetornoRadioGroup(rgexFebreFrequente.ItemIndex);
      indigestaoFrequente := RetornoRadioGroup(rgexIndigestaoFrequente.ItemIndex);
      maCicatrizacao := RetornoRadioGroup(rgexMaCicatrizacao.ItemIndex);
      miccaoFrequente := RetornoRadioGroup(rgexMiccaoFrequente.ItemIndex);
      rangeDentes := RetornoRadioGroup(rgexRangeDentes.ItemIndex);
      respiraPelaBoca := RetornoRadioGroup(rgexRespiraPelaBoca.ItemIndex);
      sangramentoAnormal := RetornoRadioGroup(rgexSangramentoAnormal.ItemIndex);
      tonturaDesmaio := RetornoRadioGroup(rgexTonturasDesmaios.ItemIndex);
      poucaSaliva := RetornoRadioGroup(rgexPoucaSaliva.ItemIndex);
   end;
   result := objSinaisSintomas;
end;

procedure TfrmCadPaciente.InclusaoSinaisSintomas;
var
   objSinaisSintomas : TSinaisSintomas;
   objControlePaciente : TControlePaciente;
begin
   objSinaisSintomas := TSinaisSintomas.Create;
   objControlePaciente := TControlePaciente.Create;
   try
      if objControlePaciente.InclusaoSinaisSintomas(CarregaObjSinaisSintomas(objSinaisSintomas))then
       begin
          try
             frmMensagem := TfrmMensagem.Create(Self);
             frmMensagem.InfoFormMensagem('Cadastro de Sinais & Sintomas', tiInformacao, 'Cadastro dos Sinais & Sintomas realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
       end;

      DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objSinaisSintomas);
   end;
end;

function TfrmCadPaciente.CarregaObjEnfermidades(objEnfermidades: TEnfermidades): TEnfermidades;
begin
   with objEnfermidades do
   begin
      idTblPaciente := StrToInt(edtCodPaciente.Text);
      aids := RetornoRadioGroup(rgexAIDS.ItemIndex);
      anemia := RetornoRadioGroup(rgexAnemia.ItemIndex);
      asma := RetornoRadioGroup(rgexAsma.ItemIndex);
      diabete := RetornoRadioGroup(rgexDiabetes.ItemIndex);
      disritmiaEpilepsia := RetornoRadioGroup(rgDisritmiaEpilepsia.ItemIndex);
      doencaCoracao := RetornoRadioGroup(rgexDoencaCoracao.ItemIndex);
      doencaRenal := RetornoRadioGroup(rgDoencaRenal.ItemIndex);
      febreReumatica := RetornoRadioGroup(rgFebreReumatica.ItemIndex);
      glaucoma := RetornoRadioGroup(rgGlaucoma.ItemIndex);
      gonorreia := RetornoRadioGroup(rgGonorreia.ItemIndex);
      hanseniase := RetornoRadioGroup(rgHanseniase.ItemIndex);
      hemofilia := RetornoRadioGroup(rgHemofilia.ItemIndex);
      hepatite := RetornoRadioGroup(rgHepatite.ItemIndex);
      ictericia := RetornoRadioGroup(rgIctericia.ItemIndex);
      problemaHormonal := RetornoRadioGroup(rgProblemaHormonal.ItemIndex);
      sifilis := RetornoRadioGroup(rgSifilis.ItemIndex);
      sinusite := RetornoRadioGroup(rgSinusite.ItemIndex);
      tuberculose := RetornoRadioGroup(rgTuberculose.ItemIndex);
      tumorBoca := RetornoRadioGroup(rgTumorBoca.ItemIndex);
      ulceraHepatica := RetornoRadioGroup(rgUlceraHepatica.ItemIndex);
   end;
end;

procedure TfrmCadPaciente.InclusaoEnfermidades;
var
   objEnfermidades : TEnfermidades;
   objControlePaciente : TControlePaciente;
begin
   objEnfermidades := TEnfermidades.Create;
   objControlePaciente := TControlePaciente.Create;
   try
      if objControlePaciente.InclusaoEnfermidades(CarregaObjEnfermidades(objEnfermidades))then
       begin
           try
              frmMensagem := TfrmMensagem.Create(Self);
              frmMensagem.InfoFormMensagem('Cadastro de Enfermidades', tiInformacao, 'Cadastro das Enfermidades realizado com sucesso!');
           finally
              FreeAndNil(frmMensagem);
           end;
       end;

      DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objEnfermidades);
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

