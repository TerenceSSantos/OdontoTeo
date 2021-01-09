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
        class procedure EnviaDadosBasicos(objPaciente: TPaciente);

        function InclusaoOuEdicaoDocumentos(objDocumentos: TDocumentos): integer;

        function InclusaoOuEdicaoResponsavel(objResponsavel: TResponsavelPaciente): integer;

        function ApagarResponsavel(codigo: integer): boolean;
        function SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;

        function InclusaoOuEdicaoEndereco(objEndereco: TEndereco): integer;

        function InclusaoOuEdicaoContatos(objContatos : TContatos): integer;

        function InclusaoOuEdicaoDadosProf(objDadosProf: TDadosProfissionais): integer;

        function InclusaoOuEdicaoAnamnese(objAnamnese: TAnamnese): integer;

        function InclusaoOuEdicaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): integer;

        function InclusaoEnfermidades(objEnfermidades: TEnfermidades): boolean;
        function EdicaoEnfermidades(objEnfermidades: TEnfermidades): boolean;

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

class procedure TControlePaciente.EnviaDadosBasicos(objPaciente: TPaciente);
begin
   frmCadPaciente.PreencheFormDadosBasicos(objPaciente);
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

function TControlePaciente.InclusaoOuEdicaoContatos(objContatos: TContatos): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoContatos(objContatos);
end;

function TControlePaciente.InclusaoOuEdicaoDadosProf(objDadosProf: TDadosProfissionais): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoDadosProf(objDadosProf);
end;

function TControlePaciente.InclusaoOuEdicaoAnamnese(objAnamnese: TAnamnese): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoAnamnese(objAnamnese);
end;

function TControlePaciente.InclusaoOuEdicaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): integer;
begin
   result := dmCadPaciente.InclusaoOuEdicaoSinaisSintomas(objSinaisSintomas);
end;

function TControlePaciente.InclusaoEnfermidades(objEnfermidades: TEnfermidades): boolean;
begin
   result := dmCadPaciente.InclusaoEnfermidades(objEnfermidades);
end;

function TControlePaciente.EdicaoEnfermidades(objEnfermidades: TEnfermidades): boolean;
begin
   result := dmCadPaciente.EdicaoEnfermidades(objEnfermidades);
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

