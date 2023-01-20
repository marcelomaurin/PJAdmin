unit dmbase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, csvdataset, ZConnection, ZDataset, setmain, dialogs,
  Interfaces;

type TCSVLayout = ( csv_Nada, csv_Produtos);

type

  { TdmBase }

  TdmBase = class(TDataModule)
    dscadpes: TDataSource;
    tbcsv: TCSVDataset;
    dsCSV: TDataSource;
    zcadend: TZTable;
    zcadendBairro: TStringField;
    zcadendCEP: TStringField;
    zcadendCidade: TStringField;
    zcadendID: TLargeintField;
    zcadendIDCADPES: TLargeintField;
    zcadendLogradouro: TStringField;
    zcadendOBS: TStringField;
    zcadendReferencia: TStringField;
    zcadpesDocumento: TStringField;
    zcadpesind: TLargeintField;
    zcadpesNome: TStringField;
    zcadpesTipoPessoa: TLargeintField;
    zcon: TZConnection;
    zqry: TZQuery;
    zqrycadpes: TZQuery;
    zqrycadpesDocumento: TStringField;
    zqrycadpesind: TLargeintField;
    zqrycadpesNome: TStringField;
    zqrycadpesTipoPessoa: TLargeintField;
    zcadpes: TZTable;
    zreffiscalanofiscal: TLargeintField;
    zreffiscaldescricao: TStringField;
    zreffiscalmesfiscal: TLargeintField;
    zreffiscalstatus: TLargeintField;
    zversao: TZTable;
    zproductDetail01: TStringField;
    zproductDetail02: TStringField;
    zproductidproduto: TLongintField;
    zproductprice: TStringField;
    zproductproductDesc: TStringField;
    zproductproductDetail: TStringField;
    zreffiscal: TZTable;
    zversaodtinstall: TStringField;
    zversaostrversao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    function ImportReportDS(): boolean;

  public
    procedure opendb();
    procedure closedb();
    procedure product();
    procedure selproduct();
    procedure NewSel();
    procedure NewIns();
    function ImportCVSReport( filename: string) : boolean;
    function csvValidaLayout( tipo : TCSVLayout) : boolean;
    function dropproducts(): boolean;
    function TestaVersao( versao : string) : boolean;
    function TestaVersaoMenor( versao : string) : boolean;
    function VersaoBanco( ) : double;
    procedure registraversao(versao : string);
    procedure atualizaversao( versao: string);
    function MesFiscalAberto(): boolean;
    function AbreMesFiscal( mes: string; ano: string; descricao : string): boolean;
    function OpenMesFiscal( ): boolean;
    function CloseMesFiscal( ): boolean;
    function PesquisaMesFiscal(mes: string; ano: string): boolean;
    function FechaMesFiscal(): boolean;
    function PesquisaCadPes( Nome : String; TipoPessoa: integer; Documento: string) : boolean;
    function AtualizarBanco(Versao: String): boolean;
  end;

var
  fdmBase: TdmBase;

implementation

{$R *.lfm}

{ TdmBase }

procedure TdmBase.DataModuleCreate(Sender: TObject);
begin
  zcon.LibraryLocation:= FSetMain.SQLLITEDLL;
  zcon.Database:= FsetMain.db;

end;

function TdmBase.ImportReportDS: boolean;
var
  resultado :boolean;
begin
  resultado := true;
  (*

    tbcsv.first;
    //zproduct.open;
    product();
    while not tbcsv.EOF do
    begin
      try

        zproduct.Append();
        zproduct.FieldByName('productDesc').asstring := tbcsv.Fields[0].asstring;
        zproduct.FieldByName('productDetail').asstring := tbcsv.Fields[1].asstring;
        zproduct.FieldByName('Detail01').asstring := tbcsv.Fields[2].asstring;
        zproduct.FieldByName('Detail02').asstring := tbcsv.Fields[3].asstring;
        zproduct.FieldByName('price').asstring := tbcsv.Fields[4].asstring;

        zproduct.Post;
        tbcsv.next();

      except
        resultado := false;
      end;
    end;
    if resultado then ShowMessage('Success in CSV Import ');
    /zproduct.Prior;
    zproduct.close;
    *)
    result := resultado;
end;

procedure TdmBase.opendb();
begin
  zcon.Disconnect;
  //zcon.Database:= ExtractFilePath(ApplicationName)+'\db\etiqueta.db';
  zcon.Database:= FSetMain.DB;

  //zcon.LibraryLocation:= ExtractFilePath(ApplicationName)+'\sqlite\win64\sqlite3.dll';
  zcon.LibraryLocation:= FSetMain.SQLLITEDLL;
  if FileExists(zcon.LibraryLocation) then
  begin
    zcon.Connect;
    (*
    if zcon.Connected then
    begin
        selproduct();
    end
     else
    begin
      ShowMessage('Fail to connect in database');
    end;
    *)
  end
  else
  begin
    ShowMessage('Not found lib sqllite');

  end;
end;

procedure TdmBase.closedb();
begin
  //zselproduct.close;

  zcon.Disconnect;
end;

procedure TdmBase.product();
begin
  if zcon.Connected then
  begin
    //zproduct.Close;
    //zproduct.open;

  end;
end;

procedure TdmBase.selproduct();
begin
  (*
  if zselproduct.Active then
  begin
    zselproduct.Close;
  end;
  zselproduct.open;
    *)

end;

procedure TdmBase.NewSel();
begin
  (*
  zselproduct.Insert();
  zselproduct.fieldbyname('productDesc').asstring := zproduct.fieldbyname('productDesc').asstring;
  zselproduct.fieldbyname('productDetail').asstring := zproduct.fieldbyname('productDetail').asstring;
  zselproduct.fieldbyname('Detail01').asstring := zproduct.fieldbyname('Detail01').asstring;
  zselproduct.fieldbyname('Detail02').asstring := zproduct.fieldbyname('Detail02').asstring;
  zselproduct.fieldbyname('price').asstring := zproduct.fieldbyname('price').asstring;
  zselproduct.Post;
  *)
end;

procedure TdmBase.NewIns;
begin
  (*
  zproduct.Insert();
  zproduct.fieldbyname('productDesc').asstring := 'New product';
  zproduct.fieldbyname('productDetail').asstring := 'Product Detail';
  zproduct.fieldbyname('Detail01').asstring := 'Detail 01';
  zproduct.fieldbyname('Detail02').asstring := 'Detail 02';
  zproduct.fieldbyname('price').asstring := 'R$ 1.00';
  zproduct.Post;
  *)
end;

function TdmBase.ImportCVSReport(filename: string): boolean;
var resultado: boolean;
begin
   resultado := false;
   if FileExists(filename) then
   begin
       try
        tbcsv.LoadFromCSVFile(filename);
        tbcsv.Open;
        if (csvValidaLayout(csv_Produtos)) then
        begin
          if ImportReportDS() then
          begin

          end
          else
          begin

          end;
        end
        else
        begin
          showmessage('Layout CSV not valid!');
        end;

        tbcsv.close;

        resultado := true;

       finally
       end;

   end
   else
   begin
     showmessage('File not exist');
   end;
   result := resultado;
end;

function TdmBase.csvValidaLayout(tipo: TCSVLayout): boolean;
var
   resultado : boolean;
begin
    resultado := false;
    //ShowMessage(inttostr(tbcsv.Fields.Count));
    if  (tbcsv.Fields.Count = 5) then
    begin
       resultado := true;
    end
    else
    begin
      showmessage('Invalid CSV fields number');
    end;
    result := resultado;
end;

function TdmBase.dropproducts: boolean;
var
   resultado : boolean;
begin
  resultado := false;
  (*
  try
    zproduct.Delete;

  finally;
    resultado := true;
  end;

  result := resultado;
  *)
end;

//Verifica se a versão é igual
function TdmBase.TestaVersao(versao: string): boolean;
var
   resultado : boolean;
begin
   resultado := false;
   zversao.open;
   if zversao.IsEmpty then
   begin
      registraversao(versao);
      resultado := true;
   end
   else
   begin
      if(zversao.FieldByName('strversao').asstring = versao) then
      begin
        resultado := true;
      end;
   end;

   zversao.close;
   result := resultado;
end;

//Testa se versao é menor que atual
function TdmBase.TestaVersaoMenor(versao: string): boolean;
var
   resultado : boolean;
begin
   resultado := false;
   zversao.open;
   if zversao.IsEmpty then
   begin
      registraversao(versao);
      resultado := true;
   end
   else
   begin
      if(strtofloat(zversao.FieldByName('strversao').asstring) < strtofloat(versao)) then
      begin
        resultado := true;
      end;
   end;

   zversao.close;
   result := resultado;
end;

//Captura a versao do banco de dados
function TdmBase.VersaoBanco: double;
var
   resultado : real;
begin
   resultado := 0;
   DecimalSeparator := '.';
   zversao.open;
   if zversao.IsEmpty then
   begin

      resultado := 0;
   end
   else
   begin
        resultado := strtofloat(zversao.FieldByName('strversao').asstring );
   end;

   zversao.close;
   result := resultado;
end;


procedure TdmBase.registraversao(versao: string);
begin
  ZVERSAO.Open;
  ZVERSAO.Append;
  ZVERSAO.FieldByName('STRVERSAO').ASSTRING := VERSAO;
  ZVERSAO.FieldByName('dtinstall').ASSTRING := DATETIMETOSTR(NOW);
  zversao.post;
  ZVERSAO.CLOSE;
end;

procedure TdmBase.atualizaversao(versao: string);
begin
  ZVERSAO.Open;
  ZVersao.first;
  ZVERSAO.edit;
  ZVERSAO.FieldByName('STRVERSAO').ASSTRING := VERSAO;
  ZVERSAO.FieldByName('dtinstall').ASSTRING := DATETIMETOSTR(NOW);
  zversao.post;
  ZVERSAO.CLOSE;

end;

function TdmBase.MesFiscalAberto: boolean;
var
   resultado : boolean;
begin
     resultado := false;
     zqry.close;
     zqry.sql.Text := 'select * from reffiscal where status = 1';
     zqry.open;
     if not zqry.IsEmpty then
     begin
       resultado := true;
     end;
     zqry.close;
     result := resultado;
end;

function TdmBase.AbreMesFiscal(mes: string; ano: string; descricao: string
  ): boolean;
var
   resultado : boolean;
begin
  resultado := true;
  try
    zreffiscal.open;
    zreffiscal.Append;
    zreffiscal.FieldByName('mesfiscal').asstring := mes;
    zreffiscal.FieldByName('anofiscal').asstring := ano;
    zreffiscal.FieldByName('descricao').asstring := descricao;
    zreffiscal.FieldByName('status').asinteger := 1; (*Ativo*)
    zreffiscal.post;
    zreffiscal.close;
  except
    resultado := false;
  end;

  result:= resultado;
end;

function TdmBase.OpenMesFiscal: boolean;
var
   resultado : boolean;
begin
  resultado := true;
  try
    zreffiscal.open;
  except
    resultado := false;
  end;

  result:= resultado;
end;

function TdmBase.CloseMesFiscal: boolean;
var
   resultado : boolean;
begin
  resultado := true;
  try
    zreffiscal.close();
  except
    resultado := false;
  end;

  result:= resultado;
end;


function TdmBase.PesquisaMesFiscal(mes: string; ano: string): boolean;
var
   resultado : boolean;
begin
     resultado := false;
     zqry.close;
     zqry.sql.Text := 'select * from reffiscal where mesfiscal = "'+mes+'" and anofiscal="'+ano+'" order by status, anofiscal, mesfiscal';
     zqry.open;
     if not zqry.IsEmpty then
     begin
       resultado := true;
     end;
     zqry.close;
     result := resultado;
end;

function TdmBase.FechaMesFiscal: boolean;
var
   resultado : boolean;
begin
     resultado := true;
     try
        zqry.close;
        zqry.sql.Text := 'update  reffiscal set status = 0 where status = 1 ';
        zqry.ExecSQL;
        zqry.close;

     except
       resultado := false;
     end;
     result := resultado;
end;

function TdmBase.PesquisaCadPes(Nome: String; TipoPessoa: integer;
  Documento: string): boolean;
var
   resultado : boolean;
   valor : integer;
begin
   resultado := true;
   try
    zcadpes.close;
    zqrycadpes.close;
    zcadend.close;
    //zcadpes.Filter:= '';
    //zcadpes.Filtered:=true;
    zqrycadpes.sql.text := 'select * from cadpes ';
    if (Nome <> '') then
    begin
      zqrycadpes.sql.text := zqrycadpes.sql.text + ' where nome like "%'+ Nome+'%" ';
    end;
    if (TipoPessoa <> 0) then
    begin
      valor := pos('where',zqrycadpes.sql.text);
      if (valor= 0) then
      begin
         zqrycadpes.sql.text := zqrycadpes.sql.text +' where TipoPessoa = '+ inttostr(TipoPessoa);
      end
      else
      begin
         zqrycadpes.sql.text := zqrycadpes.sql.text + ' and TipoPessoa = '+ inttostr(TipoPessoa);
      end;
    end;

    if (Documento <> '') then
    begin
      valor := pos('where',zqrycadpes.sql.text);
      if (valor= 0) then
      begin
         zqrycadpes.sql.text := zqrycadpes.sql.text + ' where documento like "%'+ Documento+'%" ';
      end
      else
      begin
         zqrycadpes.sql.text := zqrycadpes.sql.text + ' and documento like "'+ Documento+'%" ';
      end
    end;


    //zcadpes.open;
    //showmessage(zqrycadpes.sql.text);
    zqrycadpes.Prepare;
    zqrycadpes.open;
    zcadend.open;
    //dscadpes.DataSet := zcadpes;
   except
     resultado := false;
   end;


   result := resultado;

end;

//Script para atualização de banco de dados
function TdmBase.AtualizarBanco(Versao: String): boolean;
var
   resultado : boolean;
   versaoant : double;
   versaoatual : double;
begin
   resultado := false;
   try
      versaoant := VersaoBanco();
      DecimalSeparator := '.';
      versaoatual := StrToFloat(versao);
      (*Implementar rotinas para atualizar os scripts*)
      //Nao implementado

      (*Corrige a versao do banco*)
      atualizaversao(Versao);
   finally
     resultado := true;
   end;

   result := resultado;
end;


end.

