unit Picker;

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls;

type
  TPicker = class
  private
    Panels : array of TPanel;
  public
    procedure Prepare(Parent: TForm);
    procedure Show(gumb : TButton);
    procedure Click(Sender : TObject);
  end;

implementation

procedure TPicker.Prepare(Parent: TForm);
begin
  SetLength(Panels,2);
  Panels[0] := TPanel.Create(Parent);
  Panels[0].Parent := Parent;
  Panels[0].OnClick:= @Click;
  Panels[0].OnMouseLeave:= @Click;
  Panels[0].Hide;
end;

procedure TPicker.Show(gumb: TButton);
begin
  Panels[0].Caption := 'Test';
  Panels[0].Top := gumb.Top + gumb.Height;
  Panels[0].Left := gumb.Left;;
  Panels[0].Show;
end;

procedure TPicker.Click(Sender:TObject);
begin
  if Panels[0].IsControlVisible then
     Panels[0].Visible:= false;

end;

end.

