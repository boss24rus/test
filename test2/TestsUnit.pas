unit TestsUnit;

interface

uses
  System.Generics.Collections;

type
  Tests = interface
    procedure setTest(caption: string);
    function getQuest: TList<string>;
    function getAnswer: TList<string>;
    function getCorrect: TDictionary<integer, integer>;
  end;

implementation

end.
