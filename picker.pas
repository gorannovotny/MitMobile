unit Picker;

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls,SysUtils,Controls,Classes,Graphics;

const MaxPicks = 5;
type

  { TPicker }

  TPicker = class (TForm)
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
    Panels[x].Caption :=  IntToStr(x) + '. Test';
    Panels[x].Top := ClientOrigin.y + Panels[x].Height * x;
    Panels[x].Left := ClientOrigin.x;
    Panels[x].Show;
  end;
end;


procedure TPicker.Pokazi(gumb: TButton);
var x:Integer;
begin
  ParentGumb := gumb;
  Self.Top := gumb.Height + gumb.Top + gumb.parent.ClientOrigin.Y;
  Self.Left:= gumb.left + gumb.parent.ClientOrigin.X;
  for x:= 0 to MaxPicks - 1  do
  begin
  Panels[x].Caption :=  IntToStr(x) + '. Test';
  Panels[x].Top :=  Panels[x].Height * x;
  Panels[x].Left := 0;
  Panels[x].Show;
  end;
  Self.ShowModal;
end;

procedure TPicker.Click(Sender:TObject);
var x:Integer;
begin
     ParentGumb.Caption := (Sender as TPanel).Caption;
     Self.Close;
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

