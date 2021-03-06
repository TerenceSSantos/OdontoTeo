unit uSinaisSintomas;

{**********************************************************************
**                      unit uSinaisSintomas                         **
**                                                                   **
** UNIT DESTINADA A MANIPULAR AS INFORMAÇÕES NO CADASTRO DE PACIENTE **
** REFERENTE AS INFORMAÇÕES DENTRO DA ABA DE SINAIS E SINTOMAS       **
**                                                                   **
***********************************************************************}

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uCadPacientes, uClassControlePaciente, uClassSinaisSintomas, uFrmMensagem;

type

   { SinaisSintomas }

   SinaisSintomas = class
    public
       class function CarregaObjSinaisSintomas(objSinaisSintomas: TSinaisSintomas; frm: TfrmCadPaciente): TSinaisSintomas;
       class procedure InclusaoOuEdicaoSinaisSintomas(frm: TfrmCadPaciente);
   end;

implementation

{ SinaisSintomas }

class function SinaisSintomas.CarregaObjSinaisSintomas(objSinaisSintomas: TSinaisSintomas; frm: TfrmCadPaciente): TSinaisSintomas;
begin
  with objSinaisSintomas do
  begin
     idSinaisSintomas := StrToInt(frm.edtCodSinaisSintomas.Text);
     idTblPaciente := StrToInt(frm.edtCodPaciente.Text);
     alteracaoApetite := frm.RetornoRadioGroup(frm.rgexAlteracaoApetite.ItemIndex);
     calorExagerado := frm.RetornoRadioGroup(frm.rgexCalorExagerado.ItemIndex);
     cansaFacil := frm.RetornoRadioGroup(frm.rgexCansaFacil.ItemIndex);
     coceiraAnormal := frm.RetornoRadioGroup(frm.rgexCoceiraAnormal.ItemIndex);
     dificuldadeEngolir := frm.RetornoRadioGroup(frm.rgexDificuldadeEngolir.ItemIndex);
     dificuldadeMastigar := frm.RetornoRadioGroup(frm.rgexDificuldadeMastigar.ItemIndex);
     dorFacial := frm.RetornoRadioGroup(frm.rgexDorFacial.ItemIndex);
     dorFrequenteCabeca := frm.RetornoRadioGroup(frm.rgexDorCabecaFrequente.ItemIndex);
     dorOuvidoFrequente := frm.RetornoRadioGroup(frm.rgexDorOuvidoFrequente.ItemIndex);
     emagrecimentoAcentuado := frm.RetornoRadioGroup(frm.rgexEmagrecimentoAcentuado.ItemIndex);
     estaloMandibula := frm.RetornoRadioGroup(frm.rgexEstaloMandibula.ItemIndex);
     febreFrequente := frm.RetornoRadioGroup(frm.rgexFebreFrequente.ItemIndex);
     indigestaoFrequente := frm.RetornoRadioGroup(frm.rgexIndigestaoFrequente.ItemIndex);
     maCicatrizacao := frm.RetornoRadioGroup(frm.rgexMaCicatrizacao.ItemIndex);
     miccaoFrequente := frm.RetornoRadioGroup(frm.rgexMiccaoFrequente.ItemIndex);
     rangeDentes := frm.RetornoRadioGroup(frm.rgexRangeDentes.ItemIndex);
     respiraPelaBoca := frm.RetornoRadioGroup(frm.rgexRespiraPelaBoca.ItemIndex);
     sangramentoAnormal := frm.RetornoRadioGroup(frm.rgexSangramentoAnormal.ItemIndex);
     tonturaDesmaio := frm.RetornoRadioGroup(frm.rgexTonturasDesmaios.ItemIndex);
     poucaSaliva := frm.RetornoRadioGroup(frm.rgexPoucaSaliva.ItemIndex);
  end;
  result := objSinaisSintomas;
end;

class procedure SinaisSintomas.InclusaoOuEdicaoSinaisSintomas(frm: TfrmCadPaciente);
var
   objSinaisSintomas : TSinaisSintomas;
   objControlePaciente : TControlePaciente;
   codSinaisSintomas : integer = 0;
begin
   try
      objSinaisSintomas := TSinaisSintomas.Create;
      objControlePaciente := TControlePaciente.Create;
      codSinaisSintomas := objControlePaciente.InclusaoOuEdicaoSinaisSintomas(CarregaObjSinaisSintomas(objSinaisSintomas, frm));
      if codSinaisSintomas > 0 then
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro de Sinais & Sintomas', tiInformacao, 'Cadastro dos Sinais & Sintomas realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
       end;

      //DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objSinaisSintomas);
   end;
end;


end.

