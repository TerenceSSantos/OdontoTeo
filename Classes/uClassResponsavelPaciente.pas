unit uClassResponsavelPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;

type

   { TResponsavelPaciente }

   TResponsavelPaciente = class
   private
      FidPaciente: integer;
      FidResponsavel: integer;
      FnomeResponsavel: string;
      Fparentesco: string;

   public
      property idResponsavel : integer read FidResponsavel write FidResponsavel;
      property nomeResponsavel : string read FnomeResponsavel write FnomeResponsavel;
      property parentesco : string read Fparentesco write Fparentesco;
      property idPaciente : integer read FidPaciente write FidPaciente;

      //constructor Create;
      //destructor Destroy; override;
   end;

implementation

{ TResponsavelPaciente }


end.

