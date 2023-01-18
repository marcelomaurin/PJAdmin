unit relcadpes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { Tfrmrelcadpes }

  Tfrmrelcadpes = class(TForm)
    dsrep: TDataSource;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
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
    RLLabel6: TRLLabel;
    RLReport1: TRLReport;
  private

  public

  end;

var
  frmrelcadpes: Tfrmrelcadpes;

implementation

{$R *.lfm}

end.

