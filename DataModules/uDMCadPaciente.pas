unit uDMCadPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, ZDataset, dialogs, uClassPaciente, ZStoredProcedure, uClassResponsavelPaciente, {uClassDocumentos,}
   uClassSinaisSintomas, uClassEnfermidades, uClassEndereco, uClassContatos, uClassAnamnese, uClassDadosProfissionais, uClassDocumentos;

type

   { TdmCadPaciente }

   TdmCadPaciente = class(TDataModule)
      qryContatos: TZQuery;
      qryTblEndereco: TZQuery;
      qryTblPaciente: TZQuery;
      qryTblResponsavel: TZQuery;
      qryTblResponsavelCPF: TStringField;
      qryTblResponsavelIDENTIDADE: TStringField;
      qryTblResponsavelID_DOCUMENTOS: TLongintField;
      qryTblResponsavelID_RESPONSAVEL: TLongintField;
      qryTblResponsavelID_TBLPACIENTE: TLongintField;
      qryTblResponsavelID_TBLRESPONSAVEL: TLongintField;
      qryTblResponsavelNOME_RESPONSAVEL: TStringField;
      qryTblResponsavelORGAO_EXPEDIDOR: TStringField;
      qryTblResponsavelPARENTESCO: TStringField;
      strprocApagarDadosBasicos: TZStoredProc;
      strprocApagarResponsavel: TZStoredProc;
      strprocCadEditAnamnese: TZStoredProc;
      strprocCadEditContatos: TZStoredProc;
      strprocCadEditDadosBasicos: TZStoredProc;
      strprocCadEditEndereco: TZStoredProc;
      strprocCadEditDadosProf: TZStoredProc;
      strprocCadEditEnfermidades: TZStoredProc;
      strprocCadEditSiniasSintomas: TZStoredProc;
      strprocInsertEditDocumentos: TZStoredProc;
      strprocCadEditResponsavel: TZStoredProc;
   private

   public
      function TblPacienteVazia : boolean;

//      function EnviaDadosBasicos(objPaciente: TPaciente) : TPaciente;
//      function ApagarCadastroBasico(codigo: integer): boolean;

      function InclusaoOuEdicaoDadosBasicos(objPaciente: TPaciente): integer;
      function ApagarDadosBasico(codigo: integer): boolean;
      function SelectDadosBasicos(idPaciente: integer; objDadosBasicos: TPaciente): TPaciente;

      function InclusaoOuEdicaoDocumentos(objDocumentos: TDocumentos): integer;

      function InclusaoOuEdicaoResponsavel(objResponsavel: TResponsavelPaciente): integer;
      function ApagarResponsavel(codigo: integer): boolean;
      function SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;

      function InclusaoOuEdicaoEndereco(objEndereco: TEndereco): integer;
      function SelectEndereco(idTblPaciente: integer; objEndereco: TEndereco): TEndereco;

      function InclusaoOuEdicaoContatos(objContatos: TContatos): integer;
      function SelectContatos(idTblPaciente: integer; objContatos: TContatos): TContatos;

      function InclusaoOuEdicaoDadosProf(objDadosProf: TDadosProfissionais): integer;
      function SelectDadosProfissionais(idTblPaciente: integer; objDadosProf: TDadosProfissionais): TDadosProfissionais;

      function InclusaoOuEdicaoAnamnese(objAnamnese: TAnamnese): integer;
      function SelectAnamnese(idTblPaciente: integer; objAnamnese: TAnamnese): TAnamnese;

      function InclusaoOuEdicaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): integer;
      function SelectSinaisSintomas(idTblPaciente: integer; objSinaisSintomas: TSinaisSintomas): TSinaisSintomas;

      function InclusaoOuEdicaoEnfermidades(objEnfermidades: TEnfermidades): integer;
      function SelectEnfermidades(idTblPaciente: integer; objEnfermidades: TEnfermidades): TEnfermidades;

      var ativo : string;
      var nome : string;

      procedure MontaSelect;
   end;

var
   dmCadPaciente: TdmCadPaciente;

implementation

uses
   uDMConexao, uFrmMensagem;

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

function TdmCadPaciente.InclusaoOuEdicaoDadosBasicos(objPaciente: TPaciente): integer;
var
   frmMensagem : TfrmMensagem;
begin
   with strprocCadEditDadosBasicos do     //** UTILIZAÇÃO DA STORED PROCEDURE PARA SALVAR OS DADOS BÁSICOS NO BANCO DE DADOS *****
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
      Params[9].AsString := objPaciente.ufNascimento;
      Params[10].AsString := objPaciente.nacionalidade;
      Params[11].AsString := objPaciente.ativo;
   end;

   try
      strprocCadEditDadosBasicos.ExecProc;
      result := strprocCadEditDadosBasicos.Params[12].AsInteger;
   except on E: Exception do
    begin
       try
          frmMensagem := TfrmMensagem.Create(nil);
          frmMensagem.InfoFormMensagem('Cadastro de Dados Básicos', tiErro, 'Erro ao tentar gravar o registro, com a seguinte mensagem' +
                                       ' de erro:' + LineEnding + LineEnding + E.Message);
       finally
          FreeAndNil(frmMensagem);
       end;
       result := 0;
    end;
   end;
end;

function TdmCadPaciente.ApagarDadosBasico(codigo: integer): boolean;
var
   frmMensagem : TfrmMensagem;
begin
   try
      strprocApagarDadosBasicos.Params[0].AsInteger := codigo;
      strprocApagarDadosBasicos.ExecProc;
      result := true;
   except on E: Exception do
    begin
       try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Apagar Cadastro', tiErro, 'Erro ao tentar apagar o registro ' +
                                      ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
       finally
          FreeAndNil(frmMensagem);
       end;
       result := false;
    end;
   end;
end;

function TdmCadPaciente.SelectDadosBasicos(idPaciente: integer; objDadosBasicos: TPaciente): TPaciente;
var
   qry : TZQuery;
begin
   try
      qry := TZQuery.Create(nil);
      //qry.SQL.Add('select * from tbl_paciente ');
      //qry.SQL.Add('where id_paciente = ' + IntToStr(idPaciente));
      qry.Close;
      qry.SQL.Add('SELECT P.*, D.*');
      qry.SQL.Add(' FROM tbl_paciente P');
      qry.SQL.Add(' LEFT JOIN TBL_DOCUMENTOS D on D.id_tblpaciente = P.id_paciente');
      qry.SQL.Add(' WHERE P.id_paciente =  :idTblPaciente');
      qry.Connection := dmConexao.zConexao;
      qry.Params[0].Name := 'idTblPaciente';
      qry.Params[0].DataType := ftInteger;
      qry.Params[0].ParamType := ptInput;
      qry.Params[0].AsInteger := idPaciente;
      qry.Open;
      objDadosBasicos.idPaciente := qry.FieldByName('ID_PACIENTE').AsInteger;
      objDadosBasicos.nomePaciente := qry.FieldByName('NOME_PACIENTE').AsString;
      objDadosBasicos.nomePai := qry.FieldByName('NOME_PAI').AsString;
      objDadosBasicos.nomeMae := qry.FieldByName('NOME_MAE').AsString;
      objDadosBasicos.estadoCivil := qry.FieldByName('ESTADO_CIVIL').AsString;
      objDadosBasicos.nomeConjuge := qry.FieldByName('NOME_CONJUGE').AsString;
      objDadosBasicos.sexo := qry.FieldByName('SEXO').AsString;
      objDadosBasicos.dataNascimento := qry.FieldByName('DATA_NASCIMENTO').AsDateTime;
      objDadosBasicos.naturalidade := qry.FieldByName('NATURALIDADE').AsString;
      objDadosBasicos.ufNascimento := qry.FieldByName('UF_NASCIMENTO').AsString;
      objDadosBasicos.nacionalidade := qry.FieldByName('NACIONALIDADE').AsString;
      objDadosBasicos.ativo := qry.FieldByName('ATIVO').AsString;
      objDadosBasicos.documento.cpf := qry.FieldByName('CPF').AsString;
      objDadosBasicos.documento.identidade := qry.FieldByName('IDENTIDADE').AsString;
      objDadosBasicos.documento.orgaoExpedidor := qry.FieldByName('ORGAO_EXPEDIDOR').AsString;
      objDadosBasicos.documento.idDocumentos := qry.FieldByName('ID_DOCUMENTOS').AsInteger;

      result := objDadosBasicos;
   finally
      FreeAndNil(qry);
   end;
end;

function TdmCadPaciente.InclusaoOuEdicaoDocumentos(objDocumentos: TDocumentos): integer;
var
   frmMensagem: TfrmMensagem;
begin
   with strprocInsertEditDocumentos do
   begin
      Params[0].AsInteger := objDocumentos.idDocumentos;
      Params[1].AsString := objDocumentos.identidade;
      Params[2].AsString := objDocumentos.orgaoExpedidor;
      Params[3].AsString := objDocumentos.cpf;
      if objDocumentos.idTblPaciente = 0 then
         Params[4].Value := Null
      else
         Params[4].AsInteger := objDocumentos.idTblPaciente;        // 3 = TBLPACIENTE
                                                                    // 4 = TBLRESPONSAVEL
      if objDocumentos.idTblResponsavel = 0 then                    // 5 = TBLDENTISTA
         Params[5].Value := null
      else
         Params[5].AsInteger := objDocumentos.idTblResponsavel;

      if objDocumentos.idTblDentista = 0 then
         Params[6].Value := null
      else
         Params[6].AsInteger := objDocumentos.idTblDentista;
   end;
   try
      strprocInsertEditDocumentos.ExecProc;
      result := strprocInsertEditDocumentos.Params[7].AsInteger;
   except on E: Exception do
    begin
       try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Cadastro do Documentos', tiErro, 'Erro ao tentar gravar Documentos ' +
                                      'com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
       finally
          FreeAndNil(frmMensagem);
       end;
       result := 0;
    end;

   end;
end;

function TdmCadPaciente.InclusaoOuEdicaoResponsavel(objResponsavel: TResponsavelPaciente): integer;
var
   frmMensagem : TfrmMensagem;
begin
   strprocCadEditResponsavel.Params[0].AsInteger := objResponsavel.idResponsavel;
   strprocCadEditResponsavel.Params[1].AsString := objResponsavel.nomeResponsavel;
   strprocCadEditResponsavel.Params[2].AsString := objResponsavel.parentesco;
   strprocCadEditResponsavel.Params[3].AsInteger := objResponsavel.idTblPaciente;
   try
      strprocCadEditResponsavel.ExecProc;
      result := strprocCadEditResponsavel.Params[4].AsInteger;
   except on E: Exception do
    begin
       try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Cadastro do Responsável', tiErro, 'Erro ao tentar gravar a inclusão do registro ' +
                                      ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
       finally
          FreeAndNil(frmMensagem);
       end;
       result := 0;
    end;
   end;

end;
{
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
{      objPaciente.CPF := qryTblPaciente.FieldByName('CPF_PACIENTE').AsString;
      objPaciente.identidadePaciente := qryTblPaciente.FieldByName('IDENTIDADE_PACIENTE').AsString;
      objPaciente.orgaoExpedidorID := qryTblPaciente.FieldByName('ORGAO_EXPEDIDOR_ID').AsString;   }
      result := objPaciente;
end;  }
{
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
       try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Apagar Cadastro', tiErro, 'Erro ao tentar apagar o registro ' +
                                      ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
       finally
          FreeAndNil(frmMensagem);
       end;
       result := false;
    end;
   end;
end;
 }
function TdmCadPaciente.ApagarResponsavel(codigo: integer): boolean;
var
   frmMensagem : TfrmMensagem;
begin
   try
      strprocApagarResponsavel.Params[0].AsInteger := codigo;
      strprocApagarResponsavel.ExecProc;
      result := true;
   except on E: Exception do
    begin
       try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Apagar Cadastro', tiErro, 'Erro ao tentar apagar o registro ' +
                                      ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
       finally
          FreeAndNil(frmMensagem);
       end;
       result := false;
    end;
   end;
end;

function TdmCadPaciente.SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;
begin
   qryTblResponsavel.Close;
   qryTblResponsavel.SQL.Clear;
   qryTblResponsavel.SQL.Add('SELECT R.*, D.*');
   qryTblResponsavel.SQL.Add(' FROM TBL_RESPONSAVEL R');
   qryTblResponsavel.SQL.Add(' LEFT JOIN TBL_DOCUMENTOS D on D.ID_TBLRESPONSAVEL = R.ID_RESPONSAVEL');
   qryTblResponsavel.SQL.Add(' WHERE R.ID_TBLPACIENTE = ' + IntToStr(idTblPaciente));
   qryTblResponsavel.Open;
   objResponsavel.idResponsavel := qryTblResponsavelID_RESPONSAVEL.AsInteger;
   objResponsavel.nomeResponsavel := qryTblResponsavelNOME_RESPONSAVEL.AsString;
   objResponsavel.parentesco := qryTblResponsavelPARENTESCO.AsString;
   //objResponsavel.identidadeResponsavel := qryTblResponsavelIDENTIDADE.AsString;
   //objResponsavel.orgaoExpedidor := qryTblResponsavelORGAO_EXPEDIDOR.AsString;
   //objResponsavel.cpfResponsavel := qryTblResponsavelCPF.AsString;
   objResponsavel.documento.identidade := qryTblResponsavelIDENTIDADE.AsString;
   objResponsavel.documento.orgaoExpedidor := qryTblResponsavelORGAO_EXPEDIDOR.AsString;
   objResponsavel.documento.cpf := qryTblResponsavelCPF.AsString;
   objResponsavel.documento.idDocumentos := qryTblResponsavelID_DOCUMENTOS.AsInteger;

   objResponsavel.idTblPaciente := qryTblResponsavelID_TBLPACIENTE.AsInteger;
//   objResponsavel. := qryTblResponsavelID_DOCUMENTOS.AsInteger;
   result := objResponsavel;
end;

function TdmCadPaciente.InclusaoOuEdicaoEndereco(objEndereco: TEndereco): integer;
var
   frmMensagem : TfrmMensagem;                                 // 8 = TBLPACIENTE
begin                                                          // 9 = TBLDADOSPROF
   with strprocCadEditEndereco do
   begin
      Params[0].AsInteger := objEndereco.idEndereco;
      Params[1].AsString := objEndereco.logradouro;
      Params[2].AsString := objEndereco.numero;
      Params[3].AsString := objEndereco.complemento;
      Params[4].AsString := objEndereco.bairro;
      Params[5].AsString := objEndereco.cidade;
      Params[6].AsString := objEndereco.estado;
      Params[7].AsString := objEndereco.cep;

      if objEndereco.idTblPaciente = 0 then
         Params[8].Value := Null
      else
         Params[8].AsInteger := objEndereco.idTblPaciente;

      IF objEndereco.idTblDadosProf = 0 then
         Params[9].Value := null
      else
         Params[9].AsInteger := objEndereco.idTblDadosProf;

      try
         ExecProc;
         result := Params[10].AsInteger;
      except on E: Exception do
         begin
            try
               frmMensagem := TfrmMensagem.Create(Self);
               frmMensagem.InfoFormMensagem('Inclusão de Endereço do Paciente', tiErro, 'Erro ao tentar gravar o registro ' +
                                            ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
            finally
               FreeAndNil(frmMensagem);
            end;
            result := 0;
         end;
      end;
   end;
end;

function TdmCadPaciente.SelectEndereco(idTblPaciente: integer; objEndereco: TEndereco): TEndereco;
begin
   qryTblEndereco.Close;
   qryTblEndereco.Params[0].AsInteger := idTblPaciente;
   qryTblEndereco.Open;
   objEndereco.idEndereco := qryTblEndereco.FieldByName('ID_ENDERECO').AsInteger;
   objEndereco.logradouro := qryTblEndereco.FieldByName('LOGRADOURO').AsString;
   objEndereco.numero := qryTblEndereco.FieldByName('NUMERO').AsString;
   objEndereco.complemento := qryTblEndereco.FieldByName('COMPLEMENTO').AsString;
   objEndereco.bairro := qryTblEndereco.FieldByName('BAIRRO').AsString;
   objEndereco.cidade := qryTblEndereco.FieldByName('CIDADE').AsString;
   objEndereco.estado := qryTblEndereco.FieldByName('ESTADO').AsString;
   objEndereco.cep := qryTblEndereco.FieldByName('CEP').AsString;
   result := objEndereco;
end;

function TdmCadPaciente.InclusaoOuEdicaoContatos(objContatos: TContatos): integer;
var
   frmMensagem : TfrmMensagem;
begin
   with strprocCadEditContatos do
   begin
      Params[0].AsInteger := objContatos.idContatos;
      Params[1].AsString := objContatos.dddTelCasa;
      Params[2].AsString := objContatos.telefoneCasa;
      Params[3].AsString := objContatos.operadoraTelCasa;
      Params[4].AsString := objContatos.dddCelular1;
      Params[5].AsString := objContatos.NumeroCelular1;
      Params[6].AsString := objContatos.operadoraCelular1;
      Params[7].AsString := objContatos.dddCelular2;
      Params[8].AsString := objContatos.numeroCelular2;
      Params[9].AsString := objContatos.operadoraCelular2;
      Params[10].AsString := objContatos.dddTelTrabalho;
      Params[11].AsString := objContatos.telefoneTrabalho;
      Params[12].AsString := objContatos.operadoraTelTrabalho;
      Params[13].AsString := objContatos.dddTelRecado;
      Params[14].AsString := objContatos.telefoneRecado;
      Params[15].AsString := objContatos.operadoraTelRecado;
      Params[16].AsString := objContatos.nomePessoaTelRecado;
      Params[17].AsString := objContatos.email;
      Params[18].AsInteger := objContatos.idTblPaciente;
   end;
   try
      strprocCadEditContatos.ExecProc;
      result := strprocCadEditContatos.Params[19].AsInteger;
   except on E: Exception do
      begin
         try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Cadastro de Contatos', tiErro, 'Erro ao tentar gravação do registro ' +
                                      'com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
         finally
            FreeAndNil(frmMensagem);
         end;
         result := 0;
      end;
   end;
end;

function TdmCadPaciente.SelectContatos(idTblPaciente: integer; objContatos: TContatos): TContatos;
begin
   qryContatos.Close;
   qryContatos.Params[0].AsInteger := idTblPaciente;
   qryContatos.Open;
   objContatos.idContatos := qryContatos.FieldByName('ID_CONTATOS').AsInteger;
   objContatos.dddTelCasa := qryContatos.FieldByName('DDD_TEL_CASA').AsString;
   objContatos.telefoneCasa := qryContatos.FieldByName('TEL_CASA').AsString;
   objContatos.operadoraTelCasa := qryContatos.FieldByName('OPERADORA_TEL_CASA').AsString;
   objContatos.dddCelular1 := qryContatos.FieldByName('DDD_CELULAR1').AsString;
   objContatos.NumeroCelular1 := qryContatos.FieldByName('CELULAR1').AsString;
   objContatos.operadoraCelular1 := qryContatos.FieldByName('OPERADORA_CEL1').AsString;
   objContatos.dddCelular2 := qryContatos.FieldByName('DDD_CELULAR2').AsString;
   objContatos.numeroCelular2 := qryContatos.FieldByName('CELULAR2').AsString;
   objContatos.operadoraCelular2 := qryContatos.FieldByName('OPERADORA_CEL2').AsString;
   objContatos.dddTelTrabalho := qryContatos.FieldByName('DDD_TEL_TRABALHO').AsString;
   objContatos.telefoneTrabalho := qryContatos.FieldByName('TEL_TRABALHO').AsString;
   objContatos.operadoraTelTrabalho := qryContatos.FieldByName('OPERADORA_TEL_TRABALHO').AsString;
   objContatos.dddTelRecado := qryContatos.FieldByName('DDD_TEL_RECADO').AsString;
   objContatos.telefoneRecado := qryContatos.FieldByName('TELEFONE_RECADO').AsString;
   objContatos.operadoraTelRecado := qryContatos.FieldByName('OPERADORA_TEL_RECADO').AsString;
   objContatos.nomePessoaTelRecado := qryContatos.FieldByName('NOME_PESSOA_TEL_RECADO').AsString;
   objContatos.email := qryContatos.FieldByName('EMAIL').AsString;
   objContatos.idTblPaciente := qryContatos.FieldByName('ID_TBLPACIENTE').AsInteger;

   result := objContatos;
end;

function TdmCadPaciente.InclusaoOuEdicaoDadosProf(objDadosProf: TDadosProfissionais): integer;
var
   frmMensagem : TfrmMensagem;
begin
   with strprocCadEditDadosProf do
   begin
      Params[0].AsInteger := objDadosProf.idDadoProfissional;
      Params[1].AsString := objDadosProf.nomeEmpresa;
      Params[2].AsString := objDadosProf.cargo;
      Params[3].AsInteger := objDadosProf.idTblPaciente;
   end;
   try
      strprocCadEditDadosProf.ExecProc;
      result := strprocCadEditDadosProf.Params[4].AsInteger;
   except on E: Exception do
      begin
         try
            frmMensagem := TfrmMensagem.Create(Self);
            frmMensagem.InfoFormMensagem('Cadastro de Dados Profissionais', tiErro, 'Erro ao tentar gravar o registro ' +
                                         ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
         finally
            FreeAndNil(frmMensagem);
         end;
         result := 0;
      end;
   end;
end;

function TdmCadPaciente.SelectDadosProfissionais(idTblPaciente: integer; objDadosProf: TDadosProfissionais): TDadosProfissionais;
var
   qry : TZQuery;
begin
   try
      qry := TZQuery.Create(nil);
      qry.Connection := dmConexao.zConexao;
      qry.Close;
      qry.SQL.Add('SELECT P.*, E.*');
      qry.SQL.Add(' FROM tbl_dado_profissional P');
      qry.SQL.Add(' left join tbl_endereco E on E.id_tbldadosprof = P.id_dado_profissional');
      qry.SQL.Add(' WHERE P.id_tblpaciente =  :idTblPaciente' );
      qry.Params[0].Name := 'idTblPaciente';
      qry.Params[0].DataType := ftInteger;
      qry.Params[0].ParamType := ptInput;
      qry.Params[0].AsInteger := idTblPaciente;
      qry.Open;
      objDadosProf.idDadoProfissional := qry.FieldByName('ID_DADO_PROFISSIONAL').AsInteger;
      objDadosProf.nomeEmpresa := qry.FieldByName('NOME_EMPRESA').AsString;
      objDadosProf.cargo := qry.FieldByName('CARGO').AsString;
      objDadosProf.idTblPaciente := idTblPaciente;
      objDadosProf.endereco.idEndereco := qry.FieldByName('ID_ENDERECO').AsInteger;
      objDadosProf.endereco.logradouro := qry.FieldByName('LOGRADOURO').AsString;
      objDadosProf.endereco.numero := qry.FieldByName('NUMERO').AsString;
      objDadosProf.endereco.complemento := qry.FieldByName('COMPLEMENTO').AsString;
      objDadosProf.endereco.bairro := qry.FieldByName('BAIRRO').AsString;
      objDadosProf.endereco.cidade := qry.FieldByName('CIDADE').AsString;
      objDadosProf.endereco.estado := qry.FieldByName('ESTADO').AsString;
      objDadosProf.endereco.cep := qry.FieldByName('CEP').AsString;

      result := objDadosProf;
   finally
      FreeAndNil(qry);
   end;
end;

function TdmCadPaciente.InclusaoOuEdicaoAnamnese(objAnamnese: TAnamnese): integer;
var
   frmMensagem : TfrmMensagem;
begin
   with strprocCadEditAnamnese do
   begin
      Params[0].AsInteger := objAnamnese.idAnamnese;
      Params[1].AsString := objAnamnese.consumoAcucar;
      Params[2].AsString := objAnamnese.escovacao;
      Params[3].AsString := objAnamnese.usoFioDental;
      Params[4].AsString := objAnamnese.obsAnatomoHisto;
      Params[5].AsString := objAnamnese.habitosViciosos;
      Params[6].AsString := objAnamnese.antecedentesFamiliares;
      Params[7].AsString := objAnamnese.apreensivoTratDentario;
      Params[8].AsString := objAnamnese.porqueApreensivo;
      Params[9].AsString := objAnamnese.tratamentoMedico;
      Params[10].AsString := objAnamnese.qualTratMedico;
      Params[11].AsString := objAnamnese.tomaMedicamento;
      Params[12].AsString := objAnamnese.tomaQualMedicamento;
      Params[13].AsString := objAnamnese.alergiaAnestesia;
      Params[14].AsString := objAnamnese.alergiaQualAnestesia;
      Params[15].AsString := objAnamnese.algumaAlergia;
      Params[16].AsString := objAnamnese.qualAlergia;
      Params[17].AsString := objAnamnese.foiHospitalizado;
      Params[18].AsString := objAnamnese.porqueHospitalizado;
      Params[19].AsString := objAnamnese.estaGravida;
      Params[20].AsString := objAnamnese.previsaoParto;
      Params[21].AsSmallInt := objAnamnese.teveQuantasGravidez;
      Params[22].AsSmallInt := objAnamnese.quantosFilhos;
      Params[23].AsString := objAnamnese.chegouMenopausa;
      Params[24].AsString := objAnamnese.quandoChegouMenopausa;
      Params[25].AsInteger := objAnamnese.idTblPaciente;

      try
         ExecProc;
         result := Params[26].AsInteger;
      except on E: Exception do
         begin
            try
               frmMensagem := TfrmMensagem.Create(Self);
               frmMensagem.InfoFormMensagem('Cadastro de Anamnese', tiErro, 'Erro ao tentar gravar o registro ' +
                                            ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
            finally
               FreeAndNil(frmMensagem);
            end;
            result := 0;
         end;

      end;
   end;
end;

function TdmCadPaciente.SelectAnamnese(idTblPaciente: integer; objAnamnese: TAnamnese): TAnamnese;
var
   qry : TZQuery;
begin
   try
      qry := TZQuery.Create(nil);
      qry.Connection := dmConexao.zConexao;
      qry.SQL.Add('SELECT * FROM tbl_anamnese WHERE ID_TBLPACIENTE =  :idTblPaciente');
      qry.Params[0].Name := 'idTblPaciente';
      qry.Params[0].DataType := ftInteger;
      qry.Params[0].ParamType := ptInput;
      qry.Params[0].AsInteger := idTblPaciente;
      qry.Open;
      objAnamnese.idAnamnese := qry.FieldByName('ID_ANAMNESE').AsInteger;
      objAnamnese.consumoAcucar := qry.FieldByName('CONSUMO_ACUCAR').AsString;
      objAnamnese.escovacao := qry.FieldByName('ESCOVACAO').AsString;
      objAnamnese.usoFioDental := qry.FieldByName('USO_FIO_DENTAL').AsString;
      objAnamnese.obsAnatomoHisto := qry.FieldByName('OBS_ANATOMO_HISTO').AsString;
      objAnamnese.habitosViciosos := qry.FieldByName('HABITOS_VICIOSOS').AsString;
      objAnamnese.antecedentesFamiliares := qry.FieldByName('ANTECEDENTES_FAMILIARES').AsString;
      objAnamnese.apreensivoTratDentario := qry.FieldByName('APREENSIVO_TRAT_DENTARIO').AsString;
      objAnamnese.porqueApreensivo := qry.FieldByName('PORQUE_APREENSIVO').AsString;
      objAnamnese.tratamentoMedico := qry.FieldByName('TRATAMENTO_MEDICO').AsString;
      objAnamnese.qualTratMedico := qry.FieldByName('QUAL_TRAT_MEDICO').AsString;
      objAnamnese.tomaMedicamento := qry.FieldByName('TOMA_MEDICAMENTO').AsString;
      objAnamnese.tomaQualMedicamento := qry.FieldByName('TOMA_QUAL_MEDICAMENTO').AsString;
      objAnamnese.alergiaAnestesia := qry.FieldByName('ALERGIA_ANESTESIA').AsString;
      objAnamnese.alergiaQualAnestesia := qry.FieldByName('ALERGIA_QUAL_ANESTESIA').AsString;
      objAnamnese.algumaAlergia := qry.FieldByName('ALGUMA_ALERGIA').AsString;
      objAnamnese.qualAlergia := qry.FieldByName('QUAL_ALERGIA').AsString;
      objAnamnese.foiHospitalizado := qry.FieldByName('FOI_HOSPITALIZADO').AsString;
      objAnamnese.porqueHospitalizado := qry.FieldByName('PORQUE_HOSPITALIZADO').AsString;
      objAnamnese.estaGravida := qry.FieldByName('ESTA_GRAVIDA').AsString;
      objAnamnese.previsaoParto := qry.FieldByName('PREVISAO_PARTO').AsString;
      objAnamnese.teveQuantasGravidez := qry.FieldByName('TEVE_QUANTAS_GRAVIDEZ').AsInteger;
      objAnamnese.quantosFilhos := qry.FieldByName('QUANTOS_FILHOS').AsInteger;
      objAnamnese.chegouMenopausa := qry.FieldByName('CHEGOU_MENOPAUSA').AsString;
      objAnamnese.quandoChegouMenopausa := qry.FieldByName('QUANDO_CHEGOU_MENOPAUSA').AsString;
      objAnamnese.idTblPaciente := idTblPaciente;

      result := objAnamnese;
   finally
      FreeAndNil(qry);
   end;

end;

function TdmCadPaciente.InclusaoOuEdicaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): integer;
var
   frmMensagem : TfrmMensagem;
begin
   with strprocCadEditSiniasSintomas do
   begin
      Params[0].AsInteger := objSinaisSintomas.idSinaisSintomas;
      Params[1].AsString := objSinaisSintomas.alteracaoApetite;
      Params[2].AsString := objSinaisSintomas.calorExagerado;
      Params[3].AsString := objSinaisSintomas.cansaFacil;
      Params[4].AsString := objSinaisSintomas.coceiraAnormal;
      Params[5].AsString := objSinaisSintomas.dificuldadeEngolir;
      Params[6].AsString := objSinaisSintomas.dificuldadeMastigar;
      Params[7].AsString := objSinaisSintomas.dorFacial;
      Params[8].AsString := objSinaisSintomas.dorFrequenteCabeca;
      Params[9].AsString := objSinaisSintomas.dorOuvidoFrequente;
      Params[10].AsString := objSinaisSintomas.emagrecimentoAcentuado;
      Params[11].AsString := objSinaisSintomas.estaloMandibula;
      Params[12].AsString := objSinaisSintomas.febreFrequente;
      Params[13].AsString := objSinaisSintomas.indigestaoFrequente;
      Params[14].AsString := objSinaisSintomas.maCicatrizacao;
      Params[15].AsString := objSinaisSintomas.miccaoFrequente;
      Params[16].AsString := objSinaisSintomas.rangeDentes;
      Params[17].AsString := objSinaisSintomas.respiraPelaBoca;
      Params[18].AsString := objSinaisSintomas.sangramentoAnormal;
      Params[19].AsString := objSinaisSintomas.tonturaDesmaio;
      Params[20].AsString := objSinaisSintomas.poucaSaliva;
      Params[21].AsInteger := objSinaisSintomas.idTblPaciente;
      try
         ExecProc;
         result := Params[22].AsInteger;
      except on E: Exception do
         begin
            try
               frmMensagem := TfrmMensagem.Create(Self);
               frmMensagem.InfoFormMensagem('Cadastro de Sinais & Sintomas', tiErro, 'Erro ao tentar gravar o registro ' +
                                            ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
            finally
               FreeAndNil(frmMensagem);
            end;
            result := 0;
         end;
      end;
   end;
end;

function TdmCadPaciente.SelectSinaisSintomas(idTblPaciente: integer; objSinaisSintomas: TSinaisSintomas): TSinaisSintomas;
var
   qry : TZQuery;
begin
   try
      qry := TZQuery.Create(nil);
      qry.Connection := dmConexao.zConexao;
      qry.Close;
      qry.SQL.Add('SELECT * FROM tbl_sinais_sintomas WHERE ID_TBLPACIENTE =  :idTblPaciente');
      qry.Params[0].Name := 'idTblPaciente';
      qry.Params[0].DataType := ftInteger;
      qry.Params[0].ParamType := ptInput;
      qry.Params[0].AsInteger := idTblPaciente;
      qry.Open;
      objSinaisSintomas.idSinaisSintomas := qry.FieldByName('ID_SINAIS_SINTOMAS').AsInteger;
      objSinaisSintomas.alteracaoApetite := qry.FieldByName('ALTERACAO_APETITE').AsString;
      objSinaisSintomas.calorExagerado := qry.FieldByName('CALOR_EXAGERADO').AsString;
      objSinaisSintomas.cansaFacil := qry.FieldByName('CANSA_FACIL').AsString;
      objSinaisSintomas.coceiraAnormal := qry.FieldByName('COCEIRA_ANORMAL').AsString;
      objSinaisSintomas.dificuldadeEngolir := qry.FieldByName('DIFICULDADE_ENGOLIR').AsString;
      objSinaisSintomas.dificuldadeMastigar := qry.FieldByName('DIFICULDADE_MASTIGAR').AsString;
      objSinaisSintomas.dorFacial := qry.FieldByName('DOR_FACIAL').AsString;
      objSinaisSintomas.dorFrequenteCabeca := qry.FieldByName('DOR_CABECA_FREQUENTE').AsString;
      objSinaisSintomas.dorOuvidoFrequente := qry.FieldByName('DOR_OUVIDO_FREQUENTE').AsString;
      objSinaisSintomas.emagrecimentoAcentuado := qry.FieldByName('EMAGRECIMENTO_ACENTUADO').AsString;
      objSinaisSintomas.estaloMandibula := qry.FieldByName('ESTALO_MANDIBULA').AsString;
      objSinaisSintomas.febreFrequente := qry.FieldByName('FEBRE_FREQUENTE').AsString;
      objSinaisSintomas.indigestaoFrequente := qry.FieldByName('INDIGESTAO_FREQUENTE').AsString;
      objSinaisSintomas.maCicatrizacao := qry.FieldByName('MA_CICATRIZACAO').AsString;
      objSinaisSintomas.miccaoFrequente := qry.FieldByName('MICCAO_FREQUENTE').AsString;
      objSinaisSintomas.rangeDentes := qry.FieldByName('RANGE_DENTES').AsString;
      objSinaisSintomas.respiraPelaBoca := qry.FieldByName('RESPIRA_BOCA').AsString;
      objSinaisSintomas.sangramentoAnormal := qry.FieldByName('SANGRAMENTO_ANORMAL').AsString;
      objSinaisSintomas.tonturaDesmaio := qry.FieldByName('TONTURA_DESMAIOS').AsString;
      objSinaisSintomas.poucaSaliva := qry.FieldByName('POUCA_SALIVA').AsString;
      objSinaisSintomas.idTblPaciente := idTblPaciente;

      result := objSinaisSintomas;
   finally
      FreeAndNil(qry);
   end;
end;

function TdmCadPaciente.InclusaoOuEdicaoEnfermidades(objEnfermidades: TEnfermidades): integer;
var
   frmMensagem : TfrmMensagem;
begin
   with strprocCadEditEnfermidades do
   begin
      Params[0].AsInteger := objEnfermidades.idEnfermidade;
      Params[1].AsString := objEnfermidades.aids;
      Params[2].AsString := objEnfermidades.anemia;
      Params[3].AsString := objEnfermidades.asma;
      Params[4].AsString := objEnfermidades.diabete;
      Params[5].AsString := objEnfermidades.doencaCoracao;
      Params[6].AsString := objEnfermidades.tumorBoca;
      Params[7].AsString := objEnfermidades.doencaRenal;
      Params[8].AsString := objEnfermidades.disritmiaEpilepsia;
      Params[9].AsString := objEnfermidades.febreReumatica;
      Params[10].AsString := objEnfermidades.glaucoma;
      Params[11].AsString := objEnfermidades.gonorreia;
      Params[12].AsString := objEnfermidades.hanseniase;
      Params[13].AsString := objEnfermidades.hemofilia;
      Params[14].AsString := objEnfermidades.hepatite;
      Params[15].AsString := objEnfermidades.ictericia;
      Params[16].AsString := objEnfermidades.problemaHormonal;
      Params[17].AsString := objEnfermidades.sifilis;
      Params[18].AsString := objEnfermidades.sinusite;
      Params[19].AsString := objEnfermidades.tuberculose;
      Params[20].AsString := objEnfermidades.ulceraHepatica;
      Params[21].AsInteger := objEnfermidades.idTblPaciente;
      try
         ExecProc;
         result := Params[22].AsInteger;
      except on E: Exception do
         begin
            try
               frmMensagem := TfrmMensagem.Create(Self);
               frmMensagem.InfoFormMensagem('Cadastro de Enfermidades', tiErro, 'Erro ao tentar gravar o registro ' +
                                            ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
            finally
               FreeAndNil(frmMensagem);
            end;
            result := 0;
         end;
      end;
   end;
end;

function TdmCadPaciente.SelectEnfermidades(idTblPaciente: integer; objEnfermidades: TEnfermidades): TEnfermidades;
var
   qry : TZQuery;
begin
   try
      qry := TZQuery.Create(nil);
      qry.Connection := dmConexao.zConexao;
      qry.Close;
      qry.SQL.Add('SELECT * FROM tbl_enfermidades WHERE ID_TBLPACIENTE =  :idTblPaciente');
      qry.Params[0].Name := 'idTblPaciente';
      qry.Params[0].DataType := ftInteger;
      qry.Params[0].ParamType := ptInput;
      qry.Params[0].AsInteger := idTblPaciente;
      qry.Open;
      objEnfermidades.idEnfermidade := qry.FieldByName('ID_ENFERMIDADES').AsInteger;
      objEnfermidades.aids := qry.FieldByName('AIDS').AsString;
      objEnfermidades.anemia := qry.FieldByName('ANEMIA').AsString;
      objEnfermidades.asma := qry.FieldByName('ASMA').AsString;
      objEnfermidades.diabete := qry.FieldByName('DIABETE').AsString;
      objEnfermidades.doencaCoracao := qry.FieldByName('DOENCA_CORACAO').AsString;
      objEnfermidades.tumorBoca := qry.FieldByName('TUMOR_BOCA').AsString;
      objEnfermidades.doencaRenal := qry.FieldByName('DOENCA_RENAL').AsString;
      objEnfermidades.disritmiaEpilepsia := qry.FieldByName('DISRITMIA_EPILEPSIA').AsString;
      objEnfermidades.febreReumatica := qry.FieldByName('FEBRE_REUMATICA').AsString;
      objEnfermidades.glaucoma := qry.FieldByName('GLAUCOMA').AsString;
      objEnfermidades.gonorreia := qry.FieldByName('GONORREIA').AsString;
      objEnfermidades.hanseniase := qry.FieldByName('HANSENIASE').AsString;
      objEnfermidades.hemofilia := qry.FieldByName('HEMOFILIA').AsString;
      objEnfermidades.hepatite := qry.FieldByName('HEPATITE').AsString;
      objEnfermidades.ictericia := qry.FieldByName('ICTERICIA').AsString;
      objEnfermidades.problemaHormonal := qry.FieldByName('PROBLEMA_HORMONAL').AsString;
      objEnfermidades.sifilis := qry.FieldByName('SIFILIS').AsString;
      objEnfermidades.sinusite := qry.FieldByName('SINUSITE').AsString;
      objEnfermidades.tuberculose := qry.FieldByName('TUBERCULOSE').AsString;
      objEnfermidades.ulceraHepatica := qry.FieldByName('ULCERA_HEPATICA').AsString;
      objEnfermidades.idTblPaciente := idTblPaciente;

      result := objEnfermidades;
   finally
      FreeAndNil(qry);
   end;
end;

{
function TdmCadPaciente.SelectDocumentos(id: integer): TDocumento;
begin
   qryContatos.Close;
   qryContatos.SQL.Clear;
end; }

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

