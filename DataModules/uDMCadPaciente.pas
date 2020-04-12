unit uDMCadPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, ZDataset, dialogs, uClassPaciente, ZStoredProcedure;

type

   { TdmCadPaciente }

   TdmCadPaciente = class(TDataModule)
      qryTblPaciente: TZQuery;
      strprocEditarDadosBasicos: TZStoredProc;
      strprocGravarDadosBasicos: TZStoredProc;
   private

   public
      function TblPacienteVazia : boolean;
      function GravarDadosBasicos(objPaciente: TPaciente): integer;
      function EnviaDadosBasicos(objPaciente: TPaciente) : TPaciente;

      var ativo : string;
      var nome : string;

      procedure MontaSelect;
   end;

var
   dmCadPaciente: TdmCadPaciente;

implementation

uses
   uDMConexao;

{$R *.lfm}

{ TdmCadPaciente }

function TdmCadPaciente.TblPacienteVazia: boolean;    //**** PARA VERIFICAR SE A TABELA ESTÁ VAZIA
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

function TdmCadPaciente.GravarDadosBasicos(objPaciente: TPaciente): integer;
begin
   with strprocGravarDadosBasicos do     //** UTILIZAÇÃO DA STORED PROCEDURE PARA SALVAR OS DADOS BÁSICOS NO BANCO DE DADOS *****
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

function TdmCadPaciente.EnviaDadosBasicos(objPaciente: TPaciente): TPaciente;
begin
      objPaciente.nomePaciente := qryTblPaciente.FieldByName('NOME_PACIENTE').AsString;
      objPaciente.idPaciente := qryTblPaciente.FieldByName('ID_PACIENTE').AsInteger;
      objPaciente.nomePai := qryTblPaciente.FieldByName('NOME_PAI').AsString;
      objPaciente.nomeMae := qryTblPaciente.FieldByName('NOME_MAE').AsString;
      objPaciente.estadoCivil := qryTblPaciente.FieldByName('ESTADO_CIVIL').AsString;
      objPaciente.nomeConjuge := qryTblPaciente.FieldByName('NOME_CONJUGE').AsString;
      objPaciente.sexo := qryTblPaciente.FieldByName('SEXO').AsString;
      objPaciente.dataNascimento := qryTblPaciente.FieldByName('DATA_NASCIMENTO').AsDateTime;
      objPaciente.naturalidade := qryTblPaciente.FieldByName('NATURALIDADE').AsString;
      objPaciente.ufNascimento := qryTblPaciente.FieldByName('UF_NASCIMENTO').AsString;
      objPaciente.nacionalidade := qryTblPaciente.FieldByName('NACIONALIDADE').AsString;
      objPaciente.ativo := qryTblPaciente.FieldByName('ATIVO').AsString;
      result := objPaciente;
end;

procedure TdmCadPaciente.MontaSelect;    //** ESCOLHA DOS SELECTS USADOS NO "LOCALIZAR PACIENTES"
begin
   qryTblPaciente.SQL.Clear;
   qryTblPaciente.Close;

   if (ativo = 'T') and (nome.Length < 3) then
      qryTblPaciente.SQL.Add('select * from tbl_paciente order by nome_paciente')
   else if (ativo = 'T') and (nome.Length > 2) then
      qryTblPaciente.SQL.Add('select * from tbl_paciente where nome_paciente containing ' + QuotedStr(nome) + ' order by nome_paciente');;

   if (ativo <> 'T') and (nome.Length < 3) then
      qryTblPaciente.SQL.Add('select * from tbl_paciente where ativo = ' + QuotedStr(ativo) + ' order by nome_paciente')
   else if (ativo <> 'T') and (nome.Length > 2) then
      qryTblPaciente.SQL.Add('select * from tbl_paciente where nome_paciente containing ' + QuotedStr(nome) + ' and Ativo = ' +
                              QuotedStr(ativo) + ' order by nome_paciente');

   qryTblPaciente.Open;
end;

end.

