unit uFrmCadDentistas;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
   ComCtrls, StdCtrls, MaskEdit, Spin, BCPanel, BCButton, DateTimePicker,
   ExCheckCtrls;

type

   { TfrmCadDentistas }

   TfrmCadDentistas = class(TForm)
      btnAlteraCadastro: TBitBtn;
      btnApagaCadastro: TBitBtn;
      btnCancelaCadastro: TBitBtn;
      btnFechar: TBCButton;
      btnGravaCadastro: TBitBtn;
      btnNovoCadastro: TBitBtn;
      btnProcuraDentista: TSpeedButton;
      btnSaiCadastro: TBitBtn;
      bvContatos: TBevel;
      bvDadosBasicosDentista: TBevel;
      bvEndereco: TBevel;
      cboxOperadoraCasa: TComboBox;
      cboxOperadoraCel1: TComboBox;
      cboxOperadoraCel2: TComboBox;
      cboxOperadoraTelRecado: TComboBox;
      cboxOperadoraTelTrab: TComboBox;
      cboxUFCasa: TComboBox;
      chkboxAtivo: TCheckBox;
      dtpkNascimento: TDateTimePicker;
      edtBairro: TEdit;
      edtCidade: TEdit;
      edtCodContatos: TEdit;
      edtCodDocDentista: TEdit;
      edtCodEndDentista: TEdit;
      edtCodDentista: TEdit;
      edtComplemento: TEdit;
      edtDDDCasa: TEdit;
      edtDDDCel1: TEdit;
      edtDDDCel2: TEdit;
      edtDDDTelRecado: TEdit;
      edtDDDTelTrab: TEdit;
      edtEmail: TEdit;
      edtIdentidadeDentista: TEdit;
      edtLogradouro: TEdit;
      edtNomeDentista: TEdit;
      edtNumEndereco: TEdit;
      edtOrgaoExpedDentista: TEdit;
      edtPessoaRecado: TEdit;
      imgLogoTitulo: TImage;
      lblBairro: TLabel;
      lblCel1: TLabel;
      lblCelular2: TLabel;
      lblCEPCasa: TLabel;
      lblCidade: TLabel;
      lblCodigoDentista: TLabel;
      lblCodDentista: TLabel;
      lblComplemento: TLabel;
      lblCPFDentista: TLabel;
      lblDDDCasa: TLabel;
      lblDDDCel1: TLabel;
      lblDDDCel2: TLabel;
      lblDDDTelRecado: TLabel;
      lblDDDTelTrab: TLabel;
      lblDtNascimento: TLabel;
      lblEmail: TLabel;
      lblIdentidadeDentista: TLabel;
      lblLogradouro: TLabel;
      lblNomeDentista: TLabel;
      lblNumEndereco: TLabel;
      lblOperadoraCasa: TLabel;
      lblOperadoraCel: TLabel;
      lblOperadoraTelTrab: TLabel;
      lblOperadorCel2: TLabel;
      lblOperadorTelRecado: TLabel;
      lblOrgaoExpedDentista: TLabel;
      lblDentista: TLabel;
      lblParaDataVazia: TLabel;
      lblPessoaRecado: TLabel;
      lblSexo: TLabel;
      lblTelCasa: TLabel;
      lblTelRecado: TLabel;
      lblTelTrab: TLabel;
      lblUFCasa: TLabel;
      miglstCadDentistas: TImageList;
      mskedtCel1: TMaskEdit;
      mskedtCel2: TMaskEdit;
      mskedtCEPCasa: TMaskEdit;
      mskedtCPFDentista: TMaskEdit;
      mskedtTelCasa: TMaskEdit;
      mskedtTelRecado: TMaskEdit;
      mskedtTelTrab: TMaskEdit;
      pcCadDentista: TPageControl;
      pnlBotoes: TBCPanel;
      pnlCadDentista: TBCPanel;
      pnlCodigoNomeDentista: TBCPanel;
      pnlContatos: TBCPanel;
      pnlDadosBasicosDentista: TBCPanel;
      pnlEndereco: TBCPanel;
      pnlTitulo: TBCPanel;
      rgexSexo: TRadioGroupEx;
      tabContatos: TTabSheet;
      tabDadosBasicosDentista: TTabSheet;
      tabEndereco: TTabSheet;
      procedure btnFecharClick(Sender: TObject);
      procedure btnProcuraDentistaClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
      procedure pnlTituloMouseUp(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
   private

   public

   end;

var
   frmCadDentistas: TfrmCadDentistas;
   capitura : boolean = false;
   px, py : integer;

implementation

uses
   uLocalizarPaciente;

{$R *.lfm}

{ TfrmCadDentistas }

procedure TfrmCadDentistas.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadDentistas.btnProcuraDentistaClick(Sender: TObject);
var
   frmLocaliza : TfrmLocalizaPaciente;
begin
   try
      frmLocaliza := TfrmLocalizaPaciente.Create(nil);
//      frmLocaliza.nomeFormQueChamou := self.Name;
      frmLocaliza.FormQueChamou(Self.Name);
      frmLocaliza.ShowModal;
   finally
      FreeAndNil(frmLocaliza);
   end;
end;

procedure TfrmCadDentistas.FormCreate(Sender: TObject);
begin
   pcCadDentista.ActivePageIndex := 0;
end;

procedure TfrmCadDentistas.pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   capitura := true;
   if capitura then
   begin
      px := X;
      py := Y;
   end;
end;

procedure TfrmCadDentistas.pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   if capitura then
   begin
      Left := (Left + X) - px;
      Top := (Top + Y) - py;
   end;
end;

procedure TfrmCadDentistas.pnlTituloMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   capitura := false;
end;

end.

