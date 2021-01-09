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
       class procedure InclusaoOuEdicaoDadoProf(frm: TfrmCadPaciente);
   end;

implementation

{ DadosProfissionais }

class function DadosProfissionais.CarregaObjDadoProfissional(objDadoProf: TDadosProfissionais; frm: TfrmCadPaciente): TDadosProfissionais;
var
   codigo : integer = 0;
begin
  with objDadoProf do
  begin
     codigo := StrToInt(frm.edtCodDadosProf.Text);
     idDadoProfissional := codigo;
     nomeEmpresa := frm.edtNomeEmpresa.Text;
     cargo := frm.edtCargo.Text;
     idTblPaciente := StrToInt(frm.edtCodPaciente.Text);
     codigo := StrToInt(frm.edtCodEndDadosProf.Text);
     idTblEndereco := codigo;
  end;
  result := objDadoProf;
end;

class procedure DadosProfissionais.InclusaoOuEdicaoDadoProf(frm: TfrmCadPaciente);
var
   objDadoProf : TDadosProfissionais;
   objControlePaciente : TControlePaciente;
   codigo : integer = 0;
begin
   try
      objDadoProf := TDadosProfissionais.Create;
      objControlePaciente := TControlePaciente.Create;
      codigo := objControlePaciente.InclusaoOuEdicaoDadosProf(CarregaObjDadoProfissional(objDadoProf, frm));
      if codigo > 0 then
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro de Dados Profissionais', tiInformacao, 'Cadastro de Dados Profissionais realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
          frm.edtCodEndDadosProf.Text := IntToStr(codigo);
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

