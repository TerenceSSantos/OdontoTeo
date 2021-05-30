unit uClassResponsavelPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uClassDocumentos;

type

   { TResponsavelPaciente }

   TResponsavelPaciente = class
   private
      Fdocumento: TDocumentos;
      FidTblPaciente: integer;
      FidResponsavel: integer;
      FnomeResponsavel: string;
      Fparentesco: string;
      //FcpfResponsavel: string;
      //FidentidadeResponsavel: string;
      //ForgaoExpedidor: string;
   public
      property idResponsavel : integer read FidResponsavel write FidResponsavel;
      property nomeResponsavel : string read FnomeResponsavel write FnomeResponsavel;
      property parentesco : string read Fparentesco write Fparentesco;
      //property cpfResponsavel : string read FcpfResponsavel write FcpfResponsavel;
      //property identidadeResponsavel : string read FidentidadeResponsavel write FidentidadeResponsavel;
      //property orgaoExpedidor : string read ForgaoExpedidor write ForgaoExpedidor;
      property idTblPaciente : integer read FidTblPaciente write FidTblPaciente;
      property documento : TDocumentos read Fdocumento write Fdocumento;

      constructor Create;
      destructor Destroy; override;
   end;

implementation

{ TResponsavelPaciente }


constructor TResponsavelPaciente.Create;
begin
   documento := TDocumentos.Create;
end;

destructor TResponsavelPaciente.Destroy;
begin
   documento.Free;
   documento := nil;
   inherited Destroy;
end;

end.

