unit cadpes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, DBCtrls, DBGrids, Menus, EditBtn, rxlookup, rxdbcomb,
  AnchorDockPanel, dmbase, setmain, funcoes, relcadpes, relcadend;

type

  { TfrmCadPes }

  TfrmCadPes = class(TForm)
    btAdicionar: TSpeedButton;
    btAdicionarEnd: TSpeedButton;
    btCancelarEnd: TSpeedButton;
    btImpRel1: TToggleBox;
    btSalvar: TSpeedButton;
    btCancelar: TSpeedButton;
    btSalvarEnd: TSpeedButton;
    cbTipoPessoa: TComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGridCadEnd: TDBGrid;
    DBNavigator2: TDBNavigator;
    DBText1: TDBText;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dscadpes: TDataSource;
    dscadend: TDataSource;
    edDocumento: TEdit;
    edpesnome: TEdit;
    edFilename: TFileNameEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MenuItem1: TMenuItem;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    pncontrole: TPanel;
    pnTop: TAnchorDockPanel;
    pnclient: TAnchorDockPanel;
    DBcbtipopessoa: TRxDBComboBox;
    btPesquisar: TSpeedButton;
    btEditar: TSpeedButton;
    popGrid: TPopupMenu;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btImpRel: TToggleBox;
    btExpCSV: TToggleBox;
    tsEndereco: TTabSheet;
    tsRegistro: TTabSheet;
    tsGrid: TTabSheet;
    procedure btAdicionarClick(Sender: TObject);
    procedure btAdicionarEndClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btCancelarEndClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btExpCSVChange(Sender: TObject);
    procedure btExpCSVClick(Sender: TObject);
    procedure btImpRel1Change(Sender: TObject);
    procedure btImpRel1Click(Sender: TObject);
    procedure btImpRelChange(Sender: TObject);
    procedure btImpRelClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btSalvarEndClick(Sender: TObject);
    procedure cbTipoPessoaChange(Sender: TObject);
    procedure dscadendStateChange(Sender: TObject);
    procedure dscadpesDataChange(Sender: TObject; Field: TField);
    procedure dscadpesStateChange(Sender: TObject);
    procedure edpesnomeKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private

  public
    procedure AdicionarEndereco();
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

procedure TfrmCadPes.btCancelarEndClick(Sender: TObject);
begin
  fdmbase.zcadend.Cancel;
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

procedure TfrmCadPes.btExpCSVChange(Sender: TObject);
begin

end;

procedure TfrmCadPes.btExpCSVClick(Sender: TObject);
begin
  if (edFilename.text <> '') then
  begin
      fdmBase.ExportaCadEnd(edpesnome.text, cbTipoPessoa.ItemIndex, edDocumento.Text, edFilename.text);
      ShowMessage('Arquivo Exportado com Sucesso!');
  end;
end;

procedure TfrmCadPes.btImpRel1Change(Sender: TObject);
begin

end;

procedure TfrmCadPes.btImpRel1Click(Sender: TObject);
begin
  fdmBase.PesquisaCadEnd(edpesnome.Text,cbTipoPessoa.ItemIndex,edDocumento.text);
  frmrelcadend := Tfrmrelcadend.create(self);
  frmrelcadend.RLReport1.Prepare;
  frmrelcadend.RLReport1.Preview(nil);
  frmrelcadend.Free;
  frmrelcadend := nil;
end;

procedure TfrmCadPes.btImpRelChange(Sender: TObject);
begin

end;

procedure TfrmCadPes.btImpRelClick(Sender: TObject);
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
    btPesquisarClick(self);
  end;

  fdmbase.zqrycadpes.Append;
end;

procedure TfrmCadPes.btAdicionarEndClick(Sender: TObject);
begin
  AdicionarEndereco();
end;

procedure TfrmCadPes.btSalvarClick(Sender: TObject);
begin
  fdmbase.zqrycadpes.post;
end;

procedure TfrmCadPes.btSalvarEndClick(Sender: TObject);
begin
  fdmBase.zcadend.post;
end;

procedure TfrmCadPes.cbTipoPessoaChange(Sender: TObject);
begin

end;

procedure TfrmCadPes.dscadendStateChange(Sender: TObject);
begin
  if  dscadend.State in [dsEdit, dsInsert] then
  begin
    tsEndereco.Enabled:=true;
    tsEndereco.show;
  end
  else
  begin
    tsEndereco.Enabled:=false;
    if (PageControl1.ActivePage = tsEndereco) then
    begin
      tsEndereco.show;
    end;
  end;
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

procedure TfrmCadPes.MenuItem1Click(Sender: TObject);
begin
  AdicionarEndereco();
end;

procedure TfrmCadPes.AdicionarEndereco;
begin
  if fdmbase.zqrycadpes.Active then
  begin
    if not fdmbase.zqrycadpes.IsEmpty then
    begin
      fdmbase.zcadend.Append;
      fdmbase.zcadend.FieldByName('idcadpes').asinteger := fdmbase.zqrycadpes.FieldByName('ind').asinteger;
    end
    else
    begin
      ShowMessage('Cadastre Primeiro um Endereço!');
    end;
  end
  else
  begin
    ShowMessage('Realize primeiro a pesquisa!');
  end;
end;

end.

