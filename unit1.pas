unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls, db, ZConnection, ZDataset,Picker, Controls, Classes,SysUtils,CijenaKarte;

type
  { TForm1 }
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Datasource1: TDatasource;
    Edit1: TEdit;
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
    procedure Button2Click(Sender: TObject);
    procedure HeaderPanelClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
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

procedure TForm1.Button2Click(Sender: TObject);
begin
  ListBox1.Items.Add(OdPanel.Caption + ' - ' + DoPanel.Caption + ' ' + KartaPanel.Caption + ' ' + PopustPanel.Caption);
end;

procedure TForm1.HeaderPanelClick(Sender: TObject);
begin

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin

  ListBox1.Items.Delete(ListBox1.ItemIndex);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
     Label2.Caption:=  TimeToStr(Now);
//     Edit1.Text := FormatFloat('000.00',CijenaKarte.tarifnaCijenaCjenika(ZReadOnlyQuery1,1,27,Now));
//     Edit1.Text := FormatFloat('000.00',CijenaKarte.izracunPopustaKarte(ZReadOnlyQuery1,2,50));
     Edit1.Text := IntToStr(CijenaKarte.distancaVarijante(ZReadOnlyQuery1,22184,37,38));
end;


end.

