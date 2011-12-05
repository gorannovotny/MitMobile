unit Unit2; 

{$mode objfpc}{$H+}


interface

uses
  Forms,Classes, SysUtils, ExtCtrls;

procedure Open(Panel:TPanel; a: array of TPanel);
procedure Close(a: array of TPanel);
implementation

procedure Open(Panel: TPanel; a :array of TPanel);
  var
    x: Integer;
  begin
     for x:=0 to 9 do
     begin
       a[x].Left:= Panel.Left;
       a[x].Top:= Panel.Top + (x + 1) * Panel.Height;
       a[x].Width:= Panel.Width;
       a[x].Height:= Panel.Height;
       a[x].Caption:= 'Yes';
       a[x].Color:= Panel.Color;
       a[x].Visible:= true;
       a[x].Show;
     end;
  end;

procedure Close(a:array of TPanel);
var
  x: Integer;
begin
  for x:= 0 to 9 do
  begin
    a[x].Visible:= false;
  end;
end;

end.

