unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  dmbase, setmain, config;

type

  { TForm1 }

  TForm1 = class(TForm)
    imgconfig: TImage;
    MainMenu1: TMainMenu;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgconfigClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  FSetMain := TSetMain.create();
  FSetMain.CarregaContexto();
  self.Height := FSetMain.Height;
  self.Width := FSetMain.Width;
  fdmBase := TdmBase.create(self);
  try
    fdmBase.opendb();

  except
    ShowMessage('Erro na configuração das informações do BD');
    imgconfigClick(self);
  end;

end;

procedure TForm1.FormDestroy(Sender: TObject);
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

procedure TForm1.imgconfigClick(Sender: TObject);
begin
  frmconfig := Tfrmconfig.create(self);
  frmconfig.showmodal;
  frmconfig.free;
  frmconfig := nil;
end;

end.

