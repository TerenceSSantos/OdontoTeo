unit uResponsavel;

{**********************************************************************
**                       unit uResponsavel                           **
**                                                                   **
** UNIT DESTINADA A MANIPULAR AS INFORMAÇÕES NO CADASTRO DE PACIENTE **
** REFERENTE AS INFORMAÇÕES DENTRO DA ABA RESPONSÁVEL PELO PACIENTE  **
**                                                                   **
***********************************************************************}

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uCadPacientes, uClassResponsavelPaciente, uClassControlePaciente, uFrmMensagem;

type

   { Responsavel }

   Responsavel = class
    public
       class function CarregaObjResponsavel(objResponsavel: TResponsavelPaciente; frm: TfrmCadPaciente): TResponsavelPaciente;
       class procedure InclusaoResponsavel(frm: TfrmCadPaciente);
       class procedure EdicaoResponsavel(frm: TfrmCadPaciente);
       class procedure ApagarResponsavel(codigo: integer);
   end;

implementation

{ Responsavel }

class function Responsavel.CarregaObjResponsavel(objResponsavel: TResponsavelPaciente; frm: TfrmCadPaciente): TResponsavelPaciente;
begin
   objResponsavel.idPaciente := StrToInt(frm.edtCodPaciente.Text);
   objResponsavel.nomeResponsavel := frm.edtNomeResp.Text;
   objResponsavel.parentesco := frm.edtParentesco.Text;
   objResponsavel.cpfResponsavel := frm.mskedtCPFResp.Text;
   objResponsavel.identidadeResponsavel := frm.edtIdentidadeResp.Text;
   objResponsavel.orgaoExpedidorID := frm.edtOrgaoExpedResp.Text;
   result := objResponsavel;
end;

class procedure Responsavel.InclusaoResponsavel(frm: TfrmCadPaciente);
var
   objResponsavel : TResponsavelPaciente;
   objControlePaciente : TControlePaciente;
begin
   try
      objResponsavel := TResponsavelPaciente.Create;
      objControlePaciente := TControlePaciente.Create;
      if objControlePaciente.InclusaoResponsavel(CarregaObjResponsavel(objResponsavel, frm))then
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro do Responsável', tiInformacao, 'Cadastro do Responsável realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
       end;

      //DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objResponsavel);
   end;

end;

class procedure Responsavel.EdicaoResponsavel(frm: TfrmCadPaciente);
var
   objResponsavel : TResponsavelPaciente;
   objControlePaciente : TControlePaciente;
   frmMensagem : TfrmMensagem;
begin
   if Trim(frmCadPaciente.edtNomeResp.Text) = '' then
    begin
       try
          frmMensagem := TfrmMensagem.Create(nil);
          frmMensagem.InfoFormMensagem('Alteração no cadastro do Responsável', tiInformacao, 'O nome do Responsável deve ser preenchido!');
       finally
          FreeAndNil(frmMensagem);
       end;
       frmCadPaciente.edtNomeResp.SetFocus;
       exit;
    end;
   try
      objResponsavel := TResponsavelPaciente.Create;
      objControlePaciente := TControlePaciente.Create;
      objResponsavel := CarregaObjResponsavel(objResponsavel, frm);
      if objControlePaciente.EdicaoResponsavel(objResponsavel) then
       begin
         try
            frmMensagem := TfrmMensagem.Create(nil);
            frmMensagem.InfoFormMensagem('Alteração no cadastro do Responsável', tiInformacao, 'Alteração no cadastro do Responsável' +
                                         ' realizado com sucesso!');
         finally
            FreeAndNil(frmMensagem);
         end;
       end;

      //DesabilitaControles(frmCadPaciente.pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objResponsavel);
   end;
end;

class procedure Responsavel.ApagarResponsavel(codigo: integer);
var
   frmMensagem : TfrmMensagem;
   objControlePaciente : TControlePaciente;
begin
   try
      objControlePaciente := TControlePaciente.Create;
      if objControlePaciente.ApagarResponsavel(codigo) then
      begin
         try
            frmMensagem := TfrmMensagem.Create(nil);
            frmMensagem.InfoFormMensagem('Remoção do Responsável do paciente', tiInformacao, 'Responsável removido com sucesso!');
         finally
            FreeAndNil(frmMensagem);
         end;
      end;
   finally
      FreeAndNil(objControlePaciente);
   end;

end;

end.

