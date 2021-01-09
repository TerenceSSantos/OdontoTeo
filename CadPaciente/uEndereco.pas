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
       class procedure InclusaoOuEdicaoEndereco(frm: TfrmCadPaciente; qualTabela: byte);
       class procedure EdicaoEndereco(frm: TfrmCadPaciente);
       class procedure ApagarEndereco(codigo: integer);

   end;

implementation

{ Endereco }

class function Endereco.CarregaObjEndereco(objEndereco: TEndereco; frm: TfrmCadPaciente; qualTabela: byte): TEndereco;
var
   codigo : integer = 0;
begin
   with objEndereco do                // 8 = TBL_PACIENTE
   begin                              // 9 = TBL_DADOSPROF
      case qualTabela of
         8 : begin
                codigo := StrToInt(frm.edtCodEndPaciente.Text);
                logradouro := frm.edtLogradouro.Text;
                numero := frm.edtNumEndereco.Text;
                complemento := frm.edtComplemento.Text;
                bairro := frm.edtBairro.Text;
                cidade := frm.edtCidade.Text;
                objEndereco.estado := frm.cboxUFCasa.Text;
                cep := frm.mskedtCEPCasa.Text;
                idTblPaciente := StrToInt(frm.edtCodPaciente.Text);
             end;
         9 : begin
                logradouro := frm.edtLogradEmpresa.Text;
                numero := frm.edtNumEndEmpresa.Text;
                complemento := frm.edtComplEmpresa.Text;
                bairro := frm.edtBairroEmpresa.Text;
                cidade := frm.edtCidadeEmpresa.Text;
                estado := frm.cboxUFEmpresa.Text;
                cep := frm.mskedtCEPEmpresa.Text;
                idTblDadosProf := StrToInt(frm.edtCodEndDadosProf.Text);
             end;
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
          case qualTabela of
             8 : frm.edtCodEndPaciente.Text := IntToStr(codEndereco);
             9 : frm.edtCodEndDadosProf.Text := IntToStr(codEndereco);
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

class procedure Endereco.EdicaoEndereco(frm: TfrmCadPaciente);
var
   objControlePaciente : TControlePaciente;
   objEndereco : TEndereco;
   codigo : integer = 0;
begin
   try
      objEndereco := TEndereco.Create;
      objControlePaciente := TControlePaciente.Create;
    //  objEndereco := CarregaObjEndereco(objEndereco, frm);
      codigo := objControlePaciente.InclusaoOuEdicaoEndereco(objEndereco);
      if codigo > 0 then
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

