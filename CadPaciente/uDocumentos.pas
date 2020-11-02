unit uDocumentos;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uCadPacientes, uClassDocumentos, uClassControlePaciente, uFrmMensagem;

type

   { Documentos }

   Documentos = class
     class function CarregaObjDocumentos(objDocumentos: TDocumentos; frm: TFrmCadPaciente): TDocumentos;
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
end;

end.

