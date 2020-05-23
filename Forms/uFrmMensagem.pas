unit uFrmMensagem;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls, StdCtrls, BCPanel;

type

   TIcone = (tiErro, tiAviso, tiDuvida, tiInformacao);

   { TfrmMensagem }

   TfrmMensagem = class(TForm)
      btnOk: TBitBtn;
      btnCancelar: TBitBtn;
      iconeAviso: TImage;
      iconeDuvida: TImage;
      iconeInformacao: TImage;
      iconeErro: TImage;
      imgLogoTitulo: TImage;
      imglstFrmMensagem: TImageList;
      lblMensagem: TLabel;
      pnlFrmMensagem: TBCPanel;
      pnlTitulo: TBCPanel;
      procedure btnCancelarClick(Sender: TObject);
      procedure btnOkClick(Sender: TObject);
      procedure lblMensagemResize(Sender: TObject);
   private

   public
      resultadoBtn: TModalResult;

      procedure InfoFormMensagem(titulo: string; icone: TIcone; mensagem: string);
   end;

var
   frmMensagem: TfrmMensagem;

implementation

{$R *.lfm}

{ TfrmMensagem }

procedure TfrmMensagem.btnCancelarClick(Sender: TObject);
begin
   resultadoBtn := mrNo;
end;

procedure TfrmMensagem.btnOkClick(Sender: TObject);
begin
   resultadoBtn := mrOK;
end;

procedure TfrmMensagem.lblMensagemResize(Sender: TObject);
begin
     if lblMensagem.Height > 70 then
       Self.Height := Self.Height + (lblMensagem.Height - 70);
end;

procedure TfrmMensagem.InfoFormMensagem(titulo: string; icone: TIcone; mensagem: string);
begin
   case icone of
      tiErro: begin
                 iconeErro.Visible := true;
                 btnOk.Left := 236;
                 btnCancelar.Visible := false;
                 btnOk.Caption := 'OK';
              end;
      tiAviso: begin
                  iconeAviso.Visible := true;
                  btnOk.Left := 236;
                  btnCancelar.Visible := false;
                  btnOk.Caption := 'OK';
               end;
      tiDuvida : begin
                    iconeDuvida.Visible := true;
                    btnOk.Left := 160;
                    btnCancelar.Visible := true;
                    btnOk.Caption := 'Sim';
                    btnCancelar.Caption := 'Não';
                 end;
      tiInformacao : begin
                        iconeInformacao.Visible := true;
                        btnOk.Left := 236;
                        btnCancelar.Visible := false;
                        btnOk.Caption := 'OK';
                     end;
   end;
   lblMensagem.Caption := mensagem;
   pnlTitulo.Caption := titulo;
   Self.ShowModal;
end;

end.

