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
var
   codigo : integer = 0;
begin
   with objDocumentos do
   begin
      case qualTabela of
         3 : begin
                identidade := frm.edtIdentidadePaciente.Text;
                orgaoExpedidor := frm.edtOrgaoExpedPaciente.Text;
                cpf := frm.mskedtCPFPaciente.Text;
                codigo := StrToInt(frm.edtCodPaciente.Text);
                idTblPaciente := codigo;
             end;
         4 : begin
                identidade := frm.edtIdentidadeResp.Text;
                orgaoExpedidor := frm.edtOrgaoExpedResp.Text;
                cpf := frm.mskedtCPFResp.Text;                     { TODO -oTerence -cCadastro : Ajustar }
                codigo := StrToInt(frm.edtCodResponsavel.Text);
                idTblResponsavel := codigo;
             end;
      end;
   end;
   result := objDocumentos;
end;

class procedure Documentos.InclusaoOuEdicaoDocumentos(frm: TfrmCadPaciente; qualTabela: integer);
var
  objDocumentos : TDocumentos;
  objControlePaciente : TControlePaciente;
  codDocumento : integer;
begin                                                              // 3 = TBLPACIENTE
   try                                                             // 4 = TBLRESPONSAVEL
      objDocumentos := TDocumentos.Create;                         // 5 = TBLDENTISTA
      objControlePaciente := TControlePaciente.Create;
      codDocumento := objControlePaciente.InclusaoOuEdicaoDocumentos(CarregaObjDocumentos(objDocumentos, frm, qualTabela));
      if codDocumento > 0 then
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro de Documentos', tiInformacao, 'Gravação dos Documentos realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
          case qualTabela of
             3 : frm.edtCodDocPaciente.Text := IntToStr(codDocumento);
             4 : frm.edtCodDocResp.Text := IntToStr(codDocumento);
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

