unit uEnfermidades;

{**********************************************************************
**                      unit uEnfermidades                           **
**                                                                   **
** UNIT DESTINADA A MANIPULAR AS INFORMAÇÕES NO CADASTRO DE PACIENTE **
** REFERENTE AS INFORMAÇÕES DENTRO DA ABA DE ENFERMIDADES            **
**                                                                   **
***********************************************************************}

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uCadPacientes, uClassControlePaciente, uClassEnfermidades, uFrmMensagem;

type

   { Enfermidades }

   Enfermidades = class
    public
       class function CarregaObjEnfermidades(objEnfermidades: TEnfermidades; frm: TfrmCadPaciente): TEnfermidades;
       class procedure InclusaoOuEdicaoEnfermidades(frm: TfrmCadPaciente);
   end;

implementation

{ Enfermidades }

class function Enfermidades.CarregaObjEnfermidades(objEnfermidades: TEnfermidades; frm: TfrmCadPaciente): TEnfermidades;
begin
  with objEnfermidades do
  begin
     idEnfermidade := StrToInt(frm.edtCodEnfermidades.Text);
     idTblPaciente := StrToInt(frm.edtCodPaciente.Text);
     aids := frm.RetornoRadioGroup(frm.rgexAIDS.ItemIndex);
     anemia := frm.RetornoRadioGroup(frm.rgexAnemia.ItemIndex);
     asma := frm.RetornoRadioGroup(frm.rgexAsma.ItemIndex);
     diabete := frm.RetornoRadioGroup(frm.rgexDiabetes.ItemIndex);
     disritmiaEpilepsia := frm.RetornoRadioGroup(frm.rgexDisritmiaEpilepsia.ItemIndex);
     doencaCoracao := frm.RetornoRadioGroup(frm.rgexDoencaCoracao.ItemIndex);
     doencaRenal := frm.RetornoRadioGroup(frm.rgexDoencaRenal.ItemIndex);
     febreReumatica := frm.RetornoRadioGroup(frm.rgexFebreReumatica.ItemIndex);
     glaucoma := frm.RetornoRadioGroup(frm.rgexGlaucoma.ItemIndex);
     gonorreia := frm.RetornoRadioGroup(frm.rgexGonorreia.ItemIndex);
     hanseniase := frm.RetornoRadioGroup(frm.rgexHanseniase.ItemIndex);
     hemofilia := frm.RetornoRadioGroup(frm.rgexHemofilia.ItemIndex);
     hepatite := frm.RetornoRadioGroup(frm.rgexHepatite.ItemIndex);
     ictericia := frm.RetornoRadioGroup(frm.rgexIctericia.ItemIndex);
     problemaHormonal := frm.RetornoRadioGroup(frm.rgexProblemaHormonal.ItemIndex);
     sifilis := frm.RetornoRadioGroup(frm.rgexSifilis.ItemIndex);
     sinusite := frm.RetornoRadioGroup(frm.rgexSinusite.ItemIndex);
     tuberculose := frm.RetornoRadioGroup(frm.rgexTuberculose.ItemIndex);
     tumorBoca := frm.RetornoRadioGroup(frm.rgexTumorBoca.ItemIndex);
     ulceraHepatica := frm.RetornoRadioGroup(frm.rgexUlceraHepatica.ItemIndex);
  end;
  result := objEnfermidades;
end;

class procedure Enfermidades.InclusaoOuEdicaoEnfermidades(frm: TfrmCadPaciente);
var
   objEnfermidades : TEnfermidades;
   objControlePaciente : TControlePaciente;
   codEnfermidade : integer = 0;
begin
   try
      objEnfermidades := TEnfermidades.Create;
      objControlePaciente := TControlePaciente.Create;
      codEnfermidade := objControlePaciente.InclusaoOuEdicaoEnfermidades(CarregaObjEnfermidades(objEnfermidades, frm));
      if codEnfermidade > 0 then
       begin
           try
              frmMensagem := TfrmMensagem.Create(nil);
              frmMensagem.InfoFormMensagem('Cadastro de Enfermidades', tiInformacao, 'Cadastro das Enfermidades realizado com sucesso!');
           finally
              FreeAndNil(frmMensagem);
           end;
       end;

//      DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objEnfermidades);
   end;

end;

end.

