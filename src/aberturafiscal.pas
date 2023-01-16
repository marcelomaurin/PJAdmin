unit AberturaFiscal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, rxtooledit,
  dmbase,setmain, dateutils;

type

  { TfrmAberturaFiscal }

  TfrmAberturaFiscal = class(TForm)
    btSalve: TButton;
    btCancelar: TButton;
    edMes: TEdit;
    edAno: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lbMesFiscal: TLabel;
    meDesc: TMemo;
    procedure btCancelarClick(Sender: TObject);
    procedure btSalveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmAberturaFiscal: TfrmAberturaFiscal;

implementation

{$R *.lfm}

{ TfrmAberturaFiscal }

procedure TfrmAberturaFiscal.btCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAberturaFiscal.btSalveClick(Sender: TObject);
begin
  if not fdmBase.PesquisaMesFiscal(edMes.text, edAno.text) then
  begin
       fdmBase.AbreMesFiscal(edMes.text, edAno.text, meDesc.Text);
       close;
  end
  else
  begin
    ShowMessage('Mes fiscal já existe!');
  end;
end;

procedure TfrmAberturaFiscal.FormShow(Sender: TObject);
begin
  edMes.text :=  inttostr(MonthOf(now));
  edAno.text := inttostr(Yearof(now));
  meDesc.Text:= datetostr(now);
end;

end.

