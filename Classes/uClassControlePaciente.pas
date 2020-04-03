unit uClassControlePaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, uClassPaciente, uDMCadPaciente, Forms, uLocalizarPaciente, dialogs;

type

   { TControlePaciente }

   TControlePaciente = class
     private

     public
        procedure QualFormRetornar(tipoForm: TForm);
        procedure ChamaLocalizar(frmLocalizaPaciente: TfrmLocalizaPaciente);
        class procedure SelectTodos;
        class procedure DadosBasicosPaciente;
        class procedure RecebeDados(objDadosBasicos: TPaciente);
        function GravarDadosBasicos(objPaciente: TPaciente): integer;

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
   ShowMessage(tipoForm.Name);
   frmRetorno := TForm.Create(nil);
   frmRetorno := tipoForm;
end;

procedure TControlePaciente.ChamaLocalizar(frmLocalizaPaciente: TfrmLocalizaPaciente);
begin                                                {** CHAMAR A TELA DE PESQUISA DE PACIENTES **}
   try
      frmLocalizaPaciente := TfrmLocalizaPaciente.Create(nil);
//      controlePaciente.SelectTodos;

      dmCadPaciente.Pacientes;
      frmLocalizaPaciente.RecebeDataSet(dmCadPaciente.qryTblPaciente);
      frmLocalizaPaciente.ShowModal;
   finally
//      FreeAndNil(frmLocalizaPaciente);
   end;
end;

class procedure TControlePaciente.SelectTodos;
begin
   frmLocalizaPaciente.RecebeDataSet(dmCadPaciente.qryTblPaciente);
end;

class procedure TControlePaciente.DadosBasicosPaciente;
var
   objPaciente : TPaciente;
begin
   objPaciente := TPaciente.Create;
   objPaciente.ConectaDadosBasicos;
end;

class procedure TControlePaciente.RecebeDados(objDadosBasicos: TPaciente);
begin
//   frmRetorno.PreencheDadosBasicos;
end;

function TControlePaciente.GravarDadosBasicos(objPaciente: TPaciente): integer;
begin
   result :=  dmCadPaciente.GravarDadosBasicos(objPaciente);
end;

end.

