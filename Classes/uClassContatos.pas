unit uClassContatos;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;

type

   { TContatos }

   TContatos = class
   private
      FdddCelular1: string;
      FdddCelular2: string;
      FdddTelCasa: string;
      FdddTelRecado: string;
      FdddTelTrabalho: string;
      Femail: string;
      FidContatos: integer;
      FidTblPaciente: integer;
      FnomePessoaTelRecado: string;
      FNumeroCelular1: string;
      FnumeroCelular2: string;
      FoperadoraCelular1: string;
      FoperadoraCelular2: string;
      FoperadoraTelCasa: string;
      FoperadoraTelRecado: string;
      FoperadoraTelTrabalho: string;
      FtelefoneCasa: string;
      FtelefoneRecado: string;
      FtelefoneTrabalho: string;

   public
      property idContatos: integer read FidContatos write FidContatos;
      property dddTelCasa: string read FdddTelCasa write FdddTelCasa;
      property telefoneCasa: string read FtelefoneCasa write FtelefoneCasa;
      property operadoraTelCasa: string read FoperadoraTelCasa write FoperadoraTelCasa;
      property dddCelular1: string read FdddCelular1 write FdddCelular1;
      property NumeroCelular1: string read FNumeroCelular1 write FNumeroCelular1;
      property operadoraCelular1: string read FoperadoraCelular1 write FoperadoraCelular1;
      property dddCelular2: string read FdddCelular2 write FdddCelular2;
      property numeroCelular2: string read FnumeroCelular2 write FnumeroCelular2;
      property operadoraCelular2: string read FoperadoraCelular2 write FoperadoraCelular2;
      property dddTelTrabalho: string read FdddTelTrabalho write FdddTelTrabalho;
      property telefoneTrabalho: string read FtelefoneTrabalho write FtelefoneTrabalho;
      property operadoraTelTrabalho: string read FoperadoraTelTrabalho write FoperadoraTelTrabalho;
      property dddTelRecado: string read FdddTelRecado write FdddTelRecado;
      property telefoneRecado: string read FtelefoneRecado write FtelefoneRecado;
      property operadoraTelRecado: string read FoperadoraTelRecado write FoperadoraTelRecado;
      property nomePessoaTelRecado: string read FnomePessoaTelRecado write FnomePessoaTelRecado;
      property email: string read Femail write Femail;
      property idTblPaciente: integer read FidTblPaciente write FidTblPaciente;

      //constructor Create;
      //destructor Destroy; override;
   end;

implementation

{ TContatos }

end.

