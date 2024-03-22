unit unitFEStools;

interface
uses
  System.Classes;

  function GenerateCustomerCode(const CustomerName: string): string;


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

end.
