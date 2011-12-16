unit Picker;

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls, SysUtils, Controls, Classes, Graphics, ZDataset,
  ZConnection;

const MaxPicks = 8;
      ArrSize   = 20;
type
  { TPicker }
  TPicker = class (TForm)
    DownButton: TButton;
    UpButton: TButton;
    procedure DownButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpButtonClick(Sender: TObject);
  private
    Panels : array of TPanel;
    Recs : array of String;
    procedure Click(Sender : TObject);
    procedure MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  public
    procedure Pokazi(gumb : TButton);
  end;
var
  ParentGumb : TButton;
  PickForm :TPicker;
  y : Integer  ;
implementation
{$R *.lfm}

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
  SetLength(Recs,ArrSize);
  for x:= 0 to ArrSize - 1  do
    begin
    Recs[x] := IntToStr(x);
    end;
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
  Panels[0].Caption :=  Recs[y-MaxPicks];
  Panels[0].Tag :=  y-MaxPicks;
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
  Panels[x+1].Caption :=  Recs[y];
  Panels[x+1].Tag :=  y;
  y:=y+1;
  if y>0 then
    UpButton.Enabled:= true;
  if y >= ArrSize then
    DownButton.Enabled:= false;
end;


procedure TPicker.Pokazi(gumb: TButton);
var x,razmak:Integer;
begin
  ParentGumb := gumb;
  PickForm.Top := gumb.Top + gumb.parent.ClientOrigin.Y - UpButton.Height;
  PickForm.Left:= gumb.left + gumb.parent.ClientOrigin.X;
  razmak:= 0;
  y:= gumb.tag;
  if y > (ArrSize - MaxPicks) then y := ArrSize - MaxPicks;
  UpButton.Top := 0;
  UpButton.Left := 0;
  UpButton.Width:= gumb.Width;
  UpButton.Enabled:= true;
  UpButton.Show;

  for x:= 0 to MaxPicks - 1 do begin
    Panels[x].Caption :=  Recs[y];
    Panels[x].Tag := y;
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

