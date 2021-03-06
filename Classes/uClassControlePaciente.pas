unit uClassControlePaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uClassPaciente, uClassResponsavelPaciente, uClassSinaisSintomas, uDMCadPaciente, uLocalizarPaciente,
   uClassEnfermidades, uClassEndereco, uClassContatos, uClassAnamnese, uClassDadosProfissionais, uClassDocumentos;

type

   { TControlePaciente }

   TControlePaciente = class
     private

     public
        procedure ChamaLocalizar; //(frmLocalizaPaciente: TfrmLocalizaPaciente);

        function InclusaoOuEdicaoDadosBasicos(objPaciente: TPaciente): integer;
        function ApagarCadastroBasico(codigo: integer): boolean;
        function TblPacienteVazia : boolean;
        function SelectDadosBasicos(idPaciente: integer;
           objDadosBasicos: TPaciente): TPaciente;
        class procedure EnviaDadosBasicos(objPaciente: TPaciente);

        function InclusaoOuEdicaoDocumentos(objDocumentos: TDocumentos): integer;

        function InclusaoOuEdicaoResponsavel(objResponsavel: TResponsavelPaciente): integer;

        function ApagarResponsavel(codigo: integer): boolean;
        function SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;

        function InclusaoOuEdicaoEndereco(objEndereco: TEndereco): integer;
        function SelectEndereco(idTblPaciente: integer; objEndereco: TEndereco): TEndereco;

        function InclusaoOuEdicaoContatos(objContatos : TContatos): integer;
        function SelectContatos(idTblPaciente: integer; objContatos: TContatos): TContatos;

        function InclusaoOuEdicaoDadosProf(objDadosProf: TDadosProfissionais): integer;
        function SelectDadosProfissionais(idTblPaciente: integer; objDadosProf: TDadosProfissionais): TDadosProfissionais;

        function InclusaoOuEdicaoAnamnese(objAnamnese: TAnamnese): integer;
        function SelectAnamnese(idTblPaciente: integer; objAnamnese: TAnamnese): TAnamnese;

        function InclusaoOuEdicaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): integer;
        function SelectSinaisSintomas(idTblPaciente: integer; objSinaisSintomas: TSinaisSintomas): TSinaisSintomas;

        function InclusaoOuEdicaoEnfermidades(objEnfermidades: TEnfermidades): integer;
        function SelectEnfermidades(idTblPaciente: integer; objEnfermidades: TEnfermidades): TEnfermidades;

        constructor Create;
        destructor Destroy; override;
     end;

var
   controlePaciente : TControlePaciente;

implementation

uses
   uCadPacientes;

{ TControlePaciente }

procedure TControlePaciente.ChamaLocalizar;
var
   frmLocalizaPaciente : TfrmLocalizaPaciente;
begin                                                {** CHAMAR A TELA DE PESQUISA DE PACIENTES **}
   try
      frmLocalizaPaciente := TfrmLocalizaPaciente.Create(nil);
      frmLocalizaPaciente.ShowModal;
   finally
      FreeAndNil(frmLocalizaPaciente);
   end;
end;

function TControlePaciente.InclusaoOuEdicaoDadosBasicos(objPaciente: TPaciente): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoDadosBasicos(objPaciente);
end;

function TControlePaciente.ApagarCadastroBasico(codigo: integer): boolean;
begin
   result := dmCadPaciente.ApagarDadosBasico(codigo);
end;

function TControlePaciente.TblPacienteVazia: boolean;
begin
   result := dmCadPaciente.TblPacienteVazia;
end;

function TControlePaciente.SelectDadosBasicos(idPaciente: integer; objDadosBasicos: TPaciente): TPaciente;
begin
   result := dmCadPaciente.SelectDadosBasicos(idPaciente, objDadosBasicos);
end;

class procedure TControlePaciente.EnviaDadosBasicos(objPaciente: TPaciente);
begin
   frmCadPaciente.PreencheAbaDadosBasicos(objPaciente);
end;

function TControlePaciente.InclusaoOuEdicaoDocumentos(objDocumentos: TDocumentos): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoDocumentos(objDocumentos);
end;

function TControlePaciente.InclusaoOuEdicaoResponsavel(objResponsavel: TResponsavelPaciente): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoResponsavel(objResponsavel);
end;

function TControlePaciente.ApagarResponsavel(codigo: integer): boolean;
begin
   dmCadPaciente.ApagarResponsavel(codigo);
end;

function TControlePaciente.SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;
begin
   dmCadPaciente.SelectResponsavel(idTblPaciente, objResponsavel);
end;

function TControlePaciente.InclusaoOuEdicaoEndereco(objEndereco: TEndereco): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoEndereco(objEndereco);
end;

function TControlePaciente.SelectEndereco(idTblPaciente: integer; objEndereco: TEndereco): TEndereco;
begin
   result := dmCadPaciente.SelectEndereco(idTblPaciente, objEndereco);
end;

function TControlePaciente.InclusaoOuEdicaoContatos(objContatos: TContatos): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoContatos(objContatos);
end;

function TControlePaciente.SelectContatos(idTblPaciente: integer; objContatos: TContatos): TContatos;
begin
   result := dmCadPaciente.SelectContatos(idTblPaciente, objContatos);
end;

function TControlePaciente.InclusaoOuEdicaoDadosProf(objDadosProf: TDadosProfissionais): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoDadosProf(objDadosProf);
end;

function TControlePaciente.SelectDadosProfissionais(idTblPaciente: integer; objDadosProf: TDadosProfissionais): TDadosProfissionais;
begin
   result := dmCadPaciente.SelectDadosProfissionais(idTblPaciente, objDadosProf);
end;

function TControlePaciente.InclusaoOuEdicaoAnamnese(objAnamnese: TAnamnese): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoAnamnese(objAnamnese);
end;

function TControlePaciente.SelectAnamnese(idTblPaciente: integer; objAnamnese: TAnamnese): TAnamnese;
begin
   result := dmCadPaciente.SelectAnamnese(idTblPaciente, objAnamnese);
end;

function TControlePaciente.InclusaoOuEdicaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoSinaisSintomas(objSinaisSintomas);
end;

function TControlePaciente.SelectSinaisSintomas(idTblPaciente: integer; objSinaisSintomas: TSinaisSintomas): TSinaisSintomas;
begin
   result := dmCadPaciente.SelectSinaisSintomas(idTblPaciente, objSinaisSintomas);
end;

function TControlePaciente.InclusaoOuEdicaoEnfermidades(objEnfermidades: TEnfermidades): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoEnfermidades(objEnfermidades);
end;

function TControlePaciente.SelectEnfermidades(idTblPaciente: integer; objEnfermidades: TEnfermidades): TEnfermidades;
begin
   result := dmCadPaciente.SelectEnfermidades(idTblPaciente, objEnfermidades);
end;

constructor TControlePaciente.Create;
begin
   inherited;
end;

destructor TControlePaciente.Destroy;
begin
   inherited Destroy;
end;

end.

