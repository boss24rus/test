unit ControllersUnit;

interface

uses
  System.Generics.Collections;

type
  Controllers = interface
    procedure setTest(caption: string);
    function getMenu: TList<string>;
    function getQuest: TList<string>;
    function getAnswer: TList<string>;
    function getCorrect: TDictionary<integer, integer>;
  end;

implementation

end.
