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
      function TblPacienteVazia : boolean;
      procedure Pacientes;
   end;

var
   dmCadPaciente: TdmCadPaciente;

implementation

uses
   uDMConexao;

{$R *.lfm}

{ TdmCadPaciente }

function TdmCadPaciente.TblPacienteVazia: boolean;
begin
   qryTblPaciente.SQL.Clear;
   qryTblPaciente.Close;
   qryTblPaciente.SQL.Add('select first 2 * from tbl_paciente');
   qryTblPaciente.Open;
   if qryTblPaciente.IsEmpty then
      result := true
   else
      result := false;
end;

procedure TdmCadPaciente.Pacientes;
begin
   qryTblPaciente.SQL.Clear;
   qryTblPaciente.Close;
   qryTblPaciente.SQL.Add('select id_paciente, nome_paciente from tbl_paciente');
   qryTblPaciente.Open;
end;

end.

