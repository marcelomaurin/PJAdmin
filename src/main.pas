unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, dmbase, setmain, config, AberturaFiscal, funcoes, relfiscal, cadpes,
  relcadpes;

const versao = '0.03';

type

  { Tfrmmain }

  Tfrmmain = class(TForm)
    imgconfig: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbversao: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    mirelsimples: TMenuItem;
    MenuItem11: TMenuItem;
    mirelpes: TMenuItem;
    miconspes: TMenuItem;
    miPessoas: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Separator3: TMenuItem;
    miabertura: TMenuItem;
    mifechamento: TMenuItem;
    miRelatorio: TMenuItem;
    Separator1: TMenuItem;
    miMesFiscal: TMenuItem;
    miOperacoes: TMenuItem;
    miconfig: TMenuItem;
    mntools: TMenuItem;
    MICLOSE: TMenuItem;
    Separator2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgconfigClick(Sender: TObject);
    procedure miaberturaClick(Sender: TObject);
    procedure MICLOSEClick(Sender: TObject);
    procedure miconfigClick(Sender: TObject);
    procedure miconspesClick(Sender: TObject);
    procedure mifechamentoClick(Sender: TObject);
    procedure miRelatorioClick(Sender: TObject);
    procedure mirelpesClick(Sender: TObject);
    procedure mirelsimplesClick(Sender: TObject);
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
  self.top := FSetMain.posy;
  self.left := FSetMain.posx;
  self.Height := FSetMain.Height;
  self.Width := FSetMain.Width;
  fdmBase := TdmBase.create(self);
  lbversao.Caption:= versao;
  try
    fdmBase.opendb();
    if not fdmBase.TestaVersao(versao) then
    begin
       Showmessage('Banco de dados com versão errada');
       if ShowConfirm('Atualizar Banco de dados') then
       begin
          fdmbase.AtualizarBanco(versao);
       end
       else
       begin
         application.Terminate;
       end;

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
  FSetMain.posy:= self.top;
  FSetMain.posx:= self.left;
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

procedure Tfrmmain.miconspesClick(Sender: TObject);
begin
  frmCadPes := Tfrmcadpes.Create(self);
  frmCadPes.showmodal();
  frmCadPes.free;
  frmCadPes := nil;
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
  frmrelfiscal := TfrmRelfiscal.create(self);
  frmRelFiscal.preparaDados();
  frmRelFiscal.Visualiza();

end;

procedure Tfrmmain.mirelpesClick(Sender: TObject);
begin

end;

procedure Tfrmmain.mirelsimplesClick(Sender: TObject);
begin
  fdmBase.zqrycadpes.sql.text := 'select * from cadpes order by nome';
  fdmBase.zqrycadpes.prepare;
  fdmBase.zqrycadpes.open;
  frmrelcadpes := Tfrmrelcadpes.create(self);
  frmrelcadpes.RLReport1.Prepare;
  frmrelcadpes.RLReport1.Preview(nil);
  frmrelcadpes.Free;
  frmrelcadpes := nil;
  fdmBase.zqrycadpes.close;
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

