unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DbCtrls, DBGrids, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Datasource1: TDatasource;
    Label1: TLabel;
    Panel1: TPanel;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1;
  FirstNum:array [0..3] of TPanel;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  FirstNum[0] := TPanel.Create(Self);
  FirstNum[0].Parent := Self;
  FirstNum[0].Top := 50;
  FirstNum[0].Left:= 50;
  FirstNum[0].Height:= 50;
  FirstNum[0].Width:= 350;
  FirstNum[0].Enabled:= true;
  FirstNum[0].Caption:= 'IdeŠŠŠŠŠŠŠŠŠŠŠŠŠŠŠ';
  FirstNum[0].Show;
end;

end.

