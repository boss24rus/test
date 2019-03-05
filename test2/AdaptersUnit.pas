unit AdaptersUnit;

interface

uses
  System.Generics.Collections;

type
  Adapters = interface
    function getMenu: TList<string>;
    procedure setTest(caption: string);
    function getQuest: TList<string>;
    function getAnswer: TList<string>;
    function getCorrect: TDictionary<integer, integer>;
  end;

implementation

end.
