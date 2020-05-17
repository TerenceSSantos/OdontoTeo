unit uClassEnfermidades;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;

type

  TEnfermidades = class
  private
     Faids: string;
     Fanemia: string;
     Fasma: string;
     Fdiabete: string;
     FdisritmiaEpilepsia: string;
     FdoencaCoracao: string;
     FdoencaRenal: string;
     FfebreReumatica: string;
     Fglaucoma: string;
     Fgonorreia: string;
     Fhanseniase: string;
     Fhemofilia: string;
     Fhepatite: string;
     Fictericia: string;
     FidEnfermidade: integer;
     FidTblPaciente: integer;
     FproblemaHormonal: string;
     Fsifilis: string;
     Fsinusite: string;
     Ftuberculose: string;
     FtumorBoca: string;
     FulceraHepatica: string;

  protected

  public
     property idEnfermidade: integer read FidEnfermidade write FidEnfermidade;
     property aids: string read Faids write Faids;
     property anemia: string read Fanemia write Fanemia;
     property asma: string read Fasma write Fasma;
     property diabete: string read Fdiabete write Fdiabete;
     property doencaCoracao: string read FdoencaCoracao write FdoencaCoracao;
     property tumorBoca: string read FtumorBoca write FtumorBoca;
     property doencaRenal: string read FdoencaRenal write FdoencaRenal;
     property disritmiaEpilepsia: string read FdisritmiaEpilepsia write FdisritmiaEpilepsia;
     property febreReumatica: string read FfebreReumatica write FfebreReumatica;
     property glaucoma: string read Fglaucoma write Fglaucoma;
     property gonorreia: string read Fgonorreia write Fgonorreia;
     property hanseniase: string read Fhanseniase write Fhanseniase;
     property hemofilia: string read Fhemofilia write Fhemofilia;
     property hepatite: string read Fhepatite write Fhepatite;
     property ictericia: string read Fictericia write Fictericia;
     property problemaHormonal: string read FproblemaHormonal write FproblemaHormonal;
     property sifilis: string read Fsifilis write Fsifilis;
     property sinusite: string read Fsinusite write Fsinusite;
     property tuberculose: string read Ftuberculose write Ftuberculose;
     property ulceraHepatica: string read FulceraHepatica write FulceraHepatica;
     property idTblPaciente: integer read FidTblPaciente write FidTblPaciente;

     //constructor Create; override;
     //destructor Destroy; override;
  published
  end;

implementation

{ TEnfermidades }

end.

