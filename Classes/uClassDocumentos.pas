unit uClassDocumentos;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;

type

   { TDocumentos }

   TDocumentos = class
   private
      Fcpf: string;
      FIdentidade: string;
      FIdIdentidade: integer;
      FIdTblDentista: integer;
      FIdTblPaciente: integer;
      FIdTblResponsavel: integer;
      FOrgaoExpedidor: string;

   public
      property idIdentidade: integer read FIdIdentidade write FIdIdentidade;
      property identidade: string read FIdentidade write FIdentidade;
      property orgaoExpedidor: string read FOrgaoExpedidor write FOrgaoExpedidor;
      property cpf: string read Fcpf write Fcpf;
      property idTblPaciente: integer read FIdTblPaciente write FIdTblPaciente;
      property idTblResponsavel: integer read FIdTblResponsavel write FIdTblResponsavel;
      property idTblDentista: integer read FIdTblDentista write FIdTblDentista;

   //   constructor Create;
   //   destructor Destroy; override;
   end;

implementation

{ TDocumentos }

end.

