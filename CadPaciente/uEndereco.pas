unit uEndereco;

{**********************************************************************
**                       unit uEndereco                              **
**                                                                   **
** UNIT DESTINADA A MANIPULAR AS INFORMAÇÕES NO CADASTRO DE PACIENTE **
** REFERENTE AS INFORMAÇÕES DENTRO DA ABA ENDEREÇO                   **
**                                                                   **
***********************************************************************}

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uClassControlePaciente, uFrmMensagem, uClassEndereco, uCadPacientes;

type

   { Endereco }

   Endereco = class
    public
       class function CarregaObjEndereco(objEndereco: TEndereco; frm: TfrmCadPaciente): TEndereco;
       class procedure InclusaoEndereco(frm: TfrmCadPaciente);

   end;

implementation

{ Endereco }

class function Endereco.CarregaObjEndereco(objEndereco: TEndereco; frm: TfrmCadPaciente): TEndereco;
begin
   with objEndereco do
   begin
      idTblPaciente := StrToInt(frm.edtCodPaciente.Text);
      logradouro := frm.edtLogradouro.Text;
      numero := frm.edtNumEndereco.Text;
      complemento := frm.edtComplemento.Text;
      bairro := frm.edtBairro.Text;
      cidade := frm.edtCidade.Text;
      objEndereco.estado := frm.cboxUFCasa.Text;
      cep := frm.mskedtCEPCasa.Text;
   end;
   result := objEndereco;
end;

class procedure Endereco.InclusaoEndereco(frm: TfrmCadPaciente);
var
   objEndereco : TEndereco;
   objControlePaciente : TControlePaciente;
begin
   try
      objEndereco := TEndereco.Create;
      objControlePaciente := TControlePaciente.Create;
      if objControlePaciente.InclusaoEndereco(CarregaObjEndereco(objEndereco, frm)) > 0 then
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro do Endereço do Paciente', tiInformacao, 'Cadastrado do Endereço realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
       end;

      //DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objEndereco);
   end;

end;

end.

