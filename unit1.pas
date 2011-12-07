unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, ExtCtrls, Classes, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1;

implementation

{$R *.lfm}
procedure TForm1.FormCreate(Sender: TObject);
var Button2 : TButton;
begin
  Button2 := TButton.Create(Self);
  Button2.Parent:= Self;
  Button2.Top:= 100;
  Button2.Left:= 100;
  Button2.AutoSize:= true;
  Button2.Caption:= 'Hello';
  Button2.Visible:= true;
//  Button2.OnClick:= Button1Click;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  with (Sender as TButton) do
       Caption := 'Clicked';
end;

end.

