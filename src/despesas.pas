unit Despesas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ComCtrls,  DBCtrls, DBGrids, EditBtn, dmbase;

type

  { TfrmDespesas }

  TfrmDespesas = class(TForm)
    btAdicionar: TSpeedButton;
    btEditar: TSpeedButton;
    btExpCSV: TToggleBox;
    btImpRel: TToggleBox;
    btPesquisar: TSpeedButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    edFilename: TFileNameEdit;
    edpesdescricao: TEdit;
    Label1: TLabel;
    Label8: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel3: TPanel;
    tsdados: TTabSheet;
    tsExportacao: TTabSheet;
    tsRelatorios: TTabSheet;
    procedure btPesquisarClick(Sender: TObject);
  private

  public

  end;

var
  frmDespesas: TfrmDespesas;

implementation

{$R *.lfm}

{ TfrmDespesas }

procedure TfrmDespesas.btPesquisarClick(Sender: TObject);
begin
  fdmbase.PesquisaDespesas('','','');
end;

end.

