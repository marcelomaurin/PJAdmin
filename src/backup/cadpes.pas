unit cadpes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, DBCtrls, DBGrids, rxlookup, rxdbcomb, AnchorDockPanel,
  dmbase, setmain, funcoes, relcadpes;

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
    DBcbtipopessoa: TRxDBComboBox;
    btPesquisar: TSpeedButton;
    btEditar: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btImpRel: TToggleBox;
    btExpCSV: TToggleBox;
    tsRegistro: TTabSheet;
    tsGrid: TTabSheet;
    procedure btAdicionarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btImpRelChange(Sender: TObject);
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
  //fdmbase.zqrycadpes.open;
end;

procedure TfrmCadPes.btCancelarClick(Sender: TObject);
begin
  fdmbase.zqrycadpes.Cancel;


end;

procedure TfrmCadPes.btEditarClick(Sender: TObject);
begin
  if not fdmbase.zcadpes.Active then
  begin
    btPesquisarClick(self);

  end;
  if not fdmbase.zqrycadpes.IsEmpty then
  begin
    fdmbase.zqrycadpes.Edit;
  end;
end;

procedure TfrmCadPes.btImpRelChange(Sender: TObject);
begin
  frmrelcadpes := Tfrmrelcadpes.create(self);
  frmrelcadpes.RLReport1.Prepare;
  frmrelcadpes.RLReport1.Preview(nil);
  frmrelcadpes.Free;
  frmrelcadpes := nil;
end;

procedure TfrmCadPes.btAdicionarClick(Sender: TObject);
begin
  if not fdmbase.zqrycadpes.Active then
  begin
    btPesquisarClick(self;
  end;

  fdmbase.zqrycadpes.Append;
end;

procedure TfrmCadPes.btSalvarClick(Sender: TObject);
begin
  fdmbase.zqrycadpes.post;
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
  if fdmbase.zqrycadpes.Active then
  begin
    fdmbase.zqrycadpes.close;
  end;
end;

procedure TfrmCadPes.btPesquisarClick(Sender: TObject);
begin
  fdmBase.PesquisaCadPes(edpesnome.text, cbTipoPessoa.ItemIndex, edDocumento.Text);
end;

end.

