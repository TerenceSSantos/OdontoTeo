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
       class function CarregaObjEndereco(objEndereco: TEndereco; frm: TfrmCadPaciente; qualTabela: byte): TEndereco;
       class procedure InclusaoOuEdicaoEndereco(frm: TfrmCadPaciente;
          qualTabela: byte);
       class procedure EdicaoEndereco(frm: TfrmCadPaciente);
       class procedure ApagarEndereco(codigo: integer);

   end;

implementation

{ Endereco }

class function Endereco.CarregaObjEndereco(objEndereco: TEndereco; frm: TfrmCadPaciente; qualTabela: byte): TEndereco;
begin
   with objEndereco do                                                                 // 8 = TBLPACIENTE
   begin                                                                               // 9 = TBLDADOSPROF
      idTblPaciente := StrToInt(frm.edtCodPaciente.Text);
      logradouro := frm.edtLogradouro.Text;
      numero := frm.edtNumEndereco.Text;
      complemento := frm.edtComplemento.Text;
      bairro := frm.edtBairro.Text;
      cidade := frm.edtCidade.Text;
      objEndereco.estado := frm.cboxUFCasa.Text;
      cep := frm.mskedtCEPCasa.Text;
      case qualTabela of
         8 : idTblPaciente := StrToInt(frm.edtCodEndPaciente.Text);
         9 : idTblDadosProf := StrToInt(frm.edtCodEndPaciente.Text);
      end;
   end;
   result := objEndereco;
end;

class procedure Endereco.InclusaoOuEdicaoEndereco(frm: TfrmCadPaciente; qualTabela: byte);
var
   objEndereco : TEndereco;                                                                  // 8 = TBLPACIENTE
   objControlePaciente : TControlePaciente;                                                  // 9 = TBLDADOSPROF
   codEndereco : integer;
begin
   try
      objEndereco := TEndereco.Create;
      objControlePaciente := TControlePaciente.Create;
      codEndereco := objControlePaciente.InclusaoOuEdicaoEndereco(CarregaObjEndereco(objEndereco, frm, qualTabela));
      if codEndereco > 0 then
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro do Endereço do Paciente', tiInformacao, 'Cadastrado do Endereço realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
          frm.edtCodEndPaciente.Text := IntToStr(codEndereco);
       end;

      //DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objEndereco);
   end;

end;

class procedure Endereco.EdicaoEndereco(frm: TfrmCadPaciente);
var
   objControlePaciente : TControlePaciente;
   objEndereco : TEndereco;
begin
   try
      objEndereco := TEndereco.Create;
      objControlePaciente := TControlePaciente.Create;
    //  objEndereco := CarregaObjEndereco(objEndereco, frm);
      if objControlePaciente.EdicaoEndereco(objEndereco) then
       begin
         try
            frmMensagem := TfrmMensagem.Create(nil);
            frmMensagem.InfoFormMensagem('Alteração no cadastro de Endereço', tiInformacao, 'Endereço alterado com sucesso!');
         finally
            FreeAndNil(frmMensagem);
         end;
       end;

      //DesabilitaControles(frmCadPaciente.pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objEndereco);
   end;
end;

class procedure Endereco.ApagarEndereco(codigo: integer);
var
   objControlePaciente : TControlePaciente;
   frmMensagem : TfrmMensagem;
begin
   objControlePaciente := TControlePaciente.Create;
   //if objControlePaciente(codigo) then
   //begin
   //   try
   //         frmMensagem := TfrmMensagem.Create(nil);
   //         frmMensagem.InfoFormMensagem('Remoção do cadastro do paciente', tiInformacao, 'Paciente removido com sucesso!');
   //      finally
   //         FreeAndNil(frmMensagem);
   //      end;
   //end;
end;

end.

