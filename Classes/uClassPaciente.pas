unit uClassPaciente;
{************************************************************************
 *  Esta é a CLASSE PACIENTE, onde estará definido a classe em si, mais *
 *  seus métodos e atributos                                            *
 ************************************************************************}
{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, dialogs;

type
   { Classe Paciente }

   { TPaciente }

   TPaciente = class
   private
      Fativo: string;
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
      property idPaciente : integer read FidPaciente {write FidPaciente};
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

      function TabelaVazia : boolean;
      procedure ConectaDadosBasicos;

      procedure PreencheDBasicoPaciente (dados: TDataSet);

      //constructor Create;
      //destructor Destroy; override;
   end;

implementation

uses
   uDMCadPaciente, uLocalizarPaciente;

{ TPaciente }

var
  objPaciente : TPaciente;

function TPaciente.TabelaVazia : boolean;
begin
   result := dmCadPaciente.TblPacienteVazia;
end;

procedure TPaciente.ConectaDadosBasicos;
begin
   PreencheDBasicoPaciente(frmLocalizaPaciente.tblDataSetDBasico);
end;

procedure TPaciente.PreencheDBasicoPaciente(dados: TDataSet);
begin
   objPaciente := TPaciente.Create;
//   objPaciente.idPaciente := dados.FieldByName('id_paciente').AsInteger;
   objPaciente.nomePaciente := dados.FieldByName('nome_paciente').AsString;
   objPaciente.nomePai := dados.FieldByName('nome_pai').AsString;
   objPaciente.nomeMae := dados.FieldByName('nome_mae').AsString;
   objPaciente.nomeConjuge := dados.FieldByName('nome_conjuge').AsString;
   objPaciente.estadoCivil := dados.FieldByName('estado_civil').AsString;      { TODO : Continuar daqui, criar classe controle };
   objPaciente.sexo := dados.FieldByName('sexo').AsString;
   objPaciente.dataNascimento := dados.FieldByName('data_nascimento').AsDateTime;
   objPaciente.naturalidade := dados.FieldByName('naturalidade').AsString;
   objPaciente.ufNascimento := dados.FieldByName('uf_nascimento').AsString;
   objPaciente.nacionalidade := dados.FieldByName('nacionalidade').AsString;  ShowMessage(objPaciente.nomePaciente);

   FreeAndNil(objPaciente);
end;

end.

