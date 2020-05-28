unit uClassControlePaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uClassPaciente, uClassResponsavelPaciente, uClassSinaisSintomas, uDMCadPaciente, uLocalizarPaciente,
   uClassEnfermidades, uClassEndereco, uClassContatos, uClassAnamnese;

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
        function SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;

        function InclusaoEndereco(objEndereco: TEndereco): boolean;

        function InclusaoContatos(objContatos: TContatos): boolean;

        function InclusaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): boolean;
        function InclusaoEnfermidades(objEnfermidades: TEnfermidades): boolean;

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
   result := dmCadPaciente.ApagarCadastroBasico(codigo);
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

function TControlePaciente.SelectResponsavel(idTblPaciente: integer; objResponsavel: TResponsavelPaciente): TResponsavelPaciente;
begin
   dmCadPaciente.SelectResponsavel(idTblPaciente, objResponsavel);
end;

function TControlePaciente.InclusaoEndereco(objEndereco: TEndereco): boolean;
begin
   result := dmCadPaciente.InclusaoEndereco(objEndereco);
end;

function TControlePaciente.InclusaoContatos(objContatos: TContatos): boolean;
begin
   result := dmCadPaciente.InclusaoContatos(objContatos);
end;

function TControlePaciente.InclusaoSinaisSintomas(objSinaisSintomas: TSinaisSintomas): boolean;
begin
   result := dmCadPaciente.InclusaoSinaisSintomas(objSinaisSintomas);
end;

function TControlePaciente.InclusaoEnfermidades(objEnfermidades: TEnfermidades): boolean;
begin
   result := dmCadPaciente.InclusaoEnfermidades(objEnfermidades);
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

