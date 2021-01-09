unit uAnamnese;

{**********************************************************************
**                      unit uAnamnese                               **
**                                                                   **
** UNIT DESTINADA A MANIPULAR AS INFORMAÇÕES NO CADASTRO DE PACIENTE **
** REFERENTE AS INFORMAÇÕES DENTRO DA ABA DE ANAMNESE                **
**                                                                   **
***********************************************************************}

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uCadPacientes, uClassControlePaciente, uClassAnamnese, uFrmMensagem;

type

   { Anamnese }

   Anamnese = class
    public
       class function CarregaObjAnamnese(objAnamnese: TAnamnese; frm: TfrmCadPaciente): TAnamnese;
       class procedure InclusaoOuEdicaoAnamnese(frm: TfrmCadPaciente);
   end;

implementation

{ Anamnese }

class function Anamnese.CarregaObjAnamnese(objAnamnese: TAnamnese; frm: TfrmCadPaciente): TAnamnese;
begin
  objAnamnese.idTblPaciente := StrToInt(frm.edtCodPaciente.Text);
  objAnamnese.consumoAcucar := frm.cboxConsAcucar.Text;
  objAnamnese.escovacao := frm.cboxEscovacao.Text;
  objAnamnese.usoFioDental := frm.cboxFioDental.Text;
  objAnamnese.obsAnatomoHisto := frm.memoObsAnatHistPatol.Text;
  objAnamnese.habitosViciosos := frm.edtHabitosViciosos.Text;
  objAnamnese.antecedentesFamiliares := frm.edtAntecFamiliar.Text;

  if frm.rbexSimApreesTratDent.Checked then
   begin
     objAnamnese.apreensivoTratDentario := 'S';
     objAnamnese.porqueApreensivo := frm.edtApreensivoTratamento.Text;
   end;
  if frm.rbexNaoApreesTratDent.Checked then
     objAnamnese.apreensivoTratDentario := 'N';


  if frm.rbexSimTratMedico.Checked then
   begin
     objAnamnese.tratamentoMedico := 'S';
     objAnamnese.qualTratMedico := frm.edtTratamentoMedico.Text;
   end;
  if frm.rbexNaoTratMedico.Checked then
     objAnamnese.tratamentoMedico := 'N';

  if frm.rbexSimTomaRemedio.Checked then
   begin
      objAnamnese.tomaMedicamento := 'S';
      objAnamnese.tomaQualMedicamento := frm.edtTomaRemedio.Text;
   end;
  if frm.rbexNaoTomaRemedio.Checked then
     objAnamnese.tomaMedicamento := 'N';

  if frm.rbexSimAlergiaAnestesia.Checked then
   begin
      objAnamnese.alergiaAnestesia := 'S';
      objAnamnese.alergiaQualAnestesia := frm.edtAlergiaAnestesia.Text;
   end;
  if frm.rbexNaoAlergiaAnestesia.Checked then
     objAnamnese.alergiaAnestesia := 'N';

  if frm.rbexSimAlgumaAlergia.Checked then
   begin
      objAnamnese.algumaAlergia := 'S';
      objAnamnese.qualAlergia := frm.edtAlgumaAlergia.Text;
   end;
  if frm.rbexNaoAlgumaAlergia.Checked then
     objAnamnese.algumaAlergia := 'N';

  if frm.rbexSimFoiHospitalizado.Checked then
   begin
      objAnamnese.foiHospitalizado := 'S';
      objAnamnese.porqueHospitalizado := frm.edtFoiHospitalizado.Text;
   end;
  if frm.rbexNaoFoiHospitalizado.Checked then
     objAnamnese.foiHospitalizado := 'N';

  if frm.rgexSexo.ItemIndex = 0 then
   begin
     if frm.rbexSimTaGravida.Checked then
      begin
         objAnamnese.estaGravida := 'S';
         objAnamnese.previsaoParto := frm.edtTaGravida.Text;
      end;
     if frm.rbexNaoTaGravida.Checked then
        objAnamnese.estaGravida := 'N';

     objAnamnese.teveQuantasGravidez := StrToInt(frm.spedtQtdGravidez.Text);
     objAnamnese.quantosFilhos := StrToInt(frm.spedtQtdFilhos.Text);

     if frm.rbexSimMenopausa.Checked then
      begin
        objAnamnese.chegouMenopausa := 'S';
        objAnamnese.quandoChegouMenopausa := frm.edtMenopausa.Text;
      end;
     if frm.rbexNaoMenopausa.Checked then
        objAnamnese.chegouMenopausa := 'N';

   end;
  result := objAnamnese;
end;

class procedure Anamnese.InclusaoOuEdicaoAnamnese(frm: TfrmCadPaciente);
var
   objAnamnese : TAnamnese;
   objControlePaciente : TControlePaciente;
   codIDAnamnese :  integer = 0;
begin
   objAnamnese := TAnamnese.Create;
   objControlePaciente := TControlePaciente.Create;
   try
      codIDAnamnese := objControlePaciente.InclusaoOuEdicaoAnamnese(CarregaObjAnamnese(objAnamnese,frm));
      if codIDAnamnese > 0 then
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro de Anamnese', tiInformacao, 'Cadastro da Anamnese realizado com sucesso!');
          finally
             FreeAndNil(frmMensagem);
          end;
       end;

//      DesabilitaControles(pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objAnamnese);
   end;
end;

end.

