unit uLocalizarPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
   DBGrids, Buttons, BCPanel, BCButton;

type

   { TfrmLocalizaPaciente }

   TfrmLocalizaPaciente = class(TForm)
      btnFechar: TBCButton;
      btnLocalizarPaciente: TSpeedButton;
      dbgridLocalizarPaciente: TDBGrid;
      edtLocalizarPaciente: TEdit;
      gbLocalizarPaciente: TGroupBox;
      imgLogoTitulo: TImage;
      lblLocalizarPaciente: TLabel;
      pnlLocalizarPaciente: TBCPanel;
      pnlTitulo: TBCPanel;
      procedure btnFecharClick(Sender: TObject);
   private

   public

   end;

var
   frmLocalizaPaciente: TfrmLocalizaPaciente;

implementation

{$R *.lfm}

{ TfrmLocalizaPaciente }

procedure TfrmLocalizaPaciente.btnFecharClick(Sender: TObject);
begin
   Close;
end;

end.

