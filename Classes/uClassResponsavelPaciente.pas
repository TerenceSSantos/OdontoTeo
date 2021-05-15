unit uClassResponsavelPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;

type

   { TResponsavelPaciente }

   TResponsavelPaciente = class
   private
      FidTblPaciente: integer;
      FidResponsavel: integer;
      FnomeResponsavel: string;        { TODO : Criar o campo tipo documento no Responsável }
      Fparentesco: string;
      FcpfResponsavel: string;
      FidentidadeResponsavel: string;
      ForgaoExpedidor: string;
   public
      property idResponsavel : integer read FidResponsavel write FidResponsavel;
      property nomeResponsavel : string read FnomeResponsavel write FnomeResponsavel;
      property parentesco : string read Fparentesco write Fparentesco;
      property cpfResponsavel : string read FcpfResponsavel write FcpfResponsavel;
      property identidadeResponsavel : string read FidentidadeResponsavel write FidentidadeResponsavel;
      property orgaoExpedidor : string read ForgaoExpedidor write ForgaoExpedidor;
      property idTblPaciente : integer read FidTblPaciente write FidTblPaciente;

      //constructor Create;
      //destructor Destroy; override;
   end;

implementation

{ TResponsavelPaciente }


end.

