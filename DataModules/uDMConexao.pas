unit uDMConexao;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, ZConnection;

type

   { TdmConexao }

   TdmConexao = class(TDataModule)
      zConexao: TZConnection;
   private

   public

   end;

var
   dmConexao: TdmConexao;

implementation

{$R *.lfm}

end.

