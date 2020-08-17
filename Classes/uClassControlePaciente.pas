unit uClassControlePaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uClassPaciente, uClassResponsavelPaciente, uClassSinaisSintomas, uDMCadPaciente, uLocalizarPaciente,
   uClassEnfermidades, uClassEndereco, uClassContatos, uClassAnamnese, uClassDadosProfissionais;

type

   { TControlePaciente }

   TControlePaciente = class
     private

     public
        procedure ChamaLocalizar; //(frmLocalizaPaciente: TfrmLocalizaPaciente);

        function InclusaoDadosBasicos(objPaciente: TPaciente): integer;
        function EdicaoDadosBasicos(objPaciente: TPaciente): boolean;
        function ApagarCadastroBasico(codigo: integer): boolean;
        function TblPacienteVazia : boolean;
        class procedure EnviaDadosBasicos(objPaciente: TPaciente);

        function InclusaoResponsavel(objResponsavel: TResponsavelPaciente): boolean;
        function EdicaoResponsavel(objResponsavel: TResponsavelPaciente): boolean;
        function SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;

        function InclusaoEndereco(objEndereco: TEndereco): boolean;
        function EdicaoEndereco(objEndereco: TEndereco): boolean;

        function InclusaoContatos(objContatos: TContatos): boolean;
        function EdicaoContatos(objContatos: TContatos): boolean;

        function InclusaoDadosProfissionais(objDadosProf: TDadosProfissionais): integer;

        function InclusaoAnamnese(objAnamnese: TAnamnese): boolean;
        function EdicaoAnamnese(objAnamnese: TAnamnese): boolean;

        function InclusaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): boolean;
        function EdicaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): boolean;

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

function TControlePaciente.InclusaoDadosBasicos(objPaciente: TPaciente): integer;
begin
   result :=  dmCadPaciente.InclusaoDadosBasicos(objPaciente);
end;

function TControlePaciente.EdicaoDadosBasicos(objPaciente: TPaciente): boolean;
begin
   result := dmCadPaciente.EdicaoDadosBasicos(objPaciente);
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

function TControlePaciente.InclusaoResponsavel(objResponsavel: TResponsavelPaciente): boolean;
begin
   result := dmCadPaciente.InclusaoResponsavel(objResponsavel);
end;

function TControlePaciente.EdicaoResponsavel(objResponsavel: TResponsavelPaciente): boolean;
begin
   dmCadPaciente.EdicaoResponsavel(objResponsavel);
end;

function TControlePaciente.SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;
begin
   dmCadPaciente.SelectResponsavel(idTblPaciente, objResponsavel);
end;

function TControlePaciente.InclusaoEndereco(objEndereco: TEndereco): boolean;
begin
   result := dmCadPaciente.InclusaoEndereco(objEndereco);
end;

function TControlePaciente.EdicaoEndereco(objEndereco: TEndereco): boolean;
begin
   result := dmCadPaciente.EdicaoEndereco(objEndereco);
end;

function TControlePaciente.InclusaoContatos(objContatos: TContatos): boolean;
begin
   result := dmCadPaciente.InclusaoContatos(objContatos);
end;

function TControlePaciente.EdicaoContatos(objContatos: TContatos): boolean;
begin
   result := dmCadPaciente.EdicaoContatos(objContatos);
end;

function TControlePaciente.InclusaoDadosProfissionais(objDadosProf: TDadosProfissionais): integer;
begin
   result := dmCadPaciente.InclusaoDadosProfissionais(objDadosProf);
end;

function TControlePaciente.InclusaoAnamnese(objAnamnese: TAnamnese): boolean;
begin
   result := dmCadPaciente.InclusaoAnamnese(objAnamnese);
end;

function TControlePaciente.EdicaoAnamnese(objAnamnese: TAnamnese): boolean;
begin
   result := dmCadPaciente.EdicaoAnamnese(objAnamnese);
end;

function TControlePaciente.InclusaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): boolean;
begin
   result := dmCadPaciente.InclusaoSinaisSintomas(objSinaisSintomas);
end;

function TControlePaciente.EdicaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): boolean;
begin
   result := dmCadPaciente.EdicaoSinaisSintomas(objSinaisSintomas);
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

