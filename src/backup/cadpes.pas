unit cadpes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, DBCtrls, DBGrids, AnchorDockPanel, dmbase, setmain,
  funcoes;

type

  { TfrmCadPes }

  TfrmCadPes = class(TForm)
    btAdicionar: TSpeedButton;
    btSalvar: TSpeedButton;
    btCancelar: TSpeedButton;
    cbTipoPessoa: TComboBox;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBText1: TDBText;
    dscadpes: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    edDocumento: TEdit;
    edpesnome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    PageControl1: TPageControl;
    pncontrole: TPanel;
    pnTop: TAnchorDockPanel;
    pnclient: TAnchorDockPanel;
    SpeedButton1: TSpeedButton;
    btEditar: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    tsRegistro: TTabSheet;
    tsGrid: TTabSheet;
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure dscadpesDataChange(Sender: TObject; Field: TField);
    procedure dscadpesStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  frmCadPes: TfrmCadPes;

implementation

{$R *.lfm}

{ TfrmCadPes }

procedure TfrmCadPes.FormCreate(Sender: TObject);
begin
  fdmbase.zcadpes.open;
end;

procedure TfrmCadPes.btCancelarClick(Sender: TObject);
begin
  fdmbase.zcadpes.Cancel;


end;

procedure TfrmCadPes.btSalvarClick(Sender: TObject);
begin
  fdmbase.zcad
end;

procedure TfrmCadPes.dscadpesDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TfrmCadPes.dscadpesStateChange(Sender: TObject);
begin
  if  dscadpes.State in [dsEdit, dsInsert] then
  begin
    tsRegistro.Enabled:=true;
    tsRegistro.show;
  end
  else
  begin
    tsRegistro.Enabled:=false;
    if (PageControl1.ActivePage = tsRegistro) then
    begin
      tsGrid.show;
    end;
  end;
end;

procedure TfrmCadPes.FormDestroy(Sender: TObject);
begin
  fdmbase.zcadpes.close;
end;

procedure TfrmCadPes.SpeedButton1Click(Sender: TObject);
begin
  fdmbase.zcadpes.close;
  fdmbase.zcadpes.Filter:= '';
  if edpesnome.Text <> '' then
  begin
    fdmbase.zcadpes.Filter:= '  nome like "%'+ edpesnome.text+'%" ';
  end;
  //fdmbase.zcadpes.;
  fdmbase.zcadpes.open;
end;

end.

