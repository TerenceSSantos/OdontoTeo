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
        procedure ReceberDataSet;
        procedure SelectTodos;

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
      controlePaciente.SelectTodos;
      frmLocalizaPaciente.ShowModal;
   finally
//      FreeAndNil(frmLocalizaPaciente);
   end;
end;

procedure TControlePaciente.ReceberDataSet;
var
   dados : TDataSet;
begin
//   dados := dmCadPaciente.Pacientes; ShowMessage(dados.FieldByName('nome_paciente').AsString);
end;

procedure TControlePaciente.SelectTodos;
begin
   frmLocalizaPaciente.RecebeDataSource(dmCadPaciente.Pacientes);
end;

end.

