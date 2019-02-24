unit ControllersUnit;

interface

uses System.Generics.Collections;

type
  Controllers = interface
    function getMenu:TList<string>;
  end;

implementation

end.
