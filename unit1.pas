unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls, db, ZConnection, ZDataset,Picker;

type
  { TForm1 }
  TForm1 = class(TForm)
    Button1: TButton;
    Datasource1: TDatasource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZReadOnlyQuery1: TZReadOnlyQuery;

    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  end;

var
  Form1: TForm1; 
  a : TPicker;

implementation
{$R *.lfm}

procedure TForm1.FormCreate(Sender:TObject);
begin

  a := TPicker.Create;
  a.Prepare(Self);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  a.Show(Sender as TButton);
end;

end.

