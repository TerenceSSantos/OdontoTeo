unit uLocalizarPaciente;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, DBGrids, Buttons, BCPanel, BCButton, uClassPaciente;

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
      rgAtivosInativos: TRadioGroup;
      procedure btnFecharClick(Sender: TObject);
      procedure btnLocalizarPacienteClick(Sender: TObject);
      procedure edtLocalizarPacienteChange(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure rgAtivosInativosSelectionChanged(Sender: TObject);
   private
      procedure LocalizarPaciente;
      function AtivosInativos : string;

   public

   end;

var
   frmLocalizaPaciente: TfrmLocalizaPaciente;
   capitura : boolean = false;
   px, py : integer;
//   formulario : TForm;


implementation

uses
   uDMCadPaciente, uClassControlePaciente;


{$R *.lfm}

{ TfrmLocalizaPaciente }

procedure TfrmLocalizaPaciente.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmLocalizaPaciente.btnLocalizarPacienteClick(Sender: TObject);
var
   objLocPaciente : TPaciente;
begin
   try
      objLocPaciente := TPaciente.Create;
      objLocPaciente := dmCadPaciente.EnviaDadosBasicos(objLocPaciente);
      TControlePaciente.EnviaDadosBasicos(objLocPaciente);
   finally
      FreeAndNil(objLocPaciente);
   end;
   Close;
end;

procedure TfrmLocalizaPaciente.edtLocalizarPacienteChange(Sender: TObject);
begin
   LocalizarPaciente;
end;

procedure TfrmLocalizaPaciente.FormShow(Sender: TObject);
begin
   edtLocalizarPaciente.SetFocus;
   LocalizarPaciente;
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

procedure TfrmLocalizaPaciente.rgAtivosInativosSelectionChanged(Sender: TObject);
begin
   LocalizarPaciente;
end;

procedure TfrmLocalizaPaciente.LocalizarPaciente;
begin
   dmCadPaciente.ativo := AtivosInativos;     //** FUNÇÃO RETORNANDO SE TRAZ OS ATIVOS, INATIVOS OU TODOS PARA VARIAVEL DE dmCadPaciente.
   dmCadPaciente.nome := edtLocalizarPaciente.Text;

   dmCadPaciente.MontaSelect;

   if dmCadPaciente.qryTblPaciente.IsEmpty then   //** DESABILITAR O BOTÃO EM CASO DE DATASET VAZIO OU HABILITAR EM CASO DE DADOS
      btnLocalizarPaciente.Enabled := false
   else
      btnLocalizarPaciente.Enabled := true;

end;

function TfrmLocalizaPaciente.AtivosInativos: string;
begin
   case rgAtivosInativos.ItemIndex of
      0 : result := 'A';
      1 : result := 'I';           {* RETORNA A=ATIVOS I=INATIVOS T=TODOS *}
      else
         result := 'T';
   end;
end;



end.

