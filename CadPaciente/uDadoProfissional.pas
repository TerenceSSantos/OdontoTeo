unit uDadoProfissional;

{**********************************************************************
**                      unit uDadoProfissional                       **
**                                                                   **
** UNIT DESTINADA A MANIPULAR AS INFORMAÇÕES NO CADASTRO DE PACIENTE **
** REFERENTE AS INFORMAÇÕES DENTRO DA ABA DE DADOS PROFISSIONAIS     **
**                                                                   **
***********************************************************************}

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uCadPacientes, uClassControlePaciente, uClassDadosProfissionais, uFrmMensagem;

type

   { DadosProfissionais }

   DadosProfissionais = class
    public
       class function CarregaObjDadoProfissional(objDadoProf: TDadosProfissionais; frm: TfrmCadPaciente) : TDadosProfissionais;
       class procedure InclusaoDadoProfissional(frm: TfrmCadPaciente);
   end;

implementation

{ DadosProfissionais }

class function DadosProfissionais.CarregaObjDadoProfissional(objDadoProf: TDadosProfissionais; frm: TfrmCadPaciente): TDadosProfissionais;
begin
  with objDadoProf do
  begin
     nomeEmpresa := frm.edtNomeEmpresa.Text;
     cargo := frm.edtCargo.Text;
     idTblPaciente := StrToInt(frm.edtCodPaciente.Text);
     enderecoEmpresa.idTblPaciente := StrToInt(frm.edtCodPaciente.Text);
     enderecoEmpresa.logradouro := frm.edtLogradEmpresa.Text;
     enderecoEmpresa.numero := frm.edtNumEndEmpresa.Text;
     enderecoEmpresa.complemento := frm.edtComplEmpresa.Text;
     enderecoEmpresa.bairro := frm.edtBairroEmpresa.Text;
     enderecoEmpresa.cidade := frm.edtCidadeEmpresa.Text;
     enderecoEmpresa.estado := frm.cboxUFEmpresa.Text;
     enderecoEmpresa.cep := frm.mskedtCEPEmpresa.Text;
  end;
  result := objDadoProf;
end;

class procedure DadosProfissionais.InclusaoDadoProfissional(frm: TfrmCadPaciente);
var
   objDadoProf : TDadosProfissionais;
   objControlePaciente : TControlePaciente;
begin
   try
      objDadoProf := TDadosProfissionais.Create;
      objControlePaciente := TControlePaciente.Create;
      if objControlePaciente.InclusaoDadosProfissionais(CarregaObjDadoProfissional(objDadoProf, frm)) > 0 then
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro de Dados Profissionais', tiInformacao, 'Cadastro de Dados Profissionais realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
       end;

//      DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objDadoProf);
   end;

end;

end.

