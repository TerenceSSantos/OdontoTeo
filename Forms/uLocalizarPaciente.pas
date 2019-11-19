unit uLocalizarPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, DBGrids, Buttons, BCPanel, BCButton;

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
      procedure btnLocalizarPacienteClick(Sender: TObject);
      procedure edtLocalizarPacienteChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   private

   public
      procedure QuemChamou(nomeForm: TForm);
   end;

var
   frmLocalizaPaciente: TfrmLocalizaPaciente;
   capitura : boolean = false;
   px, py : integer;
   formulario : TForm;


implementation

uses
   uDMCadPaciente, uClassPaciente;

var
   objFrmLocalizaPac : TPaciente;

{$R *.lfm}

{ TfrmLocalizaPaciente }

procedure TfrmLocalizaPaciente.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmLocalizaPaciente.btnLocalizarPacienteClick(Sender: TObject);
var
   dados : TDataSet;
begin
   dados := dmCadPaciente.Pacientes(dbgridLocalizarPaciente.DataSource.DataSet.FieldByName('id_paciente').AsInteger);
   objFrmLocalizaPac.PreencheDadosPaciente(dados, formulario);
   frmLocalizaPaciente.Close;
end;

procedure TfrmLocalizaPaciente.edtLocalizarPacienteChange(Sender: TObject);
begin
   if Trim(edtLocalizarPaciente.Text) = EmptyStr then
      dmCadPaciente.Pacientes
   else
      dmCadPaciente.Pacientes(edtLocalizarPaciente.Text);
end;

procedure TfrmLocalizaPaciente.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   FreeAndNil(objFrmLocalizaPac);
end;

procedure TfrmLocalizaPaciente.FormCreate(Sender: TObject);
begin
   objFrmLocalizaPac := TPaciente.Create;
end;

procedure TfrmLocalizaPaciente.FormShow(Sender: TObject);
begin
   dmCadPaciente.Pacientes;
end;

procedure TfrmLocalizaPaciente.pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   capitura := true;
   if capitura then
   begin
      px := X;
      py := Y;
   end;
end;

procedure TfrmLocalizaPaciente.pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   if capitura then
   begin
      Left := (Left + X) - px;
      Top := (Top + Y) - py;
   end;
end;

procedure TfrmLocalizaPaciente.pnlTituloMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   capitura := false;
end;

procedure TfrmLocalizaPaciente.QuemChamou(nomeForm: TForm);
begin
   formulario := nomeForm;
end;

end.

