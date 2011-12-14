unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls, db, ZConnection, ZDataset,Picker, Controls, Classes;

type
  { TForm1 }
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Datasource1: TDatasource;
    Label1: TLabel;
    HeaderPanel: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    FooterPanel: TLabel;
    ListBox1: TListBox;
    Panel1: TPanel;
    DoPanel: TPanel;
    OdPanel: TPanel;
    KartaPanel: TPanel;
    PopustPanel: TPanel;
    ZConnection1: TZConnection;
    ZReadOnlyQuery1: TZReadOnlyQuery;

    procedure Button1Click(Sender: TObject);
    procedure Button1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  end;

var
  Form1: TForm1; 
  a : TPicker;

implementation
{$R *.lfm}

procedure TForm1.Button1Click(Sender: TObject);
var gumb : TButton;
begin
  gumb := TButton(Sender);
  PickForm.Pokazi(gumb);
end;

procedure TForm1.Button1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;


end.

