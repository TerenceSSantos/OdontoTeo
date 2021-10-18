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
      nomeFormQueChamou: string;
      procedure FormQueChamou(nomeForm: string);
   end;

var
   frmLocalizaPaciente: TfrmLocalizaPaciente;
   capitura : boolean = false;
   px, py : integer;
//   formulario : TForm;


implementation

uses
   uDMCadPaciente, uClassControlePaciente, uCadPacientes, uDMCadDentista, uFrmCadDentistas;


{$R *.lfm}

{ TfrmLocalizaPaciente }

procedure TfrmLocalizaPaciente.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmLocalizaPaciente.btnLocalizarPacienteClick(Sender: TObject);
//var
//   objLocPaciente : TPaciente;
begin
   if (nomeFormQueChamou = 'frmCadPaciente') then
      frmCadPaciente.SelectPaciente(dmCadPaciente.qryTblPaciente.FieldByName('ID_PACIENTE').AsInteger);
   Close;

   //try
   //   objLocPaciente := TPaciente.Create;
   //   objLocPaciente := dmCadPaciente.EnviaDadosBasicos(objLocPaciente);
   //   TControlePaciente.EnviaDadosBasicos(objLocPaciente);
   //finally
   //   FreeAndNil(objLocPaciente);
   //end;

end;

procedure TfrmLocalizaPaciente.edtLocalizarPacienteChange(Sender: TObject);
begin
   LocalizarPaciente;
end;

procedure TfrmLocalizaPaciente.FormShow(Sender: TObject);
begin
   if nomeFormQueChamou = 'frmCadDentistas' then
   begin;
      pnlTitulo.Caption := 'Localizar Dentista';
      rgAtivosInativos.Caption := 'Dentistas Ativos - Inativos - Todos';
      lblLocalizarPaciente.Caption := 'Localizar Dentista (procura a partir de parte do nome)';
      btnLocalizarPaciente.Caption := 'Dentista selecionado';
      dsFrmLocalizaPacientes.DataSet := dmCadDentista.qryDentista;
      dbgridLocalizarPaciente.Columns[0].Title.Caption := 'Código';
      dbgridLocalizarPaciente.Columns[1].Title.Caption := 'Nome Dentista';
      dbgridLocalizarPaciente.Columns[0].FieldName := 'ID_DENTISTA';
      dbgridLocalizarPaciente.Columns[1].FieldName := 'NOME_DENTISTA';

      if dmCadDentista.TabelaVazia then
       begin
         btnLocalizarPaciente.Enabled := false;
         edtLocalizarPaciente.Enabled := false;
       end
       else
       begin
         btnLocalizarPaciente.Enabled := true;
         edtLocalizarPaciente.Enabled := true;
         rgAtivosInativos.Enabled := true;
         edtLocalizarPaciente.SetFocus;
         LocalizarPaciente;
       end;
   end
   else
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
   if nomeFormQueChamou = 'frmCadDentistas' then
    begin
      dmCadDentista.nome := edtLocalizarPaciente.Text;
      dmCadDentista.ativo := AtivosInativos;
      dmCadDentista.MontaSelect;
      if dmCadDentista.qryDentista.IsEmpty then
       BEGIN
         btnLocalizarPaciente.Enabled := false;
         edtLocalizarPaciente.Enabled := false;
       end
      else
       begin
         btnLocalizarPaciente.Enabled := true;
         edtLocalizarPaciente.Enabled := true;
         rgAtivosInativos.Enabled := true;
       end;
    end
   else if nomeFormQueChamou = 'frmCadPaciente' then
    begin
      dmCadPaciente.nome := edtLocalizarPaciente.Text;;
      dmCadPaciente.ativo := AtivosInativos;     // ** FUNÇÃO RETORNANDO SE TRAZ OS ATIVOS, INATIVOS OU TODOS PARA VARIAVEL DE dmCadPaciente.
      dmCadPaciente.MontaSelect;
      if dmCadPaciente.qryTblPaciente.IsEmpty then   // ** DESABILITAR O BOTÃO EM CASO DE DATASET VAZIO OU HABILITAR EM CASO DE DADOS
         btnLocalizarPaciente.Enabled := false
      else
         btnLocalizarPaciente.Enabled := true;
    end;
end;

function TfrmLocalizaPaciente.AtivosInativos: string;
begin
   case rgAtivosInativos.ItemIndex of
      0 : result := 'A';
      1 : result := 'I';           { RETORNA A=ATIVOS I=INATIVOS T=TODOS }
      else
         result := 'T';
   end;
end;

procedure TfrmLocalizaPaciente.FormQueChamou(nomeForm: string);
begin
   nomeFormQueChamou := nomeForm;       { TODO : Alterar a forma do Form que chamou para o create. }
   if nomeForm = 'frmCadPaciente' then
      dsFrmLocalizaPacientes.DataSet := dmCadPaciente.qryTblPaciente
   else if nomeForm = 'frmCadDentistas' then
      dsFrmLocalizaPacientes.DataSet := dmCadDentista.qryDentista;
end;



end.

