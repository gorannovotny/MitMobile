unit Picker;

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls, SysUtils, Controls, Classes, Graphics, ZDataset,
  ZConnection;

const MaxPicks = 5;
type
  { TPicker }
  TPicker = class (TForm)
    DownButton: TButton;
    ZConnection1: TZConnection;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure DownButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Panels : array of TPanel;
    procedure Click(Sender : TObject);
    procedure MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  public
    procedure Pokazi(gumb : TButton);
  end;
var
  ParentGumb : TButton;
  PickForm :TPicker;

implementation
{$R *.lfm}

procedure TPicker.FormCreate(Sender : TObject);
var x : Integer;
    y : TForm;
begin
  SetLength(Panels,MaxPicks);
  for x:= 0 to MaxPicks - 1  do
  begin
    Panels[x] := TPanel.Create(self);
    Panels[x].Parent := self;
    Panels[x].Color := clDefault;
    Panels[x].Alignment:= taLeftJustify;
    Panels[x].OnClick:= @Click;
    Panels[x].OnMouseDown:= @MouseDown;
    Panels[x].OnMouseUp:= @MouseUp;
  end;
end;

procedure TPicker.DownButtonClick(Sender: TObject);
var x : Integer;
begin
  begin
  for x:=0 to MaxPicks - 2  do
    begin
    Panels[x].Caption := Panels[x+1].Caption;
    Panels[x].Tag :=  Panels[x+1].Tag;
    end;
  Panels[x+1].Caption :=  ZReadOnlyQuery1.FieldByName('Naziv').AsString;
  Panels[x+1].Tag :=  ZReadOnlyQuery1.FieldByName('ID').AsInteger;
  ZReadOnlyQuery1.Next;
  if ZReadOnlyQuery1.EOF then DownButton.Visible:= false;
end;


procedure TPicker.Pokazi(gumb: TButton);
var x:Integer;
begin
  ParentGumb := gumb;
  PickForm.Top := gumb.Height + gumb.Top + gumb.parent.ClientOrigin.Y;
  PickForm.Left:= gumb.left + gumb.parent.ClientOrigin.X;
  ZReadOnlyQuery1.Open;
  ZReadOnlyQuery1.FindFirst;
  x:= 0;
  while not ZReadOnlyQuery1.EOF do
    begin
    Panels[x].Caption :=  ZReadOnlyQuery1.FieldByName('Naziv').AsString;
    Panels[x].Tag :=  ZReadOnlyQuery1.FieldByName('ID').AsInteger;
    Panels[x].Top :=  gumb.Height * x;
    Panels[x].Left := 0;
    Panels[x].Width:= gumb.Width;
    Panels[x].Height:= gumb.Height;
    x := x + 1;
    ZReadOnlyQuery1.Next;
    end;
  if (x = MaxPicks) and (not ZReadOnlyQuery1.EOF) then
    begin
    DownButton.Top := gumb.Height * x;
    DownButton.Left := 0;
    DownButton.Width:= gumb.Width;
    DownButton.Visible:= true;
    end;
  PickForm.ShowModal;
  ZReadOnlyQuery1.Close;
end;


procedure TPicker.Click(Sender:TObject);
var x:Integer;
begin
     ParentGumb.Caption := (Sender as TPanel).Caption;
     PickForm.Close;
end;


procedure TPicker.MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     (Sender as TPanel).Color:= clYellow;
end;

procedure TPicker.MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     (Sender as TPanel).Color:= clDefault;
end;

end.

