unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls, Classes, Unit2,Unit3, db, ZConnection, ZDataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    Datasource1: TDatasource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;

    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 
  PanelList : array of TPanel;
implementation

{$R *.lfm}

{ TForm1 }

{ TForm1 }



{ TForm1 }

procedure TForm1.Panel1Click(Sender: TObject);
var a : TPanel;
begin
     a := TPanel(Sender);
     ZQuery1.Open;
     Form2.Panel1.Caption:= ZQuery1.DbcResultSet.GetString(1);
     ZQuery1.DbcResultSet.Next;
     Form2.Panel2.Caption := ZQuery1.DbcResultSet.GetString(1);
     Form2.Left:= a.Parent.Left + a.Left;
     Form2.Top := a.Parent.Top + a.Top + 30;
     Form2.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
  var
    x: Integer;
  begin
     SetLength(PanelList,10);
     for x:=0 to 9 do
     begin
       PanelList[x] := TPanel.Create(self);
       PanelList[x].Parent := Self;
       PanelList[x].Visible:= false;
     end;
  end;

procedure TForm1.Panel2Click(Sender: TObject);
begin
  Unit2.Close(PanelList);
end;

end.

