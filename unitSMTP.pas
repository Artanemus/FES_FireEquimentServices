unit unitSMTP;


interface

uses
Data.DBXCommonIndy
, system.Classes
, IdSMTP
, IdMessage
, IdSSLOpenSSL
, IdGlobal
, IdExplicitTLSClientServerBase;

type

TMySMTP = class(TComponent)
private
  { private declarations }

protected
  { protected declarations }

public
  { public declarations }
//constructor Create(AOwner: TComponent); override;
//procedure SendEmail(const Recipients: string; const Subject: string; const Body: string);

published
  { published declarations }
end;

var SMTP: TIdSMTP;
VAR MSG : TIdMessage;

implementation

{ TMySMTP }



procedure SendEmail(const Recipients: string; const Subject: string; const Body: string);
var
  SMTP: TIdSMTP;
  Email: TIdMessage;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  SMTP := TIdSMTP.Create(nil);
  Email := TIdMessage.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  try
    SSLHandler.MaxLineAction := maException;
    SSLHandler.SSLOptions.Method := sslvTLSv1;
    SSLHandler.SSLOptions.Mode := sslmUnassigned;
    SSLHandler.SSLOptions.VerifyMode := [];
    SSLHandler.SSLOptions.VerifyDepth := 0;

    SMTP.IOHandler := SSLHandler;
    SMTP.Host := 'smtp.gmail.com';
    SMTP.Port := 587;
    SMTP.Username := 'yourusername@gmail.com';
    SMTP.Password := 'yourpassword';
    SMTP.UseTLS := utUseExplicitTLS;

    Email.From.Address := 'yourusername@gmail.com';
    Email.Recipients.EmailAddresses := Recipients;
    Email.Subject := Subject;
    Email.Body.Text := Body;

    SMTP.Connect;
    SMTP.Send(Email);
    SMTP.Disconnect;

  finally
    SMTP.Free;
    Email.Free;
    SSLHandler.Free;
  end;
end;


{
procedure TForm1.Button1Click(Sender: TObject);
begin
  SendEmail('recipient@whatever.com', 'Subject', 'Body');
end;

constructor TMySMTP.Create(AOwner: TComponent);
begin
  inherited;
  SMTP := TIdSMTP.Create(nil);
  SMTP.Host := 'smtp.example.com';
  // or SMTP.Host := '192.168.1.100';
  SMTP.Port := 25;
  SMTP.AuthType := satDefault;
  // or SMTP.AuthName := 'user';
  // or SMTP.AuthPassword := 'pass';
  // or SMTP.AuthUser := 'user';



VAR SMTP : TIdSMTP;
VAR MSG : TIdMSG;
.
.
  MSG:=TIdMSG.Create(NIL);
  TRY
    WITH MSG.Recipients.Add DO BEGIN
      Name:='<Name of recipient>';
      Address:='<Email address of recipient>'
    END;
    MSG.BccList.Add.Address:='<Email address of Blind Copy recipient>';
    MSG.From.Name:='<Name of sender>';
    MSG.From.Address:='<Email address of sender>';
    MSG.Body.Text:='<Message Body>';
    MSG.Subject:='<Subject of message>';
    SMTP:=TIdSMTP.Create(NIL);
    TRY
      SMTP.Host:='x.x.x.x'; // IP Address of SMTP server
      SMTP.Port:=25; // Port address of SMTP service (usually 25)
      SMTP.Connect;
      TRY
        SMTP.Send(MSG)
      FINALLY
        SMTP.Disconnect
      END
    FINALLY
      SMTP.Free
    END
  FINALLY
    MSG.Free
  END;


procedure TForm20.SendImage(const Comment, AImage: String);
var
  SMTP: TIdSMTP;
  Msg: TIdMessage;
begin
  Msg := TIdMessage.Create(nil);
  try
    Msg.From.Address := 'frostydennis7@gmail.com';
    Msg.Recipients.EMailAddresses := 'trevosedennis@gmail.com';
    Msg.Body.Text := 'hello dennis';
    Msg.Subject := 'free space';

    SMTP := TIdSMTP.Create(nil);
    try
      SMTP.Host := 'smtp.gmail.com';
      SMTP.Port := 587;
      //SMTP.Port := 465; //gives different error-connection closed gracefully but
      //no email is sent or received

      SMTP.AuthType := satDefault;
      SMTP.Username := 'frostydennis7@gmail.com';
      SMTP.Password := '$$$$$$$';

      SMTP.Connect;
      //fails with port 25- connection time out socket error
      //with port 465 it never gets past smtp connect.  shows 'closed graceflly'
      //with port 587 it gets past connect but then says
      //'must issue a STARTTLS command first' before smtp.send(msg)

      SMTP.Send(Msg);
    finally
      SMTP.Free;
    end;
  finally
    Msg.Free;
  end;
end;


The problem is that you are not setting the TIdSMTP.UseTLS property.

On port 25 and 587, you must set UseTLS to utUseExplicitTLS, then TIdSMTP
will issue a STARTTLS command to initiate an SSL/TLS handshake before sending emails.

On port 465, you must set UseTLS to utUseImplicitTLS, then TIdSMTP will
initiate an SSL/TLS handshake immediately upon connecting, before reading
the server's greeting.

Either way, using SSL/TLS requires assigning a TIdSSLIOHandlerSocketBase-derived
component, such as TIdSSLIOHandlerSocketOpenSSL, to the TIdSMTP.IOHandler
property before connecting to the server, eg:

var
  IO: TIdSSLIOHandlerSocketOpenSSL;
...
IO := TIdSSLIOHandlerSocketOpenSSL.Create(SMTP);
IO.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
// configure other IO properties as needed...

SMTP.IOHandler := IO;
Note that TIdSSLIOHandlerSocketOpenSSL does not support TLS 1.3+.
At this time, if you need to use TLS 1.3+ then try this work-in-progress
SSLIOHandler for that purpose.

https://github.com/IndySockets/Indy/pull/299

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


  object IdSMTP1: TIdSMTP
    OnStatus = IdSMTP1Status
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    Host = 'smtp.gmail.com'
    Password = '***'
    Port = 587
    SASLMechanisms = <>
    UseTLS = utUseExplicitTLS
    Username = '****'
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = 'smtp.gmail.com:587'
    Host = 'smtp.gmail.com'
    MaxLineAction = maException
    Port = 587
    SSLOptions.Method = sslvTLSv1
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    OnStatusInfo = IdSSLIOHandlerSocketOpenSSL1StatusInfo
  end


      IdSMTP1.Connect;
      IdSMTP1.Send(IdMessage1);
      IdSMTP1.Disconnect;
}


end.
