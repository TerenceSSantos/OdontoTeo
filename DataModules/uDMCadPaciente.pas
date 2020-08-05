unit uDMCadPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, ZDataset, dialogs, uClassPaciente, ZStoredProcedure, uClassResponsavelPaciente, {uClassDocumentos,}
   uClassSinaisSintomas, uClassEnfermidades, uClassEndereco, uClassContatos,
   uClassAnamnese, uClassDadosProfissionais;

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
      strprocAnamnese: TZStoredProc;
      strprocDadosProfissionais: TZStoredProc;
      strprocEditarContatos: TZStoredProc;
      strprocEditarDadosBasicos: TZStoredProc;
      strprocEditarDadosProf: TZStoredProc;
      strprocEditarEndereco: TZStoredProc;
      strprocEditarResponsavel: TZStoredProc;
      strprocGravarContatos: TZStoredProc;
      strprocGravarDadosBasicos: TZStoredProc;
      strprocGravarEndereco: TZStoredProc;
      strprocGravarEnfermidades: TZStoredProc;
      strprocGravarResponsavel: TZStoredProc;
      strprocGravarSinaisSintomas: TZStoredProc;
   private

   public
      function TblPacienteVazia : boolean;

      function EnviaDadosBasicos(objPaciente: TPaciente) : TPaciente;
      function ApagarCadastroBasico(codigo: integer): boolean;

      function InclusaoDadosBasicos(objPaciente: TPaciente): integer;
      function EdicaoDadosBasicos(objPaciente: TPaciente): boolean;

      function InclusaoResponsavel(objResponsavel: TResponsavelPaciente): boolean;
      function EdicaoResponsavel(objResponsavel: TResponsavelPaciente): boolean;
      function SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;

      function InclusaoEndereco(objEndereco: TEndereco): integer;
      function EdicaoEndereco(objEndereco: TEndereco): boolean;

      function InclusaoContatos(objContatos: TContatos): boolean;
      function EdicaoContatos(objContatos: TContatos): boolean;

      function InclusaoDadosProfissionais(objDadosProf: TDadosProfissionais): boolean;
      function EdicaoDadosProfissionais(objDadosProf: TDadosProfissionais): boolean;

      function InclusaoAnamnese(objAnamnese: TAnamnese): boolean;

      function InclusaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): boolean;

      function InclusaoEnfermidades(objEnfermidades: TEnfermidades): boolean;

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
      Params[10].AsString := objPaciente.CPF;
      Params[11].AsString := objPaciente.identidadePaciente;
      Params[12].AsString := objPaciente.orgaoExpedidorID;
      Params[13].AsString := objPaciente.ativo;
   end;
   try
      strprocGravarDadosBasicos.ExecProc;
      result := strprocGravarDadosBasicos.Params[15].AsInteger;
   except on E: Exception do
   begin
      try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Cadastro de Dados Básicos', tiErro, 'Erro ao tentar gravar o registro, com a seguinte mensagem' +
                                      ' de erro:' + LineEnding + LineEnding + E.Message);
      finally
         FreeAndNil(frmMensagem);
      end;
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
       try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Alteração dos Dados Básicos', tiErro, 'Erro ao tentar gravar a alteração do registro ' +
                                      'com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
       finally
          FreeAndNil(frmMensagem);
       end;
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
      objPaciente.CPF := qryTblPaciente.FieldByName('CPF_PACIENTE').AsString;
      objPaciente.identidadePaciente := qryTblPaciente.FieldByName('IDENTIDADE_PACIENTE').AsString;
      objPaciente.orgaoExpedidorID := qryTblPaciente.FieldByName('ORGAO_EXPEDIDOR_ID').AsString;
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

function TdmCadPaciente.InclusaoResponsavel(objResponsavel: TResponsavelPaciente): boolean;
begin
   strprocGravarResponsavel.Params[0].AsString := objResponsavel.nomeResponsavel;
   strprocGravarResponsavel.Params[1].AsString := objResponsavel.parentesco;
   strprocGravarResponsavel.Params[2].AsString := objResponsavel.cpfResponsavel;
   strprocGravarResponsavel.Params[3].AsString := objResponsavel.identidadeResponsavel;
   strprocGravarResponsavel.Params[4].AsString := objResponsavel.orgaoExpedidorID;
   strprocGravarResponsavel.Params[5].AsInteger := objResponsavel.idPaciente;
   try
      strprocGravarResponsavel.ExecProc;
      result := true;
   except on E: Exception do
    begin
       try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Cadastro do Responsável', tiErro, 'Erro ao tentar gravar a inclusão do registro ' +
                                      ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
       finally
          FreeAndNil(frmMensagem);
       end;
       result := false;
    end;
   end;
end;

function TdmCadPaciente.EdicaoResponsavel(objResponsavel: TResponsavelPaciente): boolean;
begin
   with strprocEditarResponsavel do
   begin
      Params[0].AsInteger := objResponsavel.idResponsavel;
      Params[1].AsString := objResponsavel.nomeResponsavel;
      Params[2].AsString := objResponsavel.parentesco;
      Params[3].AsInteger := objResponsavel.idPaciente;
      Params[4].AsString := objResponsavel.cpfResponsavel;
      Params[5].AsString := objResponsavel.identidadeResponsavel;
      Params[6].AsString := objResponsavel.orgaoExpedidorID;
   end;
   try
      strprocEditarResponsavel.ExecProc;
      result := true;
   except on E: Exception do
    begin
       try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Alteração de dados do Responsável', tiErro, 'Erro ao tentar gravar a alteração do registro ' +
                                      'com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
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

function TdmCadPaciente.InclusaoEndereco(objEndereco: TEndereco): integer;
begin
   with strprocGravarEndereco do
   begin
      Params[0].AsString := objEndereco.logradouro;
      Params[1].AsString := objEndereco.numero;
      Params[2].AsString := objEndereco.complemento;
      Params[3].AsString := objEndereco.bairro;
      Params[4].AsString := objEndereco.cidade;
      Params[5].AsString := objEndereco.estado;
      Params[6].AsString := objEndereco.cep;
      Params[7].AsInteger := objEndereco.idTblPaciente;
      try
         ExecProc;
         result := Params[8].AsInteger;
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

function TdmCadPaciente.EdicaoEndereco(objEndereco: TEndereco): boolean;
begin
   with strprocEditarEndereco do
   begin
      Params[0].AsInteger := objEndereco.idEndereco;
      Params[1].AsString := objEndereco.logradouro;
      Params[2].AsString := objEndereco.numero;
      Params[3].AsString := objEndereco.complemento;
      Params[4].AsString := objEndereco.bairro;
      Params[5].AsString := objEndereco.cidade;
      Params[6].AsString := objEndereco.estado;
      Params[7].AsString := objEndereco.cep;
      Params[8].AsInteger := objEndereco.idTblPaciente;
   end;
   try
      strprocEditarEndereco.ExecProc;
      result := true;
   except on E: Exception do
    begin
       try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Alteração de dados do Endereço', tiErro, 'Erro ao tentar gravar a alteração do registro ' +
                                      'com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
       finally
          FreeAndNil(frmMensagem);
       end;
       result := false;
    end;
   end;
end;

function TdmCadPaciente.InclusaoContatos(objContatos: TContatos): boolean;
begin
   with strprocGravarContatos do
   begin
      Params[0].AsString := objContatos.dddTelCasa;
      Params[1].AsString := objContatos.telefoneCasa;
      Params[2].AsString := objContatos.operadoraTelCasa;
      Params[3].AsString := objContatos.dddCelular1;
      Params[4].AsString := objContatos.NumeroCelular1;
      Params[5].AsString := objContatos.operadoraCelular1;
      Params[6].AsString := objContatos.dddCelular2;
      Params[7].AsString := objContatos.numeroCelular2;
      Params[8].AsString := objContatos.operadoraCelular2;
      Params[9].AsString := objContatos.dddTelTrabalho;
      Params[10].AsString := objContatos.telefoneTrabalho;
      Params[11].AsString := objContatos.operadoraTelTrabalho;
      Params[12].AsString := objContatos.dddTelRecado;
      Params[13].AsString := objContatos.telefoneRecado;
      Params[14].AsString := objContatos.operadoraTelRecado;
      Params[15].AsString := objContatos.nomePessoaTelRecado;
      Params[16].AsString := objContatos.email;
      Params[17].AsInteger := objContatos.idTblPaciente;

      try
         ExecProc;
         result := true;
      except on E: Exception do
         begin
            try
               frmMensagem := TfrmMensagem.Create(Self);
               frmMensagem.InfoFormMensagem('Inclusão dos contatos do Paciente', tiErro, 'Erro ao tentar gravar o registro ' +
                                            ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
            finally
               FreeAndNil(frmMensagem);
            end;
            result := false;
         end;
      end;
   end;
end;

function TdmCadPaciente.EdicaoContatos(objContatos: TContatos): boolean;
begin
   with strprocEditarContatos do
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
      strprocEditarContatos.ExecProc;
      result := true;
   except on E: Exception do
    begin
       try
         frmMensagem := TfrmMensagem.Create(Self);
         frmMensagem.InfoFormMensagem('Alteração de dados de Contato', tiErro, 'Erro ao tentar gravar a alteração do registro ' +
                                      'com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
       finally
          FreeAndNil(frmMensagem);
       end;
       result := false;
    end;
   end;
end;

function TdmCadPaciente.InclusaoDadosProfissionais(objDadosProf: TDadosProfissionais): boolean;
begin
   with strprocDadosProfissionais do
   begin
      Params[0].AsString := objDadosProf.nomeEmpresa;
      Params[1].AsString := objDadosProf.cargo;
      Params[3].AsInteger := objDadosProf.idTblPaciente;
      Params[2].AsInteger := InclusaoEndereco(objDadosProf.enderecoEmpresa);
      try
      ExecProc;
      result := true;
      except on E: Exception do
         begin
            try
               frmMensagem := TfrmMensagem.Create(Self);
               frmMensagem.InfoFormMensagem('Inclusão de Dados Profissionais', tiErro, 'Erro ao tentar gravar o registro ' +
                                            ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
            finally
               FreeAndNil(frmMensagem);
            end;
            result := false;
         end;
      end;
   end;
end;

function TdmCadPaciente.EdicaoDadosProfissionais(objDadosProf: TDadosProfissionais): boolean;
begin
   with strprocEditarDadosProf do
   begin
      Params[0].AsInteger := objDadosProf.idDadoProfissional;
      Params[1].AsString := objDadosProf.nomeEmpresa;
      Params[2].AsString := objDadosProf.cargo;
      Params[3].AsInteger := objDadosProf  { TODO : Como será feito esta inserção }
      Params[4].AsInteger := objDadosProf.idTblPaciente;
   end;
end;

function TdmCadPaciente.InclusaoAnamnese(objAnamnese: TAnamnese): boolean;
begin
   with dmCadPaciente.strprocAnamnese do
   begin
      Params[0].AsString := objAnamnese.consumoAcucar;
      Params[1].AsString := objAnamnese.escovacao;
      Params[2].AsString := objAnamnese.usoFioDental;
      Params[3].AsString := objAnamnese.obsAnatomoHisto;
      Params[4].AsString := objAnamnese.habitosViciosos;
      Params[5].AsString := objAnamnese.antecedentesFamiliares;
      Params[6].AsString := objAnamnese.apreensivoTratDentario;
      Params[7].AsString := objAnamnese.porqueApreensivo;
      Params[8].AsString := objAnamnese.tratamentoMedico;
      Params[9].AsString := objAnamnese.qualTratMedico;
      Params[10].AsString := objAnamnese.tomaMedicamento;
      Params[11].AsString := objAnamnese.tomaQualMedicamento;
      Params[12].AsString := objAnamnese.alergiaAnestesia;
      Params[13].AsString := objAnamnese.alergiaQualAnestesia;
      Params[14].AsString := objAnamnese.algumaAlergia;
      Params[15].AsString := objAnamnese.qualAlergia;
      Params[16].AsString := objAnamnese.foiHospitalizado;
      Params[17].AsString := objAnamnese.porqueHospitalizado;
      Params[18].AsString := objAnamnese.estaGravida;
      Params[19].AsString := objAnamnese.previsaoParto;
      Params[20].AsSmallInt := objAnamnese.teveQuantasGravidez;
      Params[21].AsSmallInt := objAnamnese.quantosFilhos;
      Params[22].AsString := objAnamnese.chegouMenopausa;
      Params[23].AsString := objAnamnese.quandoChegouMenopausa;
      Params[24].AsInteger := objAnamnese.idTblPaciente;

      try
         ExecProc;
         result := true;
      except on E: Exception do
         begin
            try
               frmMensagem := TfrmMensagem.Create(Self);
               frmMensagem.InfoFormMensagem('Inclusão da Anamnese', tiErro, 'Erro ao tentar gravar o registro ' +
                                            ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
            finally
               FreeAndNil(frmMensagem);
            end;
            result := false;
         end;
      end;

   end;
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
            try
               frmMensagem := TfrmMensagem.Create(Self);
               frmMensagem.InfoFormMensagem('Inclusão de Sinais & Sintomas', tiErro, 'Erro ao tentar gravar o registro ' +
                                            ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
            finally
               FreeAndNil(frmMensagem);
            end;
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
            try
               frmMensagem := TfrmMensagem.Create(Self);
               frmMensagem.InfoFormMensagem('Inclusão de Enfermidades', tiErro, 'Erro ao tentar gravar a inclusão do registro' +
                                            ' com a seguinte mensagem de erro:' + LineEnding + LineEnding + E.Message);
            finally
               FreeAndNil(frmMensagem);
            end;
            result := false;
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

