unit Unit1;

interface

uses

  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, System.Generics.Collections, ControllersUnit,
  PhisicsControllerUnit, Vcl.ExtCtrls, Vcl.stdctrls;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    list: TList<string>;
    Buttons: TList<Tbutton>;
    Controller1: Controllers;
    procedure destroyButtons;
    procedure createPanels(list: TList<String>);
  public
    procedure onClick1(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.destroyButtons;
{ var
  S: string; }
begin
  { for S in list do
    begin
    with  Buttons.Last do
    begin
    parent := nil;
    destroy;
    end;
    end; }
end;

procedure TForm1.createPanels(list: TList<String>);
var
  i: integer;
  S: string;
begin
  i := 0;

  Buttons := TList<Tbutton>.create;
  self.list := TList<String>.create;
  self.list := list;
  for S in list do
  begin
    Buttons.Add(Tbutton.create(self));
    with Buttons.Last do
    begin
      parent := self;
      top := i * 41;
      caption := S;
      width := 300;
      onClick := onClick1;
    end;
    i := i + 1;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  list: TList<String>;
begin
  Controller1 := PhisicsController.create;
  list := TList<String>.create;
  list := Controller1.getMenu;
  createPanels(list);
end;

procedure TForm1.onClick1(Sender: TObject);
var
  quest: TList<string>;
  answer: TList<string>;
  correct: TDictionary<integer, integer>;
begin
  Controller1.setTest((Sender as Tbutton).caption);
  destroyButtons;
  quest := TList<string>.create;
  answer := TList<string>.create;
  correct := TDictionary<integer, integer>.create;
  quest := Controller1.getQuest;
  answer := Controller1.getAnswer;
  correct := Controller1.getCorrect;
end;

end.
