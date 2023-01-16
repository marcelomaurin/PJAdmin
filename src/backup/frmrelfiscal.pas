unit frmRelFiscal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport,
  dmbase, DB;

type

  { TRelfiscal }

  TRelfiscal = class(TForm)
    dsrep: TDataSource;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDetailGrid1: TRLDetailGrid;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLReport1: TRLReport;
  private

  public

  end;

var
  Relfiscal: TRelfiscal;

implementation

{$R *.lfm}

end.

