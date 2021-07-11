unit uMarcarSimNao;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons, StdCtrls, BCPanel, ExCheckCtrls, uCadPacientes;

type

   { TfrmSimNao }

   TfrmSimNao = class(TForm)
      btnCancelar: TBitBtn;
      btnMarcar: TBitBtn;
      imgLogoTitulo: TImage;
      imglstSimNao: TImageList;
      lblMensagem: TLabel;
      lblMensagem1: TLabel;
      pnlFrmSimNao: TBCPanel;
      pnlTitulo: TBCPanel;
      rgexSimNao: TRadioGroupEx;
      procedure btnCancelarClick(Sender: TObject);
      procedure btnMarcarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
   private

   public

   end;

var
   frmSimNao: TfrmSimNao;

implementation

{$R *.lfm}

{ TfrmSimNao }

procedure TfrmSimNao.btnMarcarClick(Sender: TObject);
var
   i : integer;
begin
   if frmCadPaciente.pcCadPaciente.ActivePageIndex = 6 then
   begin
     for i := 0 to frmCadPaciente.pnlSinaisSintomas.ControlCount - 1 do
     begin
        if frmCadPaciente.pnlSinaisSintomas.Controls[i] is TRadioGroupEx then
        begin
           TRadioGroupEx(frmCadPaciente.pnlSinaisSintomas.Controls[i]).ItemIndex := rgexSimNao.ItemIndex;
        end;
     end;
   end;

   if frmCadPaciente.pcCadPaciente.ActivePageIndex = 7 then
   begin
     for i := 0 to frmCadPaciente.pnlEnfermidades.ControlCount - 1 do
     begin
        if frmCadPaciente.pnlEnfermidades.Controls[i] is TRadioGroupEx then
        begin
           TRadioGroupEx(frmCadPaciente.pnlEnfermidades.Controls[i]).ItemIndex := rgexSimNao.ItemIndex;
        end;
     end;
   end;
   frmSimNao.Close;
end;

procedure TfrmSimNao.FormShow(Sender: TObject);
begin
   frmSimNao.Top := frmCadPaciente.Top + frmCadPaciente.pnlTitulo.Height + 15;
   frmSimNao.Left := frmCadPaciente.Left + (frmCadPaciente.Width div 4);
end;

procedure TfrmSimNao.btnCancelarClick(Sender: TObject);
begin
   close;
end;

end.

