unit uDMCadPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, ZDataset;

type

   { TdmCadPaciente }

   TdmCadPaciente = class(TDataModule)
      dsTblPaciente: TDataSource;
      qryTblPaciente: TZQuery;
   private

   public
      function TabelaVazia(query: TZQuery; tabela: string): boolean;
      function TblPacienteVazia : boolean;
   end;

var
   dmCadPaciente: TdmCadPaciente;

implementation

{$R *.lfm}

{ TdmCadPaciente }

function TdmCadPaciente.TabelaVazia(query: TZQuery; tabela: string): boolean;
begin
   query.Close;                           { TODO : Continuar com o código para tabela vazia do cadastro de pacientes }
   query.SQL.Clear;
   query.SQL.Add('select first 2 * from ' + tabela);
   query.Open;
   if query.IsEmpty then
      result := true
   else
      result := false;
end;

function TdmCadPaciente.TblPacienteVazia: boolean;
begin
   //qryTblPaciente.Close;
   //qryTblPaciente.SQL.Clear;
   //qryTblPaciente.SQL.Add('select first 2 * from tbl_paciente');
   //qryTblPaciente.Open;
   if qryTblPaciente.IsEmpty then
      result := true
   else
      result := false;
end;

end.

