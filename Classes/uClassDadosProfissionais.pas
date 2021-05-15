unit uClassDadosProfissionais;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uClassEndereco;

type

   { TDadosProfissionais }

   TDadosProfissionais = class
   private
      Fcargo: string;
      Fendereco: TEndereco;
      FidDadoProfissional: integer;
      FnomeEmpresa: string;
      FidTblPaciente: integer;
      FidTblEndereco: integer;
    public
       property idDadoProfissional: integer read FidDadoProfissional write FidDadoProfissional;
       property nomeEmpresa: string read FnomeEmpresa write FnomeEmpresa;
       property cargo: string read Fcargo write Fcargo;
       property idTblPaciente: integer read FidTblPaciente write FidTblPaciente;
       property idTblEndereco: integer read FidTblEndereco write FidTblEndereco;
       property endereco: TEndereco read Fendereco write Fendereco;

       constructor Create;
       destructor Destroy; override;
   end;

implementation

{ TDadosProfissionais }

constructor TDadosProfissionais.Create;
begin
   endereco := TEndereco.Create;
end;

destructor TDadosProfissionais.Destroy;
begin
   inherited;
   endereco.Free;
   endereco := nil;
end;

end.

