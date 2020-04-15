unit uClassControlePaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uClassPaciente, uDMCadPaciente, Forms, uLocalizarPaciente, dialogs;

type

   { TControlePaciente }

   TControlePaciente = class
     private
        //FQualForm: TfrmCadPaciente;
        //procedure SetQualForm(AValue: TfrmCadPaciente);

     public
        //property QualForm : TfrmCadPaciente read FQualForm write SetQualForm;

//        procedure QualFormRetornar(tipoForm: TForm);
        procedure ChamaLocalizar; //(frmLocalizaPaciente: TfrmLocalizaPaciente);

        function InclusaoDadosBasicos(objPaciente: TPaciente): integer;
        function EdicaoDadosBasicos(objPaciente: TPaciente): boolean;
        function TblPacienteVazia : boolean;
        class procedure EnviaDadosBasicos(objPaciente: TPaciente);

        constructor Create;
        //constructor Create(formulario: TfrmCadPaciente);
        destructor Destroy; override;
     end;

var
   controlePaciente : TControlePaciente;

implementation

uses
   uCadPacientes;

{ TControlePaciente }



//procedure TControlePaciente.QualFormRetornar(tipoForm: TForm);  {** PARA QUAL FORMULARIO RETORNAR O RESULTADO **}
//begin
////   ShowMessage(tipoForm.Name);
//   frmRetorno := TForm.Create(nil);
//   frmRetorno := tipoForm;
//end;

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

function TControlePaciente.TblPacienteVazia: boolean;
begin
   result := dmCadPaciente.TblPacienteVazia;
end;

class procedure TControlePaciente.EnviaDadosBasicos(objPaciente: TPaciente);
begin
   frmCadPaciente.PreencheDadosBasicos(objPaciente);
end;

constructor TControlePaciente.Create;
begin
   inherited;
end;

//constructor TControlePaciente.Create(formulario: TfrmCadPaciente);
//begin
////   inherited;
//   //QualForm := formulario;
//end;

destructor TControlePaciente.Destroy;
begin
   inherited Destroy;
end;

end.

