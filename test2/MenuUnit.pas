unit MenuUnit;

interface

uses
  AccessAdapterUnit,
  AdaptersUnit,
  System.Generics.Collections,
  MainUnit;

type
  Menu = class(TInterfacedObject, Main)
  private
    /// <link>aggregation</link>
    Adapter1: Adapters;
  public
    function getMenu: TList<string>;
  end;

implementation

function Menu.getMenu: TList<string>;
begin
  result := TList<string>.create;
  Adapter1 := AccessAdapter.create;
  result := Adapter1.getMenu;
end;

end.
