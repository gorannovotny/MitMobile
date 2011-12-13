unit Picker;

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls,SysUtils,Controls,Classes,Graphics;

const MaxPicks = 5;
type
  TPicker = class
  private
    Panels : array of TPanel;
  public
    constructor Create(Parent: TForm);
    procedure Show(gumb : TButton);
    procedure Click(Sender : TObject);
    procedure MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  end;
var
  ParentGumb : TButton;
implementation

constructor TPicker.Create(Parent: TForm);
var x : Integer;
begin
  SetLength(Panels,MaxPicks);
  for x:= 0 to MaxPicks - 1  do
  begin
    Panels[x] := TPanel.Create(Parent);
    Panels[x].Parent := Parent;
    Panels[x].Color := clDefault;
    Panels[x].Alignment:= taLeftJustify;
    Panels[x].OnClick:= @Click;
    Panels[x].OnMouseDown:= @MouseDown;
    Panels[x].OnMouseUp:= @MouseUp;
    Panels[x].Hide;
  end;
end;

procedure TPicker.Show(gumb: TButton);
var x:Integer;
begin
  ParentGumb := gumb;
  for x:= 0 to MaxPicks - 1  do
  begin
  Panels[x].Caption :=  IntToStr(x) + '. Test';
  Panels[x].Top := gumb.Top + gumb.Height + Panels[x].Height * x;
  Panels[x].Left := gumb.Left;
  Panels[x].Show;
  end
end;

procedure TPicker.Click(Sender:TObject);
var x:Integer;
begin
  for x:= 0 to MaxPicks - 1  do
  begin
     Panels[x].Visible:= false;
  end;
  ParentGumb.Caption := (Sender as TPanel).Caption;
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

