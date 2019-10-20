unit uDMCadPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, ZDataset;

type

   { TdmTblPaciente }

   TdmTblPaciente = class(TDataModule)
      qryTblPaciente: TZQuery;
   private

   public
      function TabelaVazia(tabela : TZQuery) : boolean;
   end;

var
   dmTblPaciente: TdmTblPaciente;

implementation

{$R *.lfm}

{ TdmTblPaciente }

function TdmTblPaciente.TabelaVazia(tabela: TZQuery): boolean;
begin
   tabela.Close;
   tabela.SQL.Add('select first 2 * from ' + tabela.Name);
   tabela.Open;
   if tabela.IsEmpty then
      result := true
   else
      result := false;
end;

end.

