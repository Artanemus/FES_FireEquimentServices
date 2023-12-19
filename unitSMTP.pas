unit unitSMTP;


interface

uses Data.DBXCommonIndy, system.Classes;

type

TMySMTP = class(TComponent)
private
  { private declarations }

protected
  { protected declarations }
public
  { public declarations }
constructor Create(AOwner: TComponent); override;

published
  { published declarations }
end;

var SMTP : TidSMTP;

implementation

{ TMySMTP }

constructor TMySMTP.Create(AOwner: TComponent);
begin
  inherited;
  SMTP := TIdSMTP.Create(nil);
  SMTP.Host := 'smtp.example.com';
  // or SMTP.Host := '192.168.1.100';
  SMTP.Port := 25;
  SMTP.AuthType := ftBasic;
  // or SMTP.AuthName := 'user';
  // or SMTP.AuthPassword := 'pass';
  // or SMTP.AuthUser := 'user';

{

To send an email message using TIdSMTP, create an instance of TIdMessage
by writing var MSG: TIdMessage;. Then assign some properties to it, such as
From.Name (the sender’s name),
From.Address (the sender’s email address),
To.Name (the recipient’s name),
To.Address (the recipient’s email address),
Subject (the subject line),
and Body.Text (the message body).

For example: MSG.From.Name := 'John Doe';
or MSG.From.Address := 'johndoe@example.com';
or MSG.To.Name := 'Jane Smith';
or MSG.To.Address := 'janesmith@example.com';
or MSG.Subject := 'Hello from RAD Studio 11';
or MSG.Body.Text := 'This is a test email sent using Indy's SMTP client component.';.

Finally, call the Send method of TIdSMTP with MSG as an argument by writing SMTP.Send(MSG);.
}

end;

end.
