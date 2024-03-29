unit unitFEStools;

interface
uses
  System.Classes, System.SysUtils, System.StrUtils;

  function GenerateCustomerCode(const CustomerName: string): string;
  function GenerateReadableCustomerCode(const CustomerName: string): string;


implementation

uses
  System.Hash;

function GenerateCustomerCode(const CustomerName: string): string;
var
  Hash: THashSHA1;
begin
  Hash := THashSHA1.Create;
  try
    Hash.Update(CustomerName);
    Result := Copy(Hash.HashAsString, 1, 6);
  finally
    ;
  end;
end;

function GenerateReadableCustomerCode(const CustomerName: string): string;
var
  Words: TStringList;
  Code: string;
  i: Integer;
  Word: string;
const
  IgnoreWords: array[0..6] of string = ('A', 'THE', 'AND', '&', 'PTY', 'LTD', '/');
begin
  Words := TStringList.Create;
  try
    Words.Delimiter := ' ';
    Words.DelimitedText := UpperCase(CustomerName);

    Code := '';
    for i := 0 to Words.Count - 1 do
    begin
      Word := Words[i];
      if not MatchStr(Word, IgnoreWords) then
      begin
        if Length(Word) >= 2 then
          Code := Code + Copy(Word, 1, 2)
        else
          Code := Code + Word;

        if Length(Code) >= 6 then
          Break;
      end;
    end;

    Result := Copy(Code, 1, 6);
  finally
    Words.Free;
  end;
end;


end.
