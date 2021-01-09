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

       //constructor Create;
       //destructor Destroy; override;
   end;

implementation

{ TDadosProfissionais }

//constructor TDadosProfissionais.Create;
//begin
//   enderecoEmpresa := TEndereco.Create;
//end;
//
//destructor TDadosProfissionais.Destroy;
//begin
//   inherited;
//   enderecoEmpresa.Free;
//   enderecoEmpresa := nil;
//end;

end.

