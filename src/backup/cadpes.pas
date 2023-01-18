unit cadpes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, DBCtrls, DBGrids, rxlookup, rxdbcomb, AnchorDockPanel,
  dmbase, setmain, funcoes;

type

  { TfrmCadPes }

  TfrmCadPes = class(TForm)
    btAdicionar: TSpeedButton;
    btSalvar: TSpeedButton;
    btCancelar: TSpeedButton;
    cbTipoPessoa: TComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBText1: TDBText;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dscadpes: TDataSource;
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
    RxDBComboBox1: TRxDBComboBox;
    btPesquisar: TSpeedButton;
    btEditar: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    tsRegistro: TTabSheet;
    tsGrid: TTabSheet;
    procedure btAdicionarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure cbTipoPessoaChange(Sender: TObject);
    procedure dscadpesDataChange(Sender: TObject; Field: TField);
    procedure dscadpesStateChange(Sender: TObject);
    procedure edpesnomeKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
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

procedure TfrmCadPes.btEditarClick(Sender: TObject);
begin
  if not fdmbase.zcadpes.Active then
  begin
    fdmbase.zcadpes.open;
    fdmBase.zcadpes.Filtered := true;
    fdmBase.zcadpes.Filter:= ' ind = '+ inttostr(fdmbase.zqrycadpes.fieldbyname('').asinteger);
  end;
  if not fdmbase.zcadpes.IsEmpty then
  begin
    dscadpes.DataSet := fdmbase.zcadpes;

    fdmbase.zcadpes.Edit;
  end;
end;

procedure TfrmCadPes.btAdicionarClick(Sender: TObject);
begin
  if not fdmbase.zcadpes.Active then
  begin
    fdmBase.zcadpes.Filtered := false;
    fdmBase.zcadpes.Filter:= '';

    fdmbase.zcadpes.open;
  end;

  dscadpes.DataSet := fdmbase.zcadpes;
  fdmbase.zcadpes.Append;
end;

procedure TfrmCadPes.btSalvarClick(Sender: TObject);
begin
  fdmbase.zcadpes.post;
end;

procedure TfrmCadPes.cbTipoPessoaChange(Sender: TObject);
begin

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

procedure TfrmCadPes.edpesnomeKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
  begin
      btPesquisarClick(self);
  end;
end;

procedure TfrmCadPes.FormDestroy(Sender: TObject);
begin
  fdmbase.zcadpes.close;
end;

procedure TfrmCadPes.btPesquisarClick(Sender: TObject);
begin
  fdmBase.PesquisaCadPes(edpesnome.text, cbTipoPessoa.ItemIndex, edDocumento.Text);
end;

end.

