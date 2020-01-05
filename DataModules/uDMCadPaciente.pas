unit uDMCadPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, ZDataset, dialogs;

type

   { TdmCadPaciente }

   TdmCadPaciente = class(TDataModule)
      qryTblPaciente: TZQuery;
   private

   public
      function TblPacienteVazia : boolean;
      procedure Pacientes;
      procedure Pacientes(nomePaciente : string);
      procedure Pacientes(idPaciente: integer);
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
   qryTblPaciente.SQL.Add('select * from tbl_paciente order by nome_paciente');
   qryTblPaciente.Open;
end;

procedure TdmCadPaciente.Pacientes(nomePaciente: string);
begin
   qryTblPaciente.SQL.Clear;
   qryTblPaciente.Close;
   qryTblPaciente.SQL.Add('select * from tbl_paciente where nome_paciente containing '  +
                           QuotedStr(nomePaciente) + ' order by nome_paciente');
   qryTblPaciente.Open;
end;

procedure TdmCadPaciente.Pacientes(idPaciente: integer);
begin
   qryTblPaciente.SQL.Clear;
   qryTblPaciente.Close;
   qryTblPaciente.SQL.Add('select * from tbl_paciente where id_paciente = '+ IntToStr(idPaciente));
   qryTblPaciente.Open;
end;

end.

