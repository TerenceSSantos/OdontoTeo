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
      qryTblResponsavelID_RESPONSAVEL: TLongintField;
      qryTblResponsavelNOME_RESPONSAVEL: TStringField;
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

      function EnviaDadosBasicos(objPaciente: TPaciente) : TPaciente;
//      function ApagarCadastroBasico(codigo: integer): boolean;

      function InclusaoOuEdicaoDadosBasicos(objPaciente: TPaciente): integer;
      function ApagarDadosBasico(codigo: integer): boolean;

      function InclusaoOuEdicaoDocumentos(objDocumentos: TDocumentos): integer;

      function InclusaoOuEdicaoResponsavel(objResponsavel: TResponsavelPaciente): integer;
      function ApagarResponsavel(codigo: integer): boolean;
      function SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;

      function InclusaoOuEdicaoEndereco(objEndereco: TEndereco): integer;

      function InclusaoOuEdicaoContatos(objContatos: TContatos): integer;

      function InclusaoOuEdicaoDadosProf(objDadosProf: TDadosProfissionais): integer;

      function InclusaoOuEdicaoAnamnese(objAnamnese: TAnamnese): integer;

      function InclusaoOuEdicaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): integer;

      function InclusaoOuEdicaoEnfermidades(objEnfermidades: TEnfermidades): integer;

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

function TdmCadPaciente.InclusaoOuEdicaoDocumentos(objDocumentos: TDocumentos): integer;
var
   frmMensagem: TfrmMensagem;
begin
   with strprocInsertEditDocumentos do
   begin
      Params[0].AsInteger := objDocumentos.idIdentidade;
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
end;
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
   qryTblResponsavel.SQL.Add('select * from tbl_responsavel where id_tblPaciente = ' + IntToStr(idTblPaciente));
   qryTblResponsavel.Open;
   objResponsavel.idResponsavel := qryTblResponsavelID_RESPONSAVEL.AsInteger;
   objResponsavel.nomeResponsavel := qryTblResponsavelNOME_RESPONSAVEL.AsString;
   objResponsavel.parentesco := qryTblResponsavelPARENTESCO.AsString;
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

function TdmCadPaciente.InclusaoOuEdicaoEnfermidades(objEnfermidades: TEnfermidades): integer;
var
   frmMensagem : TfrmMensagem;
begin
   with strprocCadEditEnfermidades do
   begin                                                      { TODO : Erro aqui. }
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

