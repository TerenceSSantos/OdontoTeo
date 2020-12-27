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
      FnomeResponsavel: string;
      Fparentesco: string;
      FcpfResponsavel: string;
      FidentidadeResponsavel: string;
      ForgaoExpedidorID: string;
   public
      property idResponsavel : integer read FidResponsavel write FidResponsavel;
      property nomeResponsavel : string read FnomeResponsavel write FnomeResponsavel;
      property parentesco : string read Fparentesco write Fparentesco;
      property cpfResponsavel : string read FcpfResponsavel write FcpfResponsavel;
      property identidadeResponsavel : string read FidentidadeResponsavel write FidentidadeResponsavel;
      property orgaoExpedidorID : string read ForgaoExpedidorID write ForgaoExpedidorID;
      property idTblPaciente : integer read FidTblPaciente write FidTblPaciente;

      //constructor Create;
      //destructor Destroy; override;
   end;

implementation

{ TResponsavelPaciente }


end.

