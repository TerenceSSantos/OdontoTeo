unit uDadosBasicos;

{**********************************************************************
**                      unit uDadosBasicos                           **
**                                                                   **
** UNIT DESTINADA A MANIPULAR AS INFORMAÇÕES NO CADASTRO DE PACIENTE **
** REFERENTE AS INFORMAÇÕES DENTRO DA ABA DE DADOS BÁSICOS           **
**                                                                   **
***********************************************************************}

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uCadPacientes, uClassPaciente, DateTimePicker, uClassControlePaciente, uFrmMensagem;

type

   { DadosBasicos }

   DadosBasicos = class
    public
      class procedure InsertEditDadosBasicos(frm: TfrmCadPaciente);
      class function CarregaObjDadosBasicos(objDados: TPaciente; frm: TfrmCadPaciente): TPaciente;
      class procedure ApagarDadosBasico(codigo: integer);
   end;



implementation

{ DadosBasicos }

class procedure DadosBasicos.InsertEditDadosBasicos(frm: TfrmCadPaciente);
var
   objDadosBasicos : TPaciente;
   objControlePaciente : TControlePaciente;
   codigo : integer;
   frmMensagem : TfrmMensagem;
begin
   if Trim(frm.edtNomePaciente.Text) = '' then
   begin
      try
         frmMensagem := TfrmMensagem.Create(nil);
         frmMensagem.InfoFormMensagem('A T E N Ç Ã O', tiAviso, 'O nome do paciente deve ser preenchido!');
      finally
         FreeAndNil(frmMensagem);
      end;
      frm.edtNomePaciente.SetFocus;
      exit;
   end;
   try
      objDadosBasicos := TPaciente.Create;
      objControlePaciente := TControlePaciente.Create;
      objDadosBasicos := CarregaObjDadosBasicos(objDadosBasicos, frm);
      codigo := objControlePaciente.InsertEditDadosBasicos(objDadosBasicos);
      if codigo > 0 then
      begin
         try
            frmMensagem := TfrmMensagem.Create(nil);
            frmMensagem.InfoFormMensagem('Cadastro do paciente', tiInformacao, 'Paciente cadastrado com sucesso!');
         finally
            FreeAndNil(frmMensagem);
         end;
         frm.lblCodPaciente.Caption := 'Código: ' + IntToStr(codigo);
         frm.lblNomePaciente.Caption := 'Nome do Paciente: ' + frm.edtNomePaciente.Text;
         if objDadosBasicos.dataNascimento <> StrToDate('30/12/1899')then
            frm.lblIdade.Caption := objDadosBasicos.RetornoIdadeCompleta;
         frm.edtCodPaciente.Text := IntToStr(codigo);

         //DesabilitaControles(pcCadPaciente.ActivePage);
         //estado := teNavegacao;
         //EstadoBotoes;
      end
      else
         frm.lblCodPaciente.Caption := 'Código: ';
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objDadosBasicos);
   end;
end;

class function DadosBasicos.CarregaObjDadosBasicos(objDados: TPaciente; frm: TfrmCadPaciente): TPaciente;
begin
   with objDados do               {** PREENCHER O OBJETO PACIENTE COM OS SEUS DADOS BASÍCOS QUE ESTÃO NO FORM **}
   begin
      if frm.chkboxAtivo.Checked then
         ativo := 'A'
      else
         ativo := 'I';

      if frm.edtCodPaciente.Text = EmptyStr then  // Caso vazio o ID recebe zero, senão preenche a instancia com o ID exisstente
         idPaciente := 0
      else
         idPaciente := StrToInt(frm.edtCodPaciente.Text);

      nomePaciente := frm.edtNomePaciente.Text;
      nomePai := frm.edtNomePai.Text;
      nomeMae := frm.edtNomeMae.Text;
      estadoCivil := frm.cboxEstCivil.Text;
      nomeConjuge := frm.edtNomeConjuge.Text;

      case frm.rgexSexo.ItemIndex of
         0 : sexo := 'F';
         1 : sexo := 'M';
      end;
      if not(IsNullDate(frm.dtpkNascimento.Date)) then
         dataNascimento := frm.dtpkNascimento.Date;
      naturalidade := frm.edtNaturalidade.Text;
      ufNascimento := frm.cboxUFNascimento.Text;
      nacionalidade := frm.edtNacionalidade.Text;
      //CPF := frm.mskedtCPFPaciente.Text;
      //identidadePaciente := frm.edtIdentidadePaciente.Text;
      //orgaoExpedidorID := frm.edtOrgaoExpedPaciente.Text;
   end;
   result := objDados;
end;

class procedure DadosBasicos.ApagarDadosBasico(codigo: integer);
var
   frmMensagem : TfrmMensagem;
   objControlePaciente : TControlePaciente;
begin
   objControlePaciente := TControlePaciente.Create;
   if objControlePaciente.ApagarCadastroBasico(codigo) then
   begin
      try
            frmMensagem := TfrmMensagem.Create(nil);
            frmMensagem.InfoFormMensagem('Remoção do cadastro do paciente', tiInformacao, 'Paciente removido com sucesso!');
         finally
            FreeAndNil(frmMensagem);
         end;
   end;
end;

end.

