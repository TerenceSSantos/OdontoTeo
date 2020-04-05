unit uClassControlePaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, uClassPaciente, uDMCadPaciente, Forms, uLocalizarPaciente, dialogs;

type

   { TControlePaciente }

   TControlePaciente = class
     private

     public
        procedure QualFormRetornar(tipoForm: TForm);
        procedure ChamaLocalizar(frmLocalizaPaciente: TfrmLocalizaPaciente);

        function GravarDadosBasicos(objPaciente: TPaciente): integer;
        function TblPacienteVazia : boolean;

        //constructor Create;
        //destructor Destroy; override;
     end;

var
   controlePaciente : TControlePaciente;
   frmRetorno : TForm;

implementation

{ TControlePaciente }

procedure TControlePaciente.QualFormRetornar(tipoForm: TForm);  {** PARA QUAL FORMULARIO RETORNAR O RESULTADO **}
begin
//   ShowMessage(tipoForm.Name);
   frmRetorno := TForm.Create(nil);
   frmRetorno := tipoForm;
end;

procedure TControlePaciente.ChamaLocalizar(frmLocalizaPaciente: TfrmLocalizaPaciente);
begin                                                {** CHAMAR A TELA DE PESQUISA DE PACIENTES **}
   try
      frmLocalizaPaciente := TfrmLocalizaPaciente.Create(nil);
      frmLocalizaPaciente.ShowModal;
   finally
      FreeAndNil(frmLocalizaPaciente);
   end;
end;



function TControlePaciente.GravarDadosBasicos(objPaciente: TPaciente): integer;
begin
   result :=  dmCadPaciente.GravarDadosBasicos(objPaciente);
end;

function TControlePaciente.TblPacienteVazia: boolean;
begin
   result := dmCadPaciente.TblPacienteVazia;
end;

end.

