unit relfiscal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport,
  dmbase, DB;

type

  { TRelfiscal1 }

  TfrmRelfiscal = class(TForm)
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
    procedure preparaDados();
    procedure Visualiza();

  end;

var
  frmRelfiscal: TfrmRelfiscal;

implementation

{$R *.lfm}

{ TRelfiscal1 }

procedure TfrmRelfiscal.preparaDados;
begin
   fdmbase.OpenMesFiscal();
   RLReport1.Prepare;
end;

procedure TfrmRelfiscal.Visualiza;
begin
   if RLReport1.Preview() then
   begin
     close();
   end;
end;

end.

