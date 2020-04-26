unit uClassSinaisSintomas;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;

type

   { TSinaisSintomas }

   TSinaisSintomas = class
   private
      FAlteracaoApetite: boolean;
      FcalorExagerado: boolean;
      FcansaFacil: boolean;
      FcoceiraAnormal: boolean;
      FdificuldadeEngolir: boolean;
      FdificuldadeMastigar: boolean;
      FdorFacial: boolean;
      FdorFrequenteCabeca: boolean;
      FdorOuvidoFrequente: boolean;
      FemagrecimentoAcentuado: boolean;
      FfebreFrequente: boolean;
      FidSinaisSintomas: integer;
      FidTblPaciente: integer;
      FindigestaoFrequente: boolean;
      FmaCicatrizacao: boolean;
      FmiccaoFrequente: boolean;
      FpoucaSaliva: boolean;
      FrangeDentes: boolean;
      FrespiraPelaBoca: boolean;
      FsangramentoAnormal: boolean;
      FestaloMandibula: boolean;
      FtonturaDesmaio: boolean;

   public
      property idSinaisSintomas: integer read FidSinaisSintomas write FidSinaisSintomas;
      property alteracaoApetite: boolean read FAlteracaoApetite write FAlteracaoApetite;
      property calorExagerado: boolean read FcalorExagerado write FcalorExagerado;
      property cansaFacil: boolean read FcansaFacil write FcansaFacil;
      property coceiraAnormal: boolean read FcoceiraAnormal write FcoceiraAnormal;
      property dificuldadeEngolir: boolean read FdificuldadeEngolir write FdificuldadeEngolir;
      property dificuldadeMastigar: boolean read FdificuldadeMastigar write FdificuldadeMastigar;
      property dorFacial: boolean read FdorFacial write FdorFacial;
      property dorFrequenteCabeca: boolean read FdorFrequenteCabeca write FdorFrequenteCabeca;
      property dorOuvidoFrequente: boolean read FdorOuvidoFrequente write FdorOuvidoFrequente;
      property emagrecimentoAcentuado: boolean read FemagrecimentoAcentuado write FemagrecimentoAcentuado;
      property estaloMandibula: boolean read FestaloMandibula write FestaloMandibula;
      property febreFrequente: boolean read FfebreFrequente write FfebreFrequente;
      property indigestaoFrequente: boolean read FindigestaoFrequente write FindigestaoFrequente;
      property maCicatrizacao: boolean read FmaCicatrizacao write FmaCicatrizacao;
      property miccaoFrequente: boolean read FmiccaoFrequente write FmiccaoFrequente;
      property rangeDentes: boolean read FrangeDentes write FrangeDentes;
      property respiraPelaBoca: boolean read FrespiraPelaBoca write FrespiraPelaBoca;
      property sangramentoAnormal: boolean read FsangramentoAnormal write FsangramentoAnormal;
      property tonturaDesmaio: boolean read FtonturaDesmaio write FtonturaDesmaio;
      property poucaSaliva: boolean read FpoucaSaliva write FpoucaSaliva;
      property idTblPaciente: integer read FidTblPaciente write FidTblPaciente;

      //constructor Create;
      //destructor Destroy; override;
   end;

implementation

{ TSinaisSintomas }

end.

