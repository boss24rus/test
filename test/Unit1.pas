unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections,
  ControllersUnit, PhisicsControllerUnit;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    /// <link>aggregation</link>
    Controller1: Controllers;
  public
    procedure createPanels(list:TList<String>);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.createPanels(list:TList<String>);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Controller1:=PhisicsController.Create;
  createPanels(Controller1.getMenu);
end;

end.
