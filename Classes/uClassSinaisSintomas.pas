unit uClassSinaisSintomas;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;

type

   { TSinaisSintomas }

   TSinaisSintomas = class
   private
      FAlteracaoApetite: string;
      FcalorExagerado: string;
      FcansaFacil: string;
      FcoceiraAnormal: string;
      FdificuldadeEngolir: string;
      FdificuldadeMastigar: string;
      FdorFacial: string;
      FdorFrequenteCabeca: string;
      FdorOuvidoFrequente: string;
      FemagrecimentoAcentuado: string;
      FfebreFrequente: string;
      FidSinaisSintomas: integer;
      FidTblPaciente: integer;
      FindigestaoFrequente: string;
      FmaCicatrizacao: string;
      FmiccaoFrequente: string;
      FpoucaSaliva: string;
      FrangeDentes: string;
      FrespiraPelaBoca: string;
      FsangramentoAnormal: string;
      FestaloMandibula: string;
      FtonturaDesmaio: string;

   public
      property idSinaisSintomas: integer read FidSinaisSintomas write FidSinaisSintomas;
      property alteracaoApetite: string read FAlteracaoApetite write FAlteracaoApetite;
      property calorExagerado: string read FcalorExagerado write FcalorExagerado;
      property cansaFacil: string read FcansaFacil write FcansaFacil;
      property coceiraAnormal: string read FcoceiraAnormal write FcoceiraAnormal;
      property dificuldadeEngolir: string read FdificuldadeEngolir write FdificuldadeEngolir;
      property dificuldadeMastigar: string read FdificuldadeMastigar write FdificuldadeMastigar;
      property dorFacial: string read FdorFacial write FdorFacial;
      property dorFrequenteCabeca: string read FdorFrequenteCabeca write FdorFrequenteCabeca;
      property dorOuvidoFrequente: string read FdorOuvidoFrequente write FdorOuvidoFrequente;
      property emagrecimentoAcentuado: string read FemagrecimentoAcentuado write FemagrecimentoAcentuado;
      property estaloMandibula: string read FestaloMandibula write FestaloMandibula;
      property febreFrequente: string read FfebreFrequente write FfebreFrequente;
      property indigestaoFrequente: string read FindigestaoFrequente write FindigestaoFrequente;
      property maCicatrizacao: string read FmaCicatrizacao write FmaCicatrizacao;
      property miccaoFrequente: string read FmiccaoFrequente write FmiccaoFrequente;
      property rangeDentes: string read FrangeDentes write FrangeDentes;
      property respiraPelaBoca: string read FrespiraPelaBoca write FrespiraPelaBoca;
      property sangramentoAnormal: string read FsangramentoAnormal write FsangramentoAnormal;
      property tonturaDesmaio: string read FtonturaDesmaio write FtonturaDesmaio;
      property poucaSaliva: string read FpoucaSaliva write FpoucaSaliva;
      property idTblPaciente: integer read FidTblPaciente write FidTblPaciente;

      //constructor Create;
      //destructor Destroy; override;
   end;

implementation

{ TSinaisSintomas }

end.

