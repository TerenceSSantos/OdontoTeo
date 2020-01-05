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


        //constructor Create;
        //destructor Destroy; override;
     end;

var
   controlePaciente : TControlePaciente;

implementation

{ TControlePaciente }

procedure TControlePaciente.QualFormRetornar(tipoForm: TForm);  {** PARA QUAL FORMULARIO RETORNAR O RESULTADO **}
begin
//   ShowMessage(tipoForm.Name);
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

end.

