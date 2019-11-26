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
      function edtLocalizarPacienteChange(Sender: TObject) : string;
      procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   private

   public
      procedure RecebeDataSource(nomeDataSource: TDataSource);
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
//   objFrmLocalizaPac.PreencheDadosPaciente(dados, formulario);
   frmLocalizaPaciente.Close;
end;

function TfrmLocalizaPaciente.edtLocalizarPacienteChange(Sender: TObject): string;
var
   nomePaciente : string;
begin
   if Trim(edtLocalizarPaciente.Text) = EmptyStr then
      nomePaciente := EmptyStr
   else
      nomePaciente := edtLocalizarPaciente.Text;
   result := nomePaciente;
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

procedure TfrmLocalizaPaciente.RecebeDataSource(nomeDataSource: TDataSource);
begin
   dbgridLocalizarPaciente.DataSource := nomeDataSource;
end;





end.

