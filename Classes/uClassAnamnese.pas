unit uClassAnamnese;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;

type

   { TAnamnese }

   TAnamnese = class
   private
      FalergiaAnestesia: string;
      FalergiaQualAnestesia: string;
      FalgumaAlergia: string;
      FantecedentesFamiliares: string;
      FapreensivoTratDentario: string;
      FchegouMenopausa: string;
      FconsumoAcucar: string;
      Fescovacao: string;
      FestaGravida: string;
      FfoiHospitalizado: string;
      FhabitosViciosos: string;
      FidAnamnese: integer;
      FidTblPaciente: integer;
      FobsAnatomoHisto: string;
      FporqueApreensivo: string;
      FporqueHospitalizado: string;
      FprevisaoParto: string;
      FqualAlergia: string;
      FqualTratMedico: string;
      FquandoChegouMenopausa: string;
      FquantosFilhos: byte;
      FteveQuantasGravidez: byte;
      FtomaMedicamento: string;
      FtomaQualMedicamento: string;
      FtratamentoMedico: string;
      FusoFioDental: string;
    public
       property idAnamnese: integer read FidAnamnese write FidAnamnese;
       property consumoAcucar: string read FconsumoAcucar write FconsumoAcucar;
       property escovacao: string read Fescovacao write Fescovacao;
       property usoFioDental: string read FusoFioDental write FusoFioDental;
       property obsAnatomoHisto: string read FobsAnatomoHisto write FobsAnatomoHisto;
       property habitosViciosos: string read FhabitosViciosos write FhabitosViciosos;
       property antecedentesFamiliares: string read FantecedentesFamiliares write FantecedentesFamiliares;
       property apreensivoTratDentario: string read FapreensivoTratDentario write FapreensivoTratDentario;
       property porqueApreensivo: string read FporqueApreensivo write FporqueApreensivo;
       property tratamentoMedico: string read FtratamentoMedico write FtratamentoMedico;
       property qualTratMedico: string read FqualTratMedico write FqualTratMedico;
       property tomaMedicamento: string read FtomaMedicamento write FtomaMedicamento;
       property tomaQualMedicamento: string read FtomaQualMedicamento write FtomaQualMedicamento;
       property alergiaAnestesia: string read FalergiaAnestesia write FalergiaAnestesia;
       property alergiaQualAnestesia: string read FalergiaQualAnestesia write FalergiaQualAnestesia;
       property algumaAlergia: string read FalgumaAlergia write FalgumaAlergia;
       property qualAlergia: string read FqualAlergia write FqualAlergia;
       property foiHospitalizado: string read FfoiHospitalizado write FfoiHospitalizado;
       property porqueHospitalizado: string read FporqueHospitalizado write FporqueHospitalizado;
       property estaGravida: string read FestaGravida write FestaGravida;
       property previsaoParto: string read FprevisaoParto write FprevisaoParto;
       property teveQuantasGravidez: byte read FteveQuantasGravidez write FteveQuantasGravidez;
       property quantosFilhos: byte read FquantosFilhos write FquantosFilhos;
       property chegouMenopausa: string read FchegouMenopausa write FchegouMenopausa;
       property quandoChegouMenopausa: string read FquandoChegouMenopausa write FquandoChegouMenopausa;
       property idTblPaciente: integer read FidTblPaciente write FidTblPaciente;
   end;

implementation

{ TAnamnese }

end.

