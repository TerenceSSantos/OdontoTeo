unit uClassPaciente;
{************************************************************************
 *  Esta é a CLASSE PACIENTE, onde estará definido a classe em si, mais *
 *  seus métodos e atributos                                            *
 ************************************************************************}
{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, dateutils;

type
   { Classe Paciente }

   { TPaciente }

   TPaciente = class
   private
      Fativo: string;
      FdataNascimento: TDate;
      FestadoCivil: string;
      Fidade: integer;
      FidPaciente: integer;
      Fnacionalidade: string;
      Fnaturalidade: string;
      FnomeConjuge: string;
      FnomeMae: string;
      FnomePaciente: string;
      FnomePai: string;
      Fsexo: string;
      FufNascimento: string;

   public
      property idPaciente : integer read FidPaciente write FidPaciente;
      property nomePaciente : string read FnomePaciente write FnomePaciente;
      property nomePai : string read FnomePai write FnomePai;
      property nomeMae : string read FnomeMae write FnomeMae;
      property estadoCivil : string read FestadoCivil write FestadoCivil;
      property nomeConjuge : string read FnomeConjuge write FnomeConjuge;
      property sexo : string read Fsexo write Fsexo;
      property dataNascimento : TDate read FdataNascimento write FdataNascimento;
      property naturalidade : string read Fnaturalidade write Fnaturalidade;
      property ufNascimento : string read FufNascimento write FufNascimento;
      property nacionalidade : string read Fnacionalidade write Fnacionalidade;
      property ativo : string read Fativo write Fativo;
      property idade: integer read Fidade write Fidade;

      procedure CalculaIdade;
      function MesesIdade: integer;
      function DiasIdade : integer;

      //constructor Create;
      //destructor Destroy; override;
   end;

implementation

{ TPaciente }

procedure TPaciente.CalculaIdade;
begin
   if dataNascimento  = StrToDate('30/12/1899') then
      Fidade := 0
   else
      Fidade := trunc((now - dataNascimento) / 365.25);
end;

function TPaciente.MesesIdade: integer;
var
   meses : integer = 0;
   confData : boolean = true;
   dataAniversario : TDate;
begin
   dataAniversario := IncYear(dataNascimento, idade);
   while confData do
   begin
      if now < dataAniversario then
      begin
        confData := false;
        meses := meses -1;
      end
      else
      begin
         dataAniversario := IncMonth(dataAniversario, 1);
         Inc(meses);
      end;
   end;
   result := meses;
end;

function TPaciente.DiasIdade: integer;
begin
    //
end;

end.

