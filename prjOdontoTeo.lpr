program prjOdontoTeo;

{$mode objfpc}{$H+}

uses
   {$IFDEF UNIX}{$IFDEF UseCThreads}
   cthreads,
   {$ENDIF}{$ENDIF}
   Interfaces, // this includes the LCL widgetset
   Forms, notlcldesigner, datetimectrls, zcomponent, rxnew, uPrincipal,
   uDMConexao, uCadPacientes, uLocalizarPaciente, uDMCadPaciente
   { you can add units after this };

{$R *.res}

begin
   RequireDerivedFormResource := True;
   Application.Title := 'OdontoTeo - Sistema Odontológico';
   Application.Scaled := True;
   Application.Initialize;
   Application.CreateForm(TdmConexao, dmConexao);
   Application.CreateForm(TfrmPrincipal, frmPrincipal);
   Application.CreateForm(TdmTblPaciente, dmTblPaciente);
   Application.Run;
end.

