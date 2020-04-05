unit uDMConexao;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, ZConnection, Forms, ZAbstractConnection;

type

   { TdmConexao }

   TdmConexao = class(TDataModule)
      zConexao: TZConnection;
      procedure zConexaoBeforeConnect(Sender: TObject);
      procedure zConexaoLogin(Sender: TObject; var Username: string; var Password: string);
   private

   public

   end;

var
   dmConexao: TdmConexao;

implementation

{$R *.lfm}

{ TdmConexao }

procedure TdmConexao.zConexaoBeforeConnect(Sender: TObject);
begin
   try
     {$IFDEF LINUX}
     zConexao.Database := Application.Location + '/Banco/OdontoTeo.fdb';
     {$ENDIF}
     {$IFDEF WINDOWS}
     zConexao.Database := Application.Location + '\Banco\OdontoTeo.fdb';
     {$ENDIF}
   except on E: Exception do
     raise exception.Create('Não foi possível conectar ao Banco de Dados, erro:' + LineEnding + E.Message);
   end;
end;

procedure TdmConexao.zConexaoLogin(Sender: TObject; var Username: string; var Password: string);
begin
   if zConexao.Connected = false then
        zConexao.Connected := true;
end;

end.

