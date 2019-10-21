unit uClassPaciente;
{************************************************************************
 *  Esta é a CLASSE PACIENTE, onde estará definido a classe em si, mais *
 *  seus métodos e atributos                                            *
 ************************************************************************}
{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;

type
   { Classe Paciente }

   { TPaciente }

   TPaciente = class
   private
      FdataNascimento: TDate;
      FestadoCivil: string;
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

      function TabelaVazia : boolean;

      //constructor Create;
      //destructor Destroy; override;
   end;

implementation

uses
   uDMCadPaciente;

{ TPaciente }

function TPaciente.TabelaVazia : boolean;
begin
//   result := dmCadPaciente.TabelaVazia(dmCadPaciente.qryTblPaciente, 'tbl_paciente');
   result := dmCadPaciente.TblPacienteVazia;
end;

end.

