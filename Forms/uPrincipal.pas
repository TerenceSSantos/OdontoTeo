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
      imgLogoOdonto: TImage;
      imglstPrincipal: TImageList;
      imgLogoTitulo: TImage;
      lblDataHora: TLabel;
      pnlCorpoPrincipal: TBCPanel;
      pnlTitulo: TBCPanel;
      spkbtnCadPacientes: TSpkLargeButton;
      spkbtnCadDentistas: TSpkLargeButton;
      spkpaneRelatorios: TSpkPane;
      spkpaneCadastros: TSpkPane;
      spktabSobre: TSpkTab;
      spktabCadastros: TSpkTab;
      spktabRelatorios: TSpkTab;
      spkbarPrincipal: TSpkToolbar;
      Timer1: TTimer;
      procedure btnMinimizarClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure spkbarPrincipalTabChanging(Sender: TObject; OldIndex, NewIndex: integer; var Allowed: boolean);
      procedure spkbtnCadPacientesClick(Sender: TObject);
      procedure Timer1Timer(Sender: TObject);
   private
       var oldTab: integer;
   public

   end;

var
   frmPrincipal: TfrmPrincipal;

implementation

uses
   uCadPacientes, uSobre, RxVersInfo;

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
   rxVersao : TRxVersionInfo;
begin
   TranslateUnitResourceStrings('LclStrConsts', ExtractFilePath(Application.ExeName ) + 'lclstrconsts.pt_BR.po', 'pt_BR', '');
   try
      rxVersao := TRxVersionInfo.Create(self);
      pnlTitulo.Caption := pnlTitulo.Caption + ' - Versão: ' + rxVersao.ProductVersion;
   finally
      FreeAndNil(rxVersao);
   end;
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

procedure TfrmPrincipal.spkbarPrincipalTabChanging(Sender: TObject; OldIndex, NewIndex: integer; var Allowed: boolean);
begin
   if NewIndex = 2 then
    begin
       try
          frmSobre := TfrmSobre.Create(nil);
          frmSobre.ShowModal;
       finally
          FreeAndNil(frmSobre);
       end;
       Allowed := false;
    end;
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

