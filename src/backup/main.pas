unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  dmbase, setmain, config, AberturaFiscal, funcoes, relfiscal;

const versao = '0.01';

type

  { Tfrmmain }

  Tfrmmain = class(TForm)
    imgconfig: TImage;
    MainMenu1: TMainMenu;
    miabertura: TMenuItem;
    mifechamento: TMenuItem;
    miRelatorio: TMenuItem;
    Separator1: TMenuItem;
    miMesFiscal: TMenuItem;
    miOperacoes: TMenuItem;
    miconfig: TMenuItem;
    mntools: TMenuItem;
    MICLOSE: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgconfigClick(Sender: TObject);
    procedure miaberturaClick(Sender: TObject);
    procedure MICLOSEClick(Sender: TObject);
    procedure miconfigClick(Sender: TObject);
    procedure mifechamentoClick(Sender: TObject);
    procedure miRelatorioClick(Sender: TObject);
  private
    procedure AbreMesFiscal();
    procedure FechaMesFiscal();

  public

  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.lfm}

{ Tfrmmain }

procedure Tfrmmain.FormCreate(Sender: TObject);
begin
  FSetMain := TSetMain.create();
  FSetMain.CarregaContexto();
  self.Height := FSetMain.Height;
  self.Width := FSetMain.Width;
  fdmBase := TdmBase.create(self);
  try
    fdmBase.opendb();
    if not fdmBase.TestaVersao(versao) then
    begin
       Showmessage('Banco de dados com versão errada');
       application.Terminate;
    end;

  except
    ShowMessage('Erro na configuração das informações do BD');
    imgconfigClick(self);
  end;

end;

procedure Tfrmmain.FormDestroy(Sender: TObject);
begin
  fdmBase.closedb();
  fdmBase.free;
  fdmBase := nil;
  FSetMain.Height:= self.Height;
  FSetMain.Width:= self.Width;
  FSetMain.SalvaContexto(false);
  FSetMain.free;
  FSetMain := nil;
end;

procedure Tfrmmain.imgconfigClick(Sender: TObject);
begin
  frmconfig := Tfrmconfig.create(self);
  frmconfig.showmodal;
  frmconfig.free;
  frmconfig := nil;
end;

procedure Tfrmmain.miaberturaClick(Sender: TObject);
begin
  if fdmBase.MesFiscalAberto then
  begin
     if ShowConfirm('Fechar mes atual aberto') then
     begin
        FechaMesFiscal();
        AbreMesFiscal();
      end
     else
     begin
        ShowMessage('Impossivel abrir 2 mêses fiscais simultaneos');
     end;
  end
  else
  begin
    AbreMesFiscal();

  end;

end;

procedure Tfrmmain.MICLOSEClick(Sender: TObject);
begin
   close();
end;

procedure Tfrmmain.miconfigClick(Sender: TObject);
begin
    imgconfigClick(self);
end;

procedure Tfrmmain.mifechamentoClick(Sender: TObject);
begin
  if fdmBase.MesFiscalAberto() then
  begin
    if ShowConfirm('Deseja Fechar mes fiscal?') then
    begin
       FechaMesFiscal();
    end
    else
    begin
      showmessage('Operação cancelada!');
    end;
  end
  else
  begin
    showmessage('Mes fiscal já fechado!');
  end;
end;

procedure Tfrmmain.miRelatorioClick(Sender: TObject);
begin
  frmrelfiscal := frmRelfiscal.create(self);
  frmRelFiscal.preparaDados();
  frmRelFiscal.Visualiza();

end;

procedure Tfrmmain.AbreMesFiscal();
begin

  frmAberturaFiscal := TfrmAberturaFiscal.create(self);
  frmAberturaFiscal.showmodal();
  frmAberturaFiscal.free;
  frmAberturaFiscal := nil;

end;

procedure Tfrmmain.FechaMesFiscal();
begin
   if   fdmBase.FechaMesFiscal() then
   begin
      ShowMessage('Mes fiscal foi fechado!');
   end;
end;





end.

