unit uClassPaciente;
{************************************************************************
 *  Esta é a CLASSE PACIENTE, onde estará definido a classe em si, mais *
 *  seus métodos e atributos                                            *
 ************************************************************************}
{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, dateutils, uClassDocumentos;

type
   { Classe Paciente }

   { TPaciente }

   TPaciente = class
   private
      Fativo: string;
//      FCPF: string;
      FdataNascimento: TDate;
      Fdocumento: TDocumentos;
      FestadoCivil: string;
      Fidade: integer;
//      FidentidadePaciente: string;
      FidPaciente: integer;
      FidResponsavel: integer;
      Fnacionalidade: string;
      Fnaturalidade: string;
      FnomeConjuge: string;
      FnomeMae: string;
      FnomePaciente: string;
      FnomePai: string;
//      ForgaoExpedidorID: string;
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
//      property CPF : string read FCPF write FCPF;
//      property identidadePaciente : string read FidentidadePaciente write FidentidadePaciente;
//      property orgaoExpedidorID : string read ForgaoExpedidorID write ForgaoExpedidorID;
      property ativo : string read Fativo write Fativo;
      property idade: integer read Fidade write Fidade;
//      property idResponsavel: integer read FidResponsavel write FidResponsavel;
      property documento: TDocumentos read Fdocumento write Fdocumento;

      procedure CalculaIdade;
      function IdadeEmMeses: integer;
      function IdadeEmDias : integer;
      function RetornoIdadeCompleta : string;

      constructor Create;
      destructor Destroy; override;
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

function TPaciente.IdadeEmMeses: integer;
var
   meses : integer = 0;
   confData : boolean = true;
   dataAniversario : TDate;
begin
   dataAniversario := IncYear(dataNascimento, idade);
   while confData do
   begin
      if now < dataAniversario then  // CASO A DATA DE ANIVERSÁRIO TENHA SIDO ULTRAPASSADA, SAI DO LOOP E TIRA 1 MÊS DO CONTADOR.
      begin
        confData := false;
        meses := meses -1;
      end
      else
      begin
         dataAniversario := IncMonth(dataAniversario, 1);  // VAI ACRESCENTANDO 1 MÊS NO DIA DO ANIVERSÁRIO ATUAL
         Inc(meses);
      end;
   end;
   result := meses;
end;

function TPaciente.IdadeEmDias: integer;
var
   dias, meses : integer;
   dataAniversario, dataAtual : TDate;
   confData : boolean = true;
begin
    dataAniversario := IncYear(dataNascimento, idade);
    dataAtual := now;
    while confData do
    begin
       if now < dataAniversario then  // CASO A DATA DE ANIVERSÁRIO_ATUAL TENHA SIDO ULTRAPASSADA, SAI DO LOOP E TIRA 1 MÊS DO CONTADOR.
      begin
        confData := false;
        dias := DaysBetween(IncMonth(dataAniversario, -1), now);
      end
      else
      begin
         dataAniversario := IncMonth(dataAniversario, 1);  // VAI ACRESCENTANDO 1 MÊS NO DIA DO ANIVERSÁRIO ATUAL
         Inc(meses);
      end;
    end;
    result := dias;
end;

function TPaciente.RetornoIdadeCompleta: string;
var
   idadeCompleta: string;
begin
   CalculaIdade;

      if idade > 0 then            // IDADE EM ANOS
         if idade = 1 then
            idadeCompleta := 'Idade: 1 ano'
         else
            idadeCompleta := 'Idade: ' + IntToStr(idade) + ' anos '
      else
         idadeCompleta := 'Idade: ';

      if IdadeEmMeses > 0 then       // IDADE EM MESES
         if IdadeEmMeses = 1 then
            idadeCompleta := idadeCompleta + IntToStr(IdadeEmMeses) + ' mês '
         else
            idadeCompleta := idadeCompleta + IntToStr(IdadeEmMeses) + ' meses ';

      if IdadeEmDias > 0 then        // IDADE EM DIAS
         if IdadeEmDias = 1 then
            idadeCompleta := idadeCompleta + IntToStr(IdadeEmDias) + ' dia'
         else
            idadeCompleta := idadeCompleta + IntToStr(IdadeEmDias) + ' dias';

      result := idadeCompleta;
end;

constructor TPaciente.Create;
begin
   documento := TDocumentos.Create;
end;

destructor TPaciente.Destroy;
begin
   inherited Destroy;
   documento.Free;
   documento := nil;
end;

end.

