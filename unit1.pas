unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls, db, ZConnection, ZDataset,Picker, Controls, Classes,SysUtils;

type
  { TForm1 }
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Datasource1: TDatasource;
    Label2: TLabel;
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
    Timer1: TTimer;
    ZConnection1: TZConnection;
    ZReadOnlyQuery1: TZReadOnlyQuery;

    procedure Button1Click(Sender: TObject);
    procedure Button1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);

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

procedure TForm1.Timer1Timer(Sender: TObject);
begin
     Label2.Caption:=  TimeToStr(Now);
end;


end.

