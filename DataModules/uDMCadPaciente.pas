unit uDMCadPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, ZDataset, dialogs, uClassPaciente, ZStoredProcedure, uClassResponsavelPaciente, uClassDocumentos,
   uClassSinaisSintomas, uClassEnfermidades;

type

   { TdmCadPaciente }

   TdmCadPaciente = class(TDataModule)
      qryDocumentos: TZQuery;
      qryTblDocumentos: TZQuery;
      qryTblPaciente: TZQuery;
      qryTblResponsavel: TZQuery;
      qryTblResponsavelID_RESPONSAVEL: TLongintField;
      qryTblResponsavelNOME_RESPONSAVEL: TStringField;
      qryTblResponsavelPARENTESCO: TStringField;
      strprocEditarDadosBasicos: TZStoredProc;
      strprocGravarDocumentos: TZStoredProc;
      strprocGravarDadosBasicos: TZStoredProc;
      strprocGravarEnfermidades: TZStoredProc;
      strprocGravarResponsavel: TZStoredProc;
      strprocGravarSinaisSintomas: TZStoredProc;
   private

   public
      function TblPacienteVazia : boolean;
      function InclusaoDadosBasicos(objPaciente: TPaciente): integer;
      function EdicaoDadosBasicos(objPaciente: TPaciente): boolean;
      function EnviaDadosBasicos(objPaciente: TPaciente) : TPaciente;
      function ApagarCadastroBasico(codigo: integer): boolean;

      function ConvertePraBoolean(s: string): boolean;

      function InclusaoResponsavel(objResponsavel: TResponsavelPaciente): boolean;
      function SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;

      function InclusaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): boolean;

      function InclusaoEnfermidades(objEnfermidades: TEnfermidades): boolean;

      { TODO 1 -oTerence -cCadastro : AQUI DEVERÁ CRIAR O INSERT DE DOCUMENTOS. PORÉM ANTES DE INCLUIR O DOCUMENTO DO RESPONSÁVEL,
      DEVEMOS VERIFICAR SE JÁ EXISTE UM RESPONSÁVEL CADASTRADO. }
      function SelectDocumentos(id: integer): TDocumento;

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

function TdmCadPaciente.InclusaoDadosBasicos(objPaciente: TPaciente): integer;
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

function TdmCadPaciente.EdicaoDadosBasicos(objPaciente: TPaciente): boolean;
begin
   with strprocEditarDadosBasicos do
   begin
      Params[0].AsInteger := objPaciente.idPaciente;
      Params[1].AsString := objPaciente.nomePaciente;
      Params[2].AsString := objPaciente.nomePai;
      Params[3].AsString := objPaciente.nomeMae;
      Params[4].AsString := objPaciente.estadoCivil;
      Params[5].AsString := objPaciente.nomeConjuge;
      Params[6].AsString := objPaciente.sexo;
      if not(objPaciente.dataNascimento = StrToDate('30/12/1899')) then
         Params[7].AsDate := objPaciente.dataNascimento;
      Params[8].AsString := objPaciente.naturalidade;
      Params[9].AsString := objPaciente.nacionalidade;
      Params[10].AsString := objPaciente.ativo;
   end;
   try
      strprocEditarDadosBasicos.ExecProc;
      result := true;
   except on E: Exception do
    begin
       ShowMessage('Erro ao tentar gravar a alteração do registro, com a seguinte mensagem de erro:' + LineEnding + E.Message);
       result := false;
    end;
   end;

end;

function TdmCadPaciente.EnviaDadosBasicos(objPaciente: TPaciente): TPaciente;
begin
                              // PREENCHER O OBJETO PACIENTE COM OS DADOS RECEBIDOS DA QUERY DEPOIS DE OPEN NA TABELA

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

function TdmCadPaciente.ApagarCadastroBasico(codigo: integer): boolean;
begin
   qryTblPaciente.SQL.Clear;
   qryTblPaciente.Close;
   try
      qryTblPaciente.SQL.Add('delete from tbl_paciente where id_paciente = ' + IntToStr(codigo));
      qryTblPaciente.ExecSQL;
      result := true;
   except on E: Exception do
    begin
       ShowMessage('Erro ao tentar apagar o registro, com a seguinte mensagem de erro:' + LineEnding + E.Message);
       result := false;
    end;
   end;
end;

function TdmCadPaciente.ConvertePraBoolean(s: string): boolean;
begin
   if s = 'true' then
      result := true
   else if s ='false' then
      result := false;
end;

function TdmCadPaciente.InclusaoResponsavel(objResponsavel: TResponsavelPaciente): boolean;
begin                                { TODO 0 -oTerence -cDMCadPaciente : Continuar o processo do CADASTRO DE RESPONSÁVEL }
   strprocGravarResponsavel.Params[0].AsString := objResponsavel.nomeResponsavel;
   strprocGravarResponsavel.Params[1].AsString := objResponsavel.parentesco;
   strprocGravarResponsavel.Params[2].AsInteger := objResponsavel.idPaciente;
   try
      strprocGravarResponsavel.ExecProc;
      result := true;
   except on E: Exception do
    begin
       ShowMessage('Erro ao tentar gravar a inclusão do registro, com a seguinte mensagem de erro:' + LineEnding + E.Message);
       result := false;
    end;
   end;
end;

function TdmCadPaciente.SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;
begin
   qryTblResponsavel.Close;
   qryTblResponsavel.SQL.Clear;
   qryTblResponsavel.SQL.Add('select * from tbl_responsavel where id_tblPaciente = ' + IntToStr(idTblPaciente));
   qryTblResponsavel.Open;
   objResponsavel.idResponsavel := qryTblResponsavelID_RESPONSAVEL.AsInteger;
   objResponsavel.nomeResponsavel := qryTblResponsavelNOME_RESPONSAVEL.AsString;
   objResponsavel.parentesco := qryTblResponsavelPARENTESCO.AsString;
   result := objResponsavel;
end;

function TdmCadPaciente.InclusaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): boolean;
begin
   with strprocGravarSinaisSintomas do
   begin
      Params[0].Value := objSinaisSintomas.alteracaoApetite;
      Params[1].Value := objSinaisSintomas.calorExagerado;
      Params[2].Value := objSinaisSintomas.cansaFacil;
      Params[3].Value := objSinaisSintomas.coceiraAnormal;
      Params[4].Value := objSinaisSintomas.dificuldadeEngolir;
      Params[5].Value := objSinaisSintomas.dificuldadeMastigar;
      Params[6].Value := objSinaisSintomas.dorFacial;
      Params[7].Value := objSinaisSintomas.dorFrequenteCabeca;
      Params[8].Value := objSinaisSintomas.dorOuvidoFrequente;
      Params[9].Value := objSinaisSintomas.emagrecimentoAcentuado;
      Params[10].Value := objSinaisSintomas.estaloMandibula;
      Params[11].Value := objSinaisSintomas.febreFrequente;
      Params[12].Value := objSinaisSintomas.indigestaoFrequente;
      Params[13].Value := objSinaisSintomas.maCicatrizacao;
      Params[14].Value := objSinaisSintomas.miccaoFrequente;
      Params[15].Value := objSinaisSintomas.rangeDentes;
      Params[16].Value := objSinaisSintomas.respiraPelaBoca;
      Params[17].Value := objSinaisSintomas.sangramentoAnormal;
      Params[18].Value := objSinaisSintomas.tonturaDesmaio;
      Params[19].Value := objSinaisSintomas.poucaSaliva;
      Params[20].AsInteger := objSinaisSintomas.idTblPaciente;
      try
         ExecProc;
         result := true;
      except on E: Exception do
         begin
            ShowMessage('Erro ao tentar gravar a inclusão do registro, com a seguinte mensagem de erro:' + LineEnding + E.Message);
            result := false;
         end;
      end;
   end;
end;

function TdmCadPaciente.InclusaoEnfermidades(objEnfermidades: TEnfermidades): boolean;
begin
   with strprocGravarEnfermidades do
   begin
      Params[0].Value := objEnfermidades.aids;
      Params[1].Value := objEnfermidades.anemia;
      Params[2].Value := objEnfermidades.asma;
      Params[3].Value := objEnfermidades.diabete;
      Params[4].Value := objEnfermidades.doencaCoracao;
      Params[5].Value := objEnfermidades.tumorBoca;
      Params[6].Value := objEnfermidades.doencaRenal;
      Params[7].Value := objEnfermidades.disritmiaEpilepsia;
      Params[8].Value := objEnfermidades.febreReumatica;
      Params[9].Value := objEnfermidades.glaucoma;
      Params[10].Value := objEnfermidades.gonorreia;
      Params[11].Value := objEnfermidades.hanseniase;
      Params[12].Value := objEnfermidades.hemofilia;
      Params[13].Value := objEnfermidades.hepatite;
      Params[14].Value := objEnfermidades.ictericia;
      Params[15].Value := objEnfermidades.problemaHormonal;
      Params[16].Value := objEnfermidades.sifilis;
      Params[17].Value := objEnfermidades.sinusite;
      Params[18].Value := objEnfermidades.tuberculose;
      Params[19].Value := objEnfermidades.ulceraHepatica;
      Params[20].AsInteger := objEnfermidades.idTblPaciente;
      try
         ExecProc;
         result := true;
      except on E: Exception do
         begin
            ShowMessage('Erro ao tentar gravar a inclusão do registro, com a seguinte mensagem de erro:' + LineEnding + E.Message);
            result := false;
         end;
      end;
   end;
end;

function TdmCadPaciente.SelectDocumentos(id: integer): TDocumento;
begin
   qryDocumentos.Close;
   qryDocumentos.SQL.Clear;
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

