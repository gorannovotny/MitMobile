unit Picker;

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls, SysUtils, Controls, Classes, Graphics, ZDataset,
  ZConnection;

const MaxPicks = 8;
type
  { TPicker }
  TPicker = class (TForm)
    DownButton: TButton;
    UpButton: TButton;
    ZConnection1: TZConnection;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure DownButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpButtonClick(Sender: TObject);
  private
    Panels : array of TPanel;
    Recs : array of record
           id : Integer;
           naziv:String;
           end;
    procedure Click(Sender : TObject);
    procedure MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    function FindIndex(x:Integer):Integer;
  public
    procedure Pokazi(gumb : TButton);
  end;
var
  ParentGumb : TButton;
  PickForm :TPicker;
  ArrSize  : Integer;
  y : Integer  ;
implementation
{$R *.lfm}

function TPicker.FindIndex(x:Integer):Integer;
var i:Integer;
begin
  for i:= 0 to ArrSize do
    if Recs[i].id = x then break;
  Result := i
end;

procedure TPicker.FormCreate(Sender : TObject);
var x : Integer;
begin
  SetLength(Panels,MaxPicks);
  for x:= 0 to MaxPicks - 1  do
  begin
    Panels[x] := TPanel.Create(self);
    Panels[x].Parent := self;
    Panels[x].Color := clSilver;
    Panels[x].Alignment:= taLeftJustify;
    Panels[x].BevelOuter:= bvRaised;
    Panels[x].BevelWidth:= 2;
    Panels[x].OnClick:= @Click;
    Panels[x].OnMouseDown:= @MouseDown;
    Panels[x].OnMouseUp:= @MouseUp;
    Panels[x].Visible:= false;
  end;
  ZReadOnlyQuery1.Open;
  ZReadOnlyQuery1.FindFirst;
  x:= 0;
  SetLength(Recs,100);
  while not ZReadOnlyQuery1.EOF do
  begin
        Recs[x].id := ZReadOnlyQuery1.FindField('id').AsInteger;
        Recs[x].naziv := ZReadOnlyQuery1.FindField('naziv').AsString;
        ZReadOnlyQuery1.Next;
        x:= x + 1;
  end;
  ArrSize := x;
  SetLength(Recs,ArrSize);
end;

procedure TPicker.UpButtonClick(Sender: TObject);
var x : Integer;
begin
  for x:=MaxPicks - 1 downto 1  do
    begin
    Panels[x].Caption := Panels[x-1].Caption;
    Panels[x].Tag :=  Panels[x-1].Tag;
    end;
  y:=y-1;
  Panels[0].Caption :=  Recs[y-MaxPicks].naziv;
  Panels[0].Tag :=  Recs[y-MaxPicks].id;
  if (y-MaxPicks)<1 then
    UpButton.Enabled:= false;
  if y < ArrSize then
    DownButton.Enabled:= true;
end;

procedure TPicker.DownButtonClick(Sender: TObject);
var x : Integer;
begin
  for x:=0 to MaxPicks - 2  do
    begin
    Panels[x].Caption := Panels[x+1].Caption;
    Panels[x].Tag :=  Panels[x+1].Tag;
    end;
  Panels[x+1].Caption :=  Recs[y].naziv;
  Panels[x+1].Tag :=  Recs[y].id;
  y:=y+1;
  if y>0 then
    UpButton.Enabled:= true;
  if y >= ArrSize then
    DownButton.Enabled:= false;
end;


procedure TPicker.Pokazi(gumb: TButton);
var x:Integer;
begin
  ParentGumb := gumb;
  PickForm.Top := gumb.Top + gumb.parent.ClientOrigin.Y - UpButton.Height;
  PickForm.Left:= gumb.left + gumb.parent.ClientOrigin.X;
  y:= FindIndex(gumb.tag);
  if y > (ArrSize - MaxPicks) then y := ArrSize - MaxPicks;
  UpButton.Top := 0;
  UpButton.Left := 0;
  UpButton.Width:= gumb.Width;
  UpButton.Enabled:= true;
  UpButton.Show;

  for x:= 0 to MaxPicks - 1 do begin
    Panels[x].Caption :=  Recs[y].naziv;
    Panels[x].Tag := Recs[y].id;
    Panels[x].Top :=  gumb.Height * x + UpButton.Height;
    Panels[x].Left := 0;
    Panels[x].Width:= gumb.Width;
    Panels[x].Height:= gumb.Height;
    Panels[x].Visible:= true;

    y := y + 1;
    if y >= ArrSize then break;
  end;
  DownButton.Top := gumb.Height * (x+1) + UpButton.Height;
  DownButton.Left := 0;
  DownButton.Width:= gumb.Width;
  DownButton.Enabled:= true;
  DownButton.Show;
  if (y -MaxPicks) <= 0  then begin
    UpButton.Enabled:= false;
  end;
  if y >= ArrSize then begin
    DownButton.Enabled:= false;
  end;
  PickForm.ShowModal;
end;


procedure TPicker.Click(Sender:TObject);
var x:Integer;
begin
     ParentGumb.Caption := (Sender as TPanel).Caption;
     ParentGumb.Tag:=(Sender as TPanel).Tag ;
     PickForm.Close;
end;


procedure TPicker.MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     (Sender as TPanel).Color:= clYellow;
end;

procedure TPicker.MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     (Sender as TPanel).Color:= clSilver;
end;

end.

