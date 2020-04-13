unit uCadPacientes;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls, MaskEdit, {CustomDrawnControls,}
   DateTimePicker, BCPanel, BCButton, uClassPaciente;

type

   { TfrmCadPaciente }

   TfrmCadPaciente = class(TForm)
      bvSinaisSintomas: TBevel;
      bvEndereco: TBevel;
      bvContatos: TBevel;
      bvEndereco1: TBevel;
      bvSinaisSintomas1: TBevel;
      cboxConsAcucar: TComboBox;
      cboxEscovacao: TComboBox;
      cboxConsAcucar2: TComboBox;
      cboxOperadoraTelTrab: TComboBox;
      cboxOperadoraTelRecado: TComboBox;
      cboxUFCasa: TComboBox;
      cboxOperadoraCasa: TComboBox;
      cboxOperadoraCel1: TComboBox;
      cboxOperadoraCel2: TComboBox;
      cboxUFEmpresa: TComboBox;
      CheckBox1: TCheckBox;
      CheckBox10: TCheckBox;
      CheckBox11: TCheckBox;
      CheckBox12: TCheckBox;
      CheckBox13: TCheckBox;
      CheckBox14: TCheckBox;
      CheckBox15: TCheckBox;
      CheckBox16: TCheckBox;
      CheckBox17: TCheckBox;
      CheckBox18: TCheckBox;
      CheckBox19: TCheckBox;
      CheckBox2: TCheckBox;
      CheckBox20: TCheckBox;
      CheckBox21: TCheckBox;
      CheckBox22: TCheckBox;
      CheckBox23: TCheckBox;
      CheckBox24: TCheckBox;
      CheckBox25: TCheckBox;
      CheckBox26: TCheckBox;
      CheckBox27: TCheckBox;
      CheckBox28: TCheckBox;
      CheckBox29: TCheckBox;
      CheckBox3: TCheckBox;
      CheckBox30: TCheckBox;
      CheckBox31: TCheckBox;
      CheckBox32: TCheckBox;
      CheckBox33: TCheckBox;
      CheckBox34: TCheckBox;
      CheckBox35: TCheckBox;
      CheckBox36: TCheckBox;
      CheckBox37: TCheckBox;
      CheckBox38: TCheckBox;
      CheckBox39: TCheckBox;
      CheckBox4: TCheckBox;
      CheckBox40: TCheckBox;
      CheckBox5: TCheckBox;
      CheckBox6: TCheckBox;
      CheckBox7: TCheckBox;
      CheckBox8: TCheckBox;
      CheckBox9: TCheckBox;
      chkboxAtivo: TCheckBox;
      edtHabitosViciosos: TEdit;
      edtBairroEmpresa: TEdit;
      edtCidadeEmpresa: TEdit;
      edtComplEmpresa: TEdit;
      edtAntecFamiliar: TEdit;
      edtLogradEmpresa: TEdit;
      edtNomeEmpresa: TEdit;
      edtNumEndEmpresa: TEdit;
      edtCargo: TEdit;
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
      edtPessoaRecado: TEdit;
      edtTelTrab: TEdit;
      edtTelRecado: TEdit;
      edtDDDTelTrab: TEdit;
      edtDDDTelRecado: TEdit;
      edtNumEndereco: TEdit;
      edtIdentidadeResp: TEdit;
      edtIdentidadePaciente: TEdit;
      edtCidade: TEdit;
      edtBairro: TEdit;
      edtLogradouro: TEdit;
      edtComplemento: TEdit;
      edtDDDCasa: TEdit;
      edtDDDCel1: TEdit;
      edtDDDCel2: TEdit;
      edtOrgaoExpedResp: TEdit;
      edtOrgaoExpedPaciente: TEdit;
      edtTelCasa: TEdit;
      edtCelular1: TEdit;
      edtCelular2: TEdit;
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
      lblBairroEmpresa: TLabel;
      lblCEPEmpresa: TLabel;
      lblCidadeEmpresea: TLabel;
      lblComplEmpresa: TLabel;
      lblAntecFamiliar: TLabel;
      lblObsAnatHistPatol: TLabel;
      lblHabitosViciosos: TLabel;
      lblEscovacao: TLabel;
      lblUsoFioDental: TLabel;
      lblLogradEmpresa: TLabel;
      lblNomeEmpresa: TLabel;
      lblNumEndEmpresa: TLabel;
      lblCargo: TLabel;
      lblConsAcucar: TLabel;
      lblPessoaRecado: TLabel;
      lblTelTrab: TLabel;
      lblTelRecado: TLabel;
      lblDDDTelTrab: TLabel;
      lblDDDTelRecado: TLabel;
      lblNumEndereco: TLabel;
      lblCPFResp: TLabel;
      lblCPFPaciente: TLabel;
      lblCEPCasa: TLabel;
      lblIdentidadeResp: TLabel;
      lblIdentidadePaciente: TLabel;
      lblBairro: TLabel;
      lblCidade: TLabel;
      lblDDDCasa: TLabel;
      lblDDDCel1: TLabel;
      lblDDDCel2: TLabel;
      lblOperadoraTelTrab: TLabel;
      lblOperadorTelRecado: TLabel;
      lblOrgaoExpResp: TLabel;
      lblOrgaoExpedPaciente: TLabel;
      lblLogradouro: TLabel;
      lblComplemento: TLabel;
      lblTelCasa: TLabel;
      lblOperadoraCasa: TLabel;
      lblCel1: TLabel;
      lblOperadoraCel: TLabel;
      lblCelular2: TLabel;
      lblOperadorCel2: TLabel;
      lblUFCasa: TLabel;
      lblUFEmpresa: TLabel;
      memoObsAnatHistPatol: TMemo;
      mskedtCEPEmpresa: TMaskEdit;
      mskedtCPFResp: TMaskEdit;
      mskedtCPFPaciente: TMaskEdit;
      mskedtCEPCasa: TMaskEdit;
      pnlAnamnese: TBCPanel;
      pnlDadosBasicos: TBCPanel;
      pnlEndereco: TBCPanel;
      pnlDadosProfissionais: TBCPanel;
      pnlResponsavel: TBCPanel;
      bvDadosBasicos: TBevel;
      bvSexo: TBevel;
      bvResponsavel: TBevel;
      bvDocumentos: TBevel;
      edtIdentidadeResp1: TEdit;
      edtParentesco: TEdit;
      edtNomeResp: TEdit;
      edtOrgaoExpedidorResp1: TEdit;
      lblCodigoPaciente: TLabel;
      lblParaDataVazia: TLabel;
      lblCPFResp1: TLabel;
      lblIdentidadeResp1: TLabel;
      lblParentesco: TLabel;
      lblOrgaoExpedidorResp1: TLabel;
      lblNomeResponsavel: TLabel;
      mskedtCPFResp1: TMaskEdit;
      pcCadPaciente: TPageControl;
      btnAlteraCadastro: TBitBtn;
      btnApagaCadastro: TBitBtn;
      btnGravaCadastro: TBitBtn;
      btnCancelaCadastro: TBitBtn;
      btnSaiCadastro: TBitBtn;
      cboxEstCivil: TComboBox;
      cboxUFNascimento: TComboBox;
      dtpkNascimento: TDateTimePicker;
      edtCodPaciente: TEdit;
      edtNomePaciente: TEdit;
      edtNomePai: TEdit;
      edtNomeMae: TEdit;
      edtNomeConjuge: TEdit;
      edtNaturalidade: TEdit;
      edtNacionalidade: TEdit;
      edtOrgaoExpedidorResp: TEdit;
      lblDtNascimento: TLabel;
      lblOrgaoExpedidorResp: TLabel;
      lblNomeResp: TLabel;
      lblUF: TLabel;
      lblSexo: TLabel;
      lblEstadoCivil: TLabel;
      lblPaciente: TLabel;
      lblIdade: TLabel;
      lblCodPaciente: TLabel;
      lblNomePaciente: TLabel;
      lblNomeConjuge: TLabel;
      lblNaturalidade: TLabel;
      lblNacionalidade: TLabel;
      lblPai: TLabel;
      lblMae: TLabel;
      miglstCadPaciente: TImageList;
//      pcCadPacientes: TPageControl;
      pnlBotoes: TBCPanel;
      btnNovoCadastro: TBitBtn;
      btnFechar: TBCButton;
      imgLogoTitulo: TImage;
      pnlBotoes1: TBCPanel;
      pnlDocumentos: TBCPanel;
      pnlContatos: TBCPanel;
      pnlSinaisSintomas: TBCPanel;
      pnlEnfermidades: TBCPanel;
      pnlTitulo: TBCPanel;
      btnProcuraPaciente: TSpeedButton;
      RadioButton1: TRadioButton;
      RadioButton10: TRadioButton;
      RadioButton11: TRadioButton;
      RadioButton12: TRadioButton;
      RadioButton13: TRadioButton;
      RadioButton14: TRadioButton;
      RadioButton15: TRadioButton;
      RadioButton16: TRadioButton;
      RadioButton17: TRadioButton;
      RadioButton18: TRadioButton;
      RadioButton19: TRadioButton;
      RadioButton2: TRadioButton;
      RadioButton20: TRadioButton;
      RadioButton21: TRadioButton;
      RadioButton22: TRadioButton;
      RadioButton23: TRadioButton;
      RadioButton24: TRadioButton;
      RadioButton25: TRadioButton;
      RadioButton26: TRadioButton;
      RadioButton27: TRadioButton;
      RadioButton28: TRadioButton;
      RadioButton29: TRadioButton;
      RadioButton3: TRadioButton;
      RadioButton30: TRadioButton;
      RadioButton31: TRadioButton;
      RadioButton32: TRadioButton;
      RadioButton33: TRadioButton;
      RadioButton34: TRadioButton;
      RadioButton4: TRadioButton;
      RadioButton5: TRadioButton;
      RadioButton6: TRadioButton;
      RadioButton7: TRadioButton;
      RadioButton8: TRadioButton;
      RadioButton9: TRadioButton;
      rbtnFeminino: TRadioButton;
      rbtnMasculino: TRadioButton;
      ScrollBox1: TScrollBox;
      tabDadosBasicos: TTabSheet;
      tabResponsavel: TTabSheet;
      tabEndereco: TTabSheet;
      tabContatos: TTabSheet;
      tabDadosProfissionais: TTabSheet;
      tabAnamnese: TTabSheet;
      tabEnfermidades: TTabSheet;
      tabDocumentos: TTabSheet;
      tabSinaisSintomas: TTabSheet;
      UpDown1: TUpDown;
      UpDown2: TUpDown;
      procedure btnAlteraCadastroClick(Sender: TObject);
      procedure btnCancelaCadastroClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnGravaCadastroClick(Sender: TObject);
      procedure btnNovoCadastroClick(Sender: TObject);
      procedure btnProcuraPacienteClick(Sender: TObject);
      procedure edtCodPacienteChange(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure pcCadPacienteChange(Sender: TObject);
      procedure pcCadPacienteChanging(Sender: TObject; var AllowChange: Boolean);
      procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   private
      procedure HabilitaControles(controle: TWinControl);
      procedure DesabilitaControles(controle: TWinControl);
      procedure EstadoBotoes;
      function CarregaObjDadosBasicos(objPaciente: TPaciente): TPaciente;
      procedure LimpaControles(controle: TWinControl);

   public
      procedure PreencheDadosBasicos(objCadPaciente: TPaciente);

   end;

   TipoEstado = (teNavegacao, teInclusao, teEdicao);

var
   frmCadPaciente: TfrmCadPaciente;
   capitura : boolean = false;
   px, py : integer;
   estado : TipoEstado = teNavegacao;    // teNavegacao, teInclusao, teEdicao

implementation

uses
   uClassControlePaciente; //   customdrawn_common;



{$R *.lfm}

{ TfrmCadPaciente }

procedure TfrmCadPaciente.btnFecharClick(Sender: TObject);
begin
   if estado in [teInclusao, teEdicao] then
      MessageDlg('A V I S O !', 'Você deve cancelar ou gravar o registro antes de sair!', mtWarning, [mbOK],0)
   else
      frmCadPaciente.Close;
end;

procedure TfrmCadPaciente.btnGravaCadastroClick(Sender: TObject);
var
   objPaciente : TPaciente;
   objControlePaciente : TControlePaciente;
   codigo : integer;
begin
   case estado of
      teInclusao : begin
                    if Trim(edtNomePaciente.Text) = '' then
                     begin
                        ShowMessage('O nome do paciente deve ser preenchido!');
                        edtNomePaciente.SetFocus;
                        exit;
                     end;
                     try
                        objPaciente := TPaciente.Create;
                        objControlePaciente := TControlePaciente.Create;
                        objPaciente := CarregaObjDadosBasicos(objPaciente);
                        codigo := objControlePaciente.GravarDadosBasicos(objPaciente, 0);
                        if codigo > 0 then
                        begin
                           ShowMessage('Paciente cadastrado com sucesso!');
                           lblCodPaciente.Caption := 'Código: ' + IntToStr(codigo);
                           lblNomePaciente.Caption := 'Nome do Paciente: ' + edtNomePaciente.Text;
                           lblIdade.Caption := objPaciente.RetornoIdadeCompleta;
                           edtCodPaciente.Text := IntToStr(codigo);
                           DesabilitaControles(pcCadPaciente.ActivePage);
                           estado := teNavegacao;
                           EstadoBotoes;
                        end
                        else
                           lblCodPaciente.Caption := 'Código: ';
                     finally
                        FreeAndNil(objControlePaciente);
                        FreeAndNil(objPaciente);
                     end;
                 end;

      teEdicao : begin
                    if Trim(edtNomePaciente.Text) = '' then
                     begin
                        ShowMessage('O nome do paciente deve ser preenchido!');
                        edtNomePaciente.SetFocus;
                        exit;
                     end;
                     try
                        objPaciente := TPaciente.Create;
                        objControlePaciente := TControlePaciente.Create;
                        objPaciente := CarregaObjDadosBasicos(objPaciente);

                        codigo := objControlePaciente.GravarDadosBasicos(objPaciente, 1);
                        if codigo > 0 then
                        begin
                           lblIdade.Caption := objPaciente.RetornoIdadeCompleta;
                           DesabilitaControles(pcCadPaciente.ActivePage);
                           estado := teNavegacao;
                           EstadoBotoes;
                        end;
              {             lblCodPaciente.Caption := 'Código: ' + IntToStr(codigo);
                           lblNomePaciente.Caption := 'Nome do Paciente: ' + edtNomePaciente.Text;
                           edtCodPaciente.Text := IntToStr(codigo);
                           DesabilitaControles(pcCadPaciente.ActivePage);
                           estado := teNavegacao;
                           EstadoBotoes;
                        end
                        else
                           lblCodPaciente.Caption := 'Código: ';    }
                     finally
                        FreeAndNil(objControlePaciente);
                        FreeAndNil(objPaciente);
                     end;
                 end
   else ;
   end;





end;

procedure TfrmCadPaciente.btnCancelaCadastroClick(Sender: TObject);
begin
   estado := teNavegacao;
   EstadoBotoes;
   DesabilitaControles(pcCadPaciente.ActivePage);
end;

procedure TfrmCadPaciente.btnAlteraCadastroClick(Sender: TObject);
begin
   estado := teEdicao;
   EstadoBotoes;
end;

procedure TfrmCadPaciente.btnNovoCadastroClick(Sender: TObject);
begin
   estado := teInclusao;
   HabilitaControles(pcCadPaciente.ActivePage);
   EstadoBotoes;
   LimpaControles(pcCadPaciente.ActivePage);
   lblCodPaciente.Caption := 'Código: ';
   lblNomePaciente.Caption := 'Nome do Paciente: ';
   lblIdade.Caption := 'Idade: ';
   if pcCadPaciente.PageIndex = 0 then
   begin
      chkboxAtivo.Checked := true;
      edtNomePaciente.SetFocus;
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
      exit                                   // A IDÉIA É PREENCHER COM ZEROS A ESQUERDA O CÓDIGO DO PACIENTE.
   else
   begin
      edtCodPaciente.Text := LeftStr('0', 1) + edtCodPaciente.Text;
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
      //else
      //begin
      //   btnProcuraPaciente.Enabled := true;
      //   btnAlteraCadastro.Enabled := true;
      //   btnApagaCadastro.Enabled := true;
      //end;
   finally
      FreeAndNil(objControlePaciente);
   end;
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
       frmCadPaciente.Top := Screen.WorkAreaHeight div 2 - frmCadPaciente.Height div 2;
   end;
end;

procedure TfrmCadPaciente.pcCadPacienteChanging(Sender: TObject; var AllowChange: Boolean);
begin
   if estado in [teEdicao, teInclusao] then
   begin
      AllowChange := false;
      ShowMessage('Você deve gravar ou cancelar a operação atual');
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
   begin
      btnNovoCadastro.Enabled := true;
      btnAlteraCadastro.Enabled := true;
      btnApagaCadastro.Enabled := true;
      btnGravaCadastro.Enabled := false;
      btnCancelaCadastro.Enabled := false;
      btnProcuraPaciente.Enabled := true;
   end;

end;

function TfrmCadPaciente.CarregaObjDadosBasicos(objPaciente : TPaciente) : TPaciente;
begin
   with objPaciente do               {** PREENCHER O OBJETO PACIENTE COM OS SEUS DADOS BASÍCOS QUE ESTÃO NO FORM **}
   begin
      if chkboxAtivo.Checked then
         ativo := 'A'
      else
         ativo := 'I';
      nomePaciente := edtNomePaciente.Text;
      nomePai := edtNomePai.Text;
      nomeMae := edtNomeMae.Text;
      estadoCivil := cboxEstCivil.Text;
      nomeConjuge := edtNomeConjuge.Text;
      if rbtnFeminino.Checked then
         sexo := 'F'
      else if rbtnMasculino.Checked then
         sexo := 'M';
      if not(IsNullDate(dtpkNascimento.Date)) then
         dataNascimento := dtpkNascimento.Date;
      naturalidade := edtNaturalidade.Text;
      ufNascimento := cboxUFNascimento.Text;
      nacionalidade := edtNacionalidade.Text;
   end;
   result := objPaciente;
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
            (controle.Controls[i] as TComboBox).Clear;
         if controle.Controls[i] is TRadioButton then
            (controle.Controls[i] as TRadioButton).Checked := false;
         if controle.Controls[i] is TDateTimePicker then
            (controle.Controls[i] as TDateTimePicker).Date := NullDate;
         if controle.Controls[i] is TCheckBox then
            (controle.Controls[i] as TCheckBox).Checked := false;

      end;
end;

procedure TfrmCadPaciente.PreencheDadosBasicos(objCadPaciente: TPaciente);
begin
   edtCodPaciente.Text := IntToStr(objCadpaciente.idPaciente);
   edtNomePaciente.Text := objCadpaciente.nomePaciente;
   if objCadPaciente.ativo = 'A' then
      chkboxAtivo.Checked := true
   else
      chkboxAtivo.Checked := false;

   edtNomePai.Text := objCadpaciente.nomePai;
   edtNomeMae.Text := objCadpaciente.nomeMae;
   cboxEstCivil.Text := objCadpaciente.estadoCivil;
   edtNomeConjuge.Text := objCadpaciente.nomeConjuge;
   if objCadpaciente.sexo = 'F' then
      rbtnFeminino.Checked := true
   else
   if objCadpaciente.sexo = 'M' then
      rbtnMasculino.Checked := true;

   if objCadPaciente.dataNascimento = StrToDate('30/12/1899') then
   begin
      dtpkNascimento.Date :=  NullDate;
      lblIdade.Caption := 'Idade: '
   end
   else
      dtpkNascimento.Date := objCadpaciente.dataNascimento;

   edtNaturalidade.Text := objCadpaciente.naturalidade;
   cboxUFNascimento.Text := objCadpaciente.ufNascimento;
   edtNacionalidade.Text := objCadpaciente.nacionalidade;

   lblCodPaciente.Caption := 'Código: ' + edtCodPaciente.Text;
   lblNomePaciente.Caption := 'Nome do Paciente: ' + edtNomePaciente.Text;
   lblIdade.Caption := objCadPaciente.RetornoIdadeCompleta;
end;


end.

