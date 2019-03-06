unit AccessAdapterUnit;

interface

uses
  SysUtils,
  Data.DB,
  Data.Win.ADODB,
  System.Generics.Collections,
  AdaptersUnit;

type
  AccessAdapter = class(TInterfacedObject, Adapters)
  private
    caption: string;
    ADOConnection: TADOConnection;
    function getAnswerTabel(Answer:string): TList<string>;
    function getAnswerTabelName: string;
    function getCorrectTabel(Correct:string): TDictionary<integer, integer>;
    function getCorrectTabelName: string;
    function getMenu: TList<string>;
    procedure setTest(caption: string);
    function getQuest: TList<string>;
    function getAnswer: TList<string>;
    function getCorrect: TDictionary<integer, integer>;
  published
    constructor create;
  end;

implementation

constructor AccessAdapter.create;
begin
  ADOConnection := TADOConnection.create(nil);
  with (ADOConnection) do
  begin
    Provider := 'Microsoft.ACE.OLEDB.12.0';
    mode := cmShareDenyNone;
    LoginPrompt := false;
    ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;' +
      'Data Source=Phisics.accdb;' + 'persist security info=false';
    connected := true;
  end;
end;

function AccessAdapter.getAnswer: TList<string>;

var
  ADOQuery: TADOQuery;
  answer: string;
begin
  answer := getAnswerTabelName;
result:= TList<string>.create;
result:= getAnswerTabel(Answer);
end;

function AccessAdapter.getAnswerTabel(Answer:string): TList<string>;
var
 ADOQuery: TADOQuery;
begin
 result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
  Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT caption FROM ' + answer + ';');
    open;
    Active := true;
  end;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getAnswerTabelName: string;
var
 ADOQuery: TADOQuery;
begin

  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT answer FROM Main WHERE caption="' + self.caption + '";');
    open;
    Active := true;
  end;
  ADOQuery.First;
  result := ADOQuery.FieldByName('answer').AsString;
end;

function AccessAdapter.getCorrect: TDictionary<integer, integer>;
var
  correct: string;
begin
correct := getCorrectTabelName;
result:= getCorrectTabel(correct);
end;

function AccessAdapter.getCorrectTabel(
  Correct: string): TDictionary<integer, integer>;
  var
  ADOQuery: TADOQuery;
begin
 result := TDictionary<integer, integer>.create;
 ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT quest_id,answer_id FROM ' + correct + ';');
    open;
    Active := true;
  end;
  //ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    result.Add(StrToInt(ADOQuery.FieldByName('quest_id').AsString),
      StrToInt(ADOQuery.FieldByName('answer_id').AsString));
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getCorrectTabelName: string;
var
ADOQuery: TADOQuery;
begin
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT correct FROM Main WHERE caption="' + self.caption + '";');
    open;
    Active := true;
  end;
  result := ADOQuery.FieldByName('correct').AsString;
  ADOQuery.Free;
end;

function AccessAdapter.getMenu: TList<string>;
var
  ADOQuery: TADOQuery;
  DataSource: TDataSource;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT caption FROM Main;');
    open;
    Active := true;
  end;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getQuest: TList<string>;
var
  ADOQuery: TADOQuery;
  quest: string;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT quest FROM Main WHERE caption="' + self.caption + '";');
    open;
    Active := true;
  end;
  ADOQuery.First;
  quest := ADOQuery.FieldByName('quest').AsString;

  with (ADOQuery) do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT caption FROM ' + quest + ';');
    open;
    Active := true;
  end;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

procedure AccessAdapter.setTest(caption: string);
begin
  self.caption := caption;
end;

end.
