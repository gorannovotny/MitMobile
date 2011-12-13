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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ListBox1: TListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    ZConnection1: TZConnection;
    ZReadOnlyQuery1: TZReadOnlyQuery;

    procedure Button1Click(Sender: TObject);
    procedure Button1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);

  end;

var
  Form1: TForm1; 
  a : TPicker;

implementation
{$R *.lfm}

procedure TForm1.FormCreate(Sender:TObject);
begin

  a := TPicker.Create(Self);
end;

procedure TForm1.Button1Click(Sender: TObject);
var gumb : TButton;
begin
  gumb := TButton(Sender);
  a.Show(gumb);
end;

procedure TForm1.Button1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;


end.

