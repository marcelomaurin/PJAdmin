unit TPDesp;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, DBCtrls, DBGrids, EditBtn, dmbase;

type

  { TfrmTPDesp }

  TfrmTPDesp = class(TForm)
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
    Panel2: TPanel;
    Panel3: TPanel;
    tsRelatorios: TTabSheet;
    tsExportacao: TTabSheet;
    tsdados: TTabSheet;
    procedure btPesquisarClick(Sender: TObject);
  private

  public

  end;

var
  frmTPDesp: TfrmTPDesp;

implementation

{$R *.lfm}

{ TfrmTPDesp }

procedure TfrmTPDesp.btPesquisarClick(Sender: TObject);
begin
   fdmBase.PesquisaTPDesp(edpesdescricao.text);
end;

end.

