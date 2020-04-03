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
      dsFrmLocalizaPacientes: TDataSource;
      edtLocalizarPaciente: TEdit;
      gbLocalizarPaciente: TGroupBox;
      imgLogoTitulo: TImage;
      lblLocalizarPaciente: TLabel;
      pnlLocalizarPaciente: TBCPanel;
      pnlTitulo: TBCPanel;
      procedure btnFecharClick(Sender: TObject);
      procedure btnLocalizarPacienteClick(Sender: TObject);
      procedure edtLocalizarPacienteChange(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   private


   public
      tblDataSetDBasico : TDataSet;

      procedure RecebeDataSet(nomeDataSet: TDataSet);
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
//var
//   dados : TDataSet;
begin
      { TODO : Continuar o procedimento do que fazer depois de selecionado o paciente. }
   objFrmLocalizaPac := TPaciente.Create;
   with dsFrmLocalizaPacientes.DataSet do
   begin
//      objFrmLocalizaPac.idPaciente := FieldByName('ID_PACIENTE').AsInteger;
      objFrmLocalizaPac.nomePaciente := FieldByName('NOME_PACIENTE').AsString;
      objFrmLocalizaPac.nomePai := FieldByName('NOME_PAI').AsString;
      objFrmLocalizaPac.nomeMae := FieldByName('NOME_MAE').AsString;
      objFrmLocalizaPac.estadoCivil := FieldByName('ESTADO_CIVIL').AsString;
      objFrmLocalizaPac.nomeConjuge := FieldByName('NOME_CONJUGE').AsString;
      objFrmLocalizaPac.sexo := FieldByName('SEXO').AsString;
      objFrmLocalizaPac.dataNascimento := FieldByName('DATA_NASCIMENTO').AsDateTime;
      objFrmLocalizaPac.naturalidade := FieldByName('NATURALIDADE').AsString;
      objFrmLocalizaPac.ufNascimento := FieldByName('UF_NASCIMENTO').AsString;
      objFrmLocalizaPac.nacionalidade := FieldByName('NACIONALIDADE').AsString;
   end;
   ShowMessage(objFrmLocalizaPac.nomePaciente);

   frmLocalizaPaciente.Close;
end;

procedure TfrmLocalizaPaciente.edtLocalizarPacienteChange(Sender: TObject);
var
   nomePaciente : string;
begin
   nomePaciente := Trim(edtLocalizarPaciente.Text);
   if nomePaciente.Length < 3 then
      dmCadPaciente.Pacientes
   else
      dmCadPaciente.Pacientes(nomePaciente);

   if dmCadPaciente.qryTblPaciente.IsEmpty then
      btnLocalizarPaciente.Enabled := false
   else
      btnLocalizarPaciente.Enabled := true;

end;

procedure TfrmLocalizaPaciente.FormShow(Sender: TObject);
begin
//   RecebeDataSet();
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

procedure TfrmLocalizaPaciente.RecebeDataSet(nomeDataSet: TDataSet);
begin
    dsFrmLocalizaPacientes.DataSet := nomeDataSet;
    tblDataSetDBasico := nomeDataSet;
end;


end.

