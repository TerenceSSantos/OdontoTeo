unit uDMCadPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, ZDataset, dialogs, uClassPaciente, ZStoredProcedure;

type

   { TdmCadPaciente }

   TdmCadPaciente = class(TDataModule)
      qryTblPaciente: TZQuery;
      strprocGravarDadosBasicos: TZStoredProc;
   private

   public
      function TblPacienteVazia : boolean;
      procedure Pacientes;
      procedure Pacientes(nomePaciente : string);
      procedure Pacientes(idPaciente: integer);
      function GravarDadosBasicos(objPaciente: TPaciente): integer;
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

function TdmCadPaciente.GravarDadosBasicos(objPaciente: TPaciente): integer;
begin
   with strprocGravarDadosBasicos do
   begin
      Params[0].AsString := objPaciente.nomePaciente;
      Params[1].AsString := objPaciente.nomePai;
      Params[2].AsString := objPaciente.nomeMae;
      Params[3].AsString := objPaciente.estadoCivil;
      Params[4].AsString := objPaciente.nomeConjuge;
      Params[5].AsString := objPaciente.sexo;
      if not(objPaciente.dataNascimento = StrToDate('30/12/1899')) then
         Params[6].AsDate := objPaciente.dataNascimento;
      Params[7].AsString := objPaciente.naturalidade;
      Params[8].AsString := objPaciente.ufNascimento;
      Params[9].AsString := objPaciente.nacionalidade;
      Params[10].AsString := objPaciente.ativo;
   end;
   try
      strprocGravarDadosBasicos.ExecProc;
      result := strprocGravarDadosBasicos.Params[12].AsInteger;
   except on E: Exception do
   begin
      ShowMessage('Erro ao tentar gravar o registro, com a seguinte mensagem de erro:' + LineEnding + E.Message);
      result := 0;
   end;
   end;
end;

end.

