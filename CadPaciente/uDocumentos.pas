unit uDocumentos;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uCadPacientes, uClassDocumentos, uClassControlePaciente, uFrmMensagem;

type

   { Documentos }

   Documentos = class
     class function CarregaObjDocumentos(objDocumentos: TDocumentos; frm: TFrmCadPaciente): TDocumentos;
     class procedure InclusaoOuEdicaoDocumentos(frm: TfrmCadPaciente);
   end;

implementation

{ Documentos }

class function Documentos.CarregaObjDocumentos(objDocumentos: TDocumentos; frm: TFrmCadPaciente): TDocumentos;
begin
   with objDocumentos do
   begin
      identidade := frm.edtIdentidadePaciente.Text;
      orgaoExpedidor := frm.edtOrgaoExpedPaciente.Text;
      cpf := frm.mskedtCPFPaciente.Text;
      idTblPaciente := StrToInt(frm.edtCodPaciente.Text);
   end;
   result := objDocumentos;
end;

class procedure Documentos.InclusaoOuEdicaoDocumentos(frm: TfrmCadPaciente);
var
  objDocumentos : TDocumentos;
  objControlePaciente : TControlePaciente;
begin
   try
      objDocumentos := TEndereco.Create;
      objControlePaciente := TControlePaciente.Create;
      if objControlePaciente.InclusaoEndereco(CarregaObjEndereco(objDocumentos, frm)) then
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro de Documentos', tiInformacao, 'Gravação dos Documentos realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
       end;

      //DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objDocumentos);
   end;
end;

end.

