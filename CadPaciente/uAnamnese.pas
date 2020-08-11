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
       class procedure InclusaoAnamnese(frm: TfrmCadPaciente);
       class procedure EdicaoAnamnese(frm: TfrmCadPaciente);
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

class procedure Anamnese.InclusaoAnamnese(frm: TfrmCadPaciente);
var
   objAnamnese : TAnamnese;
   objControlePaciente : TControlePaciente;
begin
   objAnamnese := TAnamnese.Create;
   objControlePaciente := TControlePaciente.Create;
   try
      if objControlePaciente.InclusaoAnamnese(CarregaObjAnamnese(objAnamnese,frm))then
       begin
          try
             frmMensagem := TfrmMensagem.Create(nil);
             frmMensagem.InfoFormMensagem('Cadastro da Anamnese', tiInformacao, 'Cadastro da Anamnese realizado com sucesso!');
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

class procedure Anamnese.EdicaoAnamnese(frm: TfrmCadPaciente);
var
   objAnamnese : TAnamnese;
   objControlePaciente : TControlePaciente;
begin
   try
      objAnamnese := TAnamnese.Create;
      objControlePaciente := TControlePaciente.Create;
      objAnamnese := CarregaObjAnamnese(objAnamnese, frm);
      if objControlePaciente.EdicaoAnamnese(objAnamnese) then
       begin
         try
            frmMensagem := TfrmMensagem.Create(nil);
            frmMensagem.InfoFormMensagem('Alteração no cadastro de Anamnese', tiInformacao, 'Cadastro da Anamnese alterado com sucesso!');
         finally
            FreeAndNil(frmMensagem);
         end;
       end;

      //DesabilitaControles(frmCadPaciente.pcCadPaciente.ActivePage);
      estado := teNavegacao;
      //EstadoBotoes;
   finally
      FreeAndNil(objControlePaciente);
      FreeAndNil(objAnamnese);
   end;
end;

end.

