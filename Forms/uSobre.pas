unit uSobre;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, BCPanel, BCButton, RxVersInfo, LCLVersion;

type

   { TfrmSobre }

   TfrmSobre = class(TForm)
      btnFechar: TBCButton;
      imgLogoTitulo: TImage;
      lblProductVersion: TLabel;
      lblPoeVersao: TLabel;
      lblEXECaminho: TLabel;
      lblVersao: TLabel;
      lblVersao1: TLabel;
      lblVersaoProduto: TLabel;
      lblVersaoLCL: TLabel;
      lblLCL: TLabel;
      pnlCorpoPrincipal: TBCPanel;
      pnlTitulo: TBCPanel;
      rxVersao: TRxVersionInfo;
      procedure btnFecharClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure pnlTituloMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   private

   public

   end;

var
   frmSobre: TfrmSobre;
   capitura : boolean = false;
   px, py : integer;

implementation

{$R *.lfm}

{ TfrmSobre }

procedure TfrmSobre.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
   lblProductVersion.Caption := rxVersao.ProductVersion;
   lblPoeVersao.Caption := lblPoeVersao.Caption + rxVersao.FileVersion;
   lblLCL.Caption := lcl_version;
   lblEXECaminho.Caption := rxVersao.FileName;
end;

procedure TfrmSobre.pnlTituloMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   capitura := true;
   if capitura then
   begin
      px := X;
      py := Y;
   end;
end;

procedure TfrmSobre.pnlTituloMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   if capitura then
   begin
      Left := (Left + X) - px;
      Top := (Top + Y) - py;
   end;
end;

procedure TfrmSobre.pnlTituloMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   capitura := false;
end;

end.

