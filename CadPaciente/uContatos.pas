unit uContatos;

{**********************************************************************
**                      unit uContatos                               **
**                                                                   **
** UNIT DESTINADA A MANIPULAR AS INFORMAÇÕES NO CADASTRO DE PACIENTE **
** REFERENTE AS INFORMAÇÕES DENTRO DA ABA DE CONTATOS                **
**                                                                   **
***********************************************************************}

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uCadPacientes, uClassContatos, uClassControlePaciente, uFrmMensagem;

type

   { Contatos }

   Contatos = class
    public
       class function CarregaObjContatos(objContatos: TContatos; frm: TfrmCadPaciente) : TContatos;
       class procedure InclusaoOuEdicaoContatos(frm: TfrmCadPaciente);
   end;

implementation

{ Contatos }

class function Contatos.CarregaObjContatos(objContatos: TContatos; frm: TfrmCadPaciente): TContatos;
var
   codigo : integer = 0;
begin
   with objContatos do
   begin
      codigo := StrToInt(frm.edtCodContatos.Text);
      idContatos := codigo;
      codigo := StrToInt(Frm.edtCodPaciente.Text);
      idTblPaciente := codigo;
      dddTelCasa := Frm.edtDDDCasa.Text;
      telefoneCasa := Frm.mskedtTelCasa.Text;
      operadoraTelCasa := Frm.cboxOperadoraCasa.Text;
      dddCelular1 := Frm.edtDDDCel1.Text;
      NumeroCelular1 := Frm.mskedtCel1.Text;
      operadoraCelular1 := Frm.cboxOperadoraCel1.Text;
      dddCelular2 := Frm.edtDDDCel2.Text;
      numeroCelular2 := Frm.mskedtCel2.Text;
      operadoraCelular2 := Frm.cboxOperadoraCel2.Text;
      dddTelTrabalho := Frm.edtDDDTelTrab.Text;
      telefoneTrabalho := Frm.mskedtTelTrab.Text;
      operadoraTelTrabalho := Frm.cboxOperadoraTelTrab.Text;
      dddTelRecado := Frm.edtDDDTelRecado.Text;
      telefoneRecado := Frm.mskedtTelRecado.Text;
      operadoraTelRecado := Frm.cboxOperadoraTelRecado.Text;
      nomePessoaTelRecado := Frm.edtPessoaRecado.Text;
      email := Frm.edtEmail.Text;
   end;
   result := objContatos;
end;

class procedure Contatos.InclusaoOuEdicaoContatos(frm: TfrmCadPaciente);
var
   objContatos : TContatos;
   objControlePaciente : TControlePaciente;
   codigo : integer = 0;
begin
   try
      objContatos := TContatos.Create;
      objControlePaciente := TControlePaciente.Create;
      codigo := objControlePaciente.InclusaoOuEdicaoContatos(CarregaObjContatos(objContatos, frm));
      if codigo > 0 then
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro dos Contatos do Paciente', tiInformacao, 'Cadastrado dos Contatos realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
       end;

      //DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objContatos);
   end;
end;

end.

