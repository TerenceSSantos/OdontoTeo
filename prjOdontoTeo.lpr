program prjOdontoTeo;

{$mode objfpc}{$H+}

uses
   {$IFDEF UNIX}{$IFDEF UseCThreads}
   cthreads,
   {$ENDIF}{$ENDIF}
   Interfaces, // this includes the LCL widgetset
   Forms, notlcldesigner, datetimectrls, runtimetypeinfocontrols, zcomponent,
   rxnew, uPrincipal, uDMConexao, uCadPacientes, uLocalizarPaciente,
   uDMCadPaciente, uClassPaciente, uClassControlePaciente,
   uClassResponsavelPaciente, uClassContatos, uClassSinaisSintomas, uSobre,
   uClassEnfermidades, uFrmMensagem, uClassEndereco, uClassAnamnese,
   uClassDadosProfissionais, uDadosBasicos, uResponsavel, uEndereco, uContatos,
   uDadoProfissional, uAnamnese, uSinaisSintomas, uEnfermidades,
   uClassDocumentos, uDocumentos, uMarcarSimNao;

{$R *.res}

begin
   RequireDerivedFormResource := True;
   Application.Title := 'OdontoTeo - Sistema Odontológico';
   Application.Scaled := True;
   Application.Initialize;
   Application.CreateForm(TdmConexao, dmConexao);
   Application.CreateForm(TdmCadPaciente, dmCadPaciente);
   Application.CreateForm(TfrmPrincipal, frmPrincipal);
   Application.Run;
end.

