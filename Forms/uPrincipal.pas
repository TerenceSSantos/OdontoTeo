unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons, BCPanel, BCButton, SpkToolbar,
   spkt_Tab, spkt_Pane, spkt_Buttons, Translations;

type

   { TfrmPrincipal }

   TfrmPrincipal = class(TForm)
      btnFecharSistema: TBitBtn;
      btnFechar: TBCButton;
      btnMinimizar: TBCButton;
      imglstPrincipal: TImageList;
      imgLogoTitulo: TImage;
      imgLogoOdonto: TImage;
      lblDataHora: TLabel;
      pnlTitulo: TBCPanel;
      pnlCorpoPrincipal: TBCPanel;
      spkbtnCadPacientes: TSpkLargeButton;
      spkbtnCadDentistas: TSpkLargeButton;
      spkpaneRelatorios: TSpkPane;
      spkpaneCadastros: TSpkPane;
      spktabCadastros: TSpkTab;
      spktabRelatorios: TSpkTab;
      spkbarPrincipal: TSpkToolbar;
      Timer1: TTimer;
      procedure btnMinimizarClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure spkbtnCadPacientesClick(Sender: TObject);
      procedure Timer1Timer(Sender: TObject);
   private

   public

   end;

var
   frmPrincipal: TfrmPrincipal;

implementation

uses
   uCadPacientes;

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   TranslateUnitResourceStrings('LclStrConsts', ExtractFilePath(Application.ExeName ) + 'lclstrconsts.pt_BR.po', 'pt_BR', '');
end;

procedure TfrmPrincipal.btnMinimizarClick(Sender: TObject);
begin
   Application.Minimize;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   Top := Screen.WorkAreaTop;
   Left := Screen.WorkAreaLeft;
   Height := Screen.WorkAreaHeight;
   Width := Screen.WorkAreaWidth;

   imgLogoOdonto.Left := (pnlCorpoPrincipal.Width div 2) - (imgLogoOdonto.Width div 2);
   imgLogoOdonto.Top := (pnlCorpoPrincipal.Height div 2) - (imgLogoOdonto.Height div 2);
end;

procedure TfrmPrincipal.spkbtnCadPacientesClick(Sender: TObject);
begin
   try
      frmCadPaciente := TfrmCadPaciente.Create(Self);
      frmCadPaciente.ShowModal;
   finally
      FreeAndNil(frmCadPaciente);
   end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
   lblDataHora.Caption := FormatDateTime('dd" de "mmmm" de "yyyy" - "hh":"MM"'{:"ss'}, Now);
end;

end.

