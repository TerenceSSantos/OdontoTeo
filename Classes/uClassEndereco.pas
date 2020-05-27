unit uClassEndereco;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils;

type

   { TEndereco }

   TEndereco = class
    private
       Fbairro: string;
       Fcep: string;
       Fcidade: string;
       Fcomplemento: string;
       Festado: string;
       FidEndereco: integer;
       FidTblPaciente: integer;
       Flogradouro: string;
       Fnumero: string;
    public
       property idEndereco: integer read FidEndereco write FidEndereco;
       property logradouro: string read Flogradouro write Flogradouro;
       property numero: string read Fnumero write Fnumero;
       property complemento: string read Fcomplemento write Fcomplemento;
       property bairro: string read Fbairro write Fbairro;
       property cidade: string read Fcidade write Fcidade;
       property estado: string read Festado write Festado;
       property cep: string read Fcep write Fcep;
       property idTblPaciente: integer read FidTblPaciente write FidTblPaciente;
   end;

implementation

{ TEndereco }

end.

