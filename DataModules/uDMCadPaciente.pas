unit uDMCadPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, ZDataset, dialogs;

type

   { TdmCadPaciente }

   TdmCadPaciente = class(TDataModule)
      dsTblPaciente: TDataSource;
      qryTblPaciente: TZQuery;
   private

   public
      function TblPacienteVazia : boolean;
      function Pacientes : TDataSource;
      procedure Pacientes(nomePaciente : string);
      function Pacientes(idPaciente : integer) : TDataSet;
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

function TdmCadPaciente.Pacientes: TDataSource;
begin
   qryTblPaciente.SQL.Clear;
   qryTblPaciente.Close;
   qryTblPaciente.SQL.Add('select * from tbl_paciente order by nome_paciente');
   qryTblPaciente.Open;
   result := dsTblPaciente;
end;

procedure TdmCadPaciente.Pacientes(nomePaciente: string);
begin
   qryTblPaciente.SQL.Clear;
   qryTblPaciente.Close;
   qryTblPaciente.SQL.Add('select * from tbl_paciente where nome_paciente containing '  +
                           QuotedStr(nomePaciente) + ' order by nome_paciente');
   qryTblPaciente.Open;
end;

function TdmCadPaciente.Pacientes(idPaciente: integer): TDataSet;
begin
   qryTblPaciente.SQL.Clear;
   qryTblPaciente.Close;
   qryTblPaciente.SQL.Add('select * from tbl_paciente where id_paciente = '+ IntToStr(idPaciente));
   qryTblPaciente.Open;
   result := qryTblPaciente;
end;

end.

