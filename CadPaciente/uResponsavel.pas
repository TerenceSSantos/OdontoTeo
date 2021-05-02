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
       class procedure InclusaoOuEdicaoResponsavel(frm: TfrmCadPaciente);

       class procedure ApagarResponsavel(codigo: integer);
   end;

implementation

{ Responsavel }

class function Responsavel.CarregaObjResponsavel(objResponsavel: TResponsavelPaciente; frm: TfrmCadPaciente): TResponsavelPaciente;
var
   codigo : integer;
begin
   codigo := StrToInt(frm.edtCodResponsavel.Text);
   objResponsavel.idResponsavel := codigo;
   objResponsavel.idTblPaciente := StrToInt(frm.edtCodPaciente.Text);
   objResponsavel.nomeResponsavel := frm.edtNomeResp.Text;
   objResponsavel.parentesco := frm.edtParentesco.Text;
   objResponsavel.cpfResponsavel := frm.mskedtCPFResp.Text;
   objResponsavel.identidadeResponsavel := frm.edtIdentidadeResp.Text;
   objResponsavel.orgaoExpedidor := frm.edtOrgaoExpedResp.Text;
   result := objResponsavel;
end;

class procedure Responsavel.InclusaoOuEdicaoResponsavel(frm: TfrmCadPaciente);
var
   objResponsavel: TResponsavelPaciente;
   objControlePaciente : TControlePaciente;
   codResponsavel : integer;
begin
   try
      objResponsavel := TResponsavelPaciente.Create;
      objControlePaciente := TControlePaciente.Create;
      codResponsavel := objControlePaciente.InclusaoOuEdicaoResponsavel(CarregaObjResponsavel(objResponsavel, frm));
      if codResponsavel > 0 then;
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro do Responsável', tiInformacao, 'Cadastro do Responsável realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
          frm.edtCodResponsavel.Text := IntToStr(codResponsavel);
       end;

      //DesabilitaControles(pcCadPaciente.ActivePage);
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

