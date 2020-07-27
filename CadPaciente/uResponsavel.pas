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

end.

