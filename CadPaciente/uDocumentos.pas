unit uDocumentos;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uCadPacientes, uClassDocumentos, uClassControlePaciente, uFrmMensagem;

type

   { Documentos }

   Documentos = class
     class function CarregaObjDocumentos(objDocumentos: TDocumentos; frm: TFrmCadPaciente; qualTabela: integer): TDocumentos;
     class procedure InclusaoOuEdicaoDocumentos(frm: TfrmCadPaciente; qualTabela: integer);
   end;

implementation

{ Documentos }

class function Documentos.CarregaObjDocumentos(objDocumentos: TDocumentos; frm: TFrmCadPaciente; qualTabela: integer): TDocumentos;
begin
   with objDocumentos do
   begin
      identidade := frm.edtIdentidadePaciente.Text;
      orgaoExpedidor := frm.edtOrgaoExpedPaciente.Text;
      cpf := frm.mskedtCPFPaciente.Text;
      case qualTabela of
         3 : idTblPaciente := StrToInt(frm.edtCodPaciente.Text);

{       4 : idTblResponsavel : ;
         5 : idTblDentista : ; }
      end;

   end;
   result := objDocumentos;
end;

class procedure Documentos.InclusaoOuEdicaoDocumentos(frm: TfrmCadPaciente;
   qualTabela: integer);
var
  objDocumentos : TDocumentos;
  objControlePaciente : TControlePaciente;
begin                                                              // 3 = TBLPACIENTE
   try                                                             // 4 = TBLRESPONSAVEL
      objDocumentos := TDocumentos.Create;                         // 5 = TBLDENTISTA
      objControlePaciente := TControlePaciente.Create;
      if objControlePaciente.InclusaoOuEdicaoDocumentos(CarregaObjDocumentos(objDocumentos, frm, qualTabela)) then
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

