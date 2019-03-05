program Project1Tests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  TestPhisicsControllerUnit in 'TestPhisicsControllerUnit.pas',
  PhisicsControllerUnit in '..\PhisicsControllerUnit.pas',
  ControllersUnit in '..\ControllersUnit.pas',
  MainUnit in '..\MainUnit.pas',
  MenuUnit in '..\MenuUnit.pas',
  AdaptersUnit in '..\AdaptersUnit.pas',
  AccessAdapterUnit in '..\AccessAdapterUnit.pas',
  TestsUnit in '..\TestsUnit.pas',
  Test1Unit in '..\Test1Unit.pas',
  TestMenuUnit in 'TestMenuUnit.pas',
  TestTest1Unit in 'TestTest1Unit.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    with TextTestRunner.RunRegisteredTests do
      Free
  else
    GUITestRunner.RunRegisteredTests;
end.

