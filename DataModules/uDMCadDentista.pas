unit uDMCadDentista;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, ZDataset;

type

   { TdmCadDentista }

   TdmCadDentista = class(TDataModule)
      qryDentista: TZQuery;
   private

   public
      function TabelaVazia: boolean;

      var ativo : string;
      var nome : string;
      procedure MontaSelect;
   end;

var
   dmCadDentista: TdmCadDentista;

implementation

{$R *.lfm}

{ TdmCadDentista }



function TdmCadDentista.TabelaVazia: boolean;
begin
   qryDentista.Close;
   qryDentista.SQL.Clear;
   qryDentista.SQL.Add('select first 2 * from tbl_dentista');
   qryDentista.Open;
   if qryDentista.IsEmpty then
      result := true
   else
      result := false;
end;

procedure TdmCadDentista.MontaSelect;
begin
   qryDentista.SQL.Clear;
   qryDentista.Close;

   if (ativo = 'T') and (nome.Length < 3) then
      qryDentista.SQL.Add('select * from tbl_dentista order by nome_dentista')
   else if (ativo = 'T') and (nome.Length > 2) then
      qryDentista.SQL.Add('select * from tbl_dentista where nome_dentista containing ' + QuotedStr(nome) + ' order by nome_dentista');;

   if (ativo <> 'T') and (nome.Length < 3) then
      qryDentista.SQL.Add('select * from tbl_dentista where ativo = ' + QuotedStr(ativo) + ' order by nome_dentista')
   else if (ativo <> 'T') and (nome.Length > 2) then
      qryDentista.SQL.Add('select * from tbl_dentista where nome_dentista containing ' + QuotedStr(nome) + ' and Ativo = ' +
                              QuotedStr(ativo) + ' order by nome_dentista');

   qryDentista.Open;
end;

end.

