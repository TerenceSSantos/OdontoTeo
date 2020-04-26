unit uClassDocumentos;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;

type

   { TDocumento }

   TDocumento = class
   private
      FCPF: string;
      FidDocumento: integer;
      Fidentidade: string;
      FidPaciente: integer;
      FidResponsavel: integer;
      ForgaoEmissor: string;

   public
      property idDocumento: integer read FidDocumento write FidDocumento;
      property CPF: string read FCPF write FCPF;
      property identidade: string read Fidentidade write Fidentidade;
      property orgaoEmissor: string read ForgaoEmissor write ForgaoEmissor;
      property idPaciente: integer read FidPaciente write FidPaciente;
      property idResponsavel: integer read FidResponsavel write FidResponsavel;

      //constructor Create;
      //destructor Destroy; override;
   end;

implementation

{ TDocumento }

end.

