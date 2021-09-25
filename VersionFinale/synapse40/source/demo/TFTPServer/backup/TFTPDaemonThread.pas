{
   TFTP supports five types of packets, all of which have been mentioned
   above:
      opcode     operation

        1        Read request (RRQ)
        2        Write request (WRQ)
        3        Data (DATA)
        4        Acknowledgment (ACK)
        5        Error (ERROR)


   Error Codes
     Value       Meaning

       0         Not defined, see error message (if any).
       1         File not found.
       2         Access violation.
       3         Disk full or allocation exceeded.
       4         Illegal TFTP operation.
       5         Unknown transfer ID.
       6         File already exists.
       7         No such user.


}

unit TFTPDaemonThread;

interface

uses Classes, SysUtils, FTPTSend;

type
  TTFTPDaemonThread = class(TThread)
  private
    { Private declarations }
    TFTPDaemon:TTFTPSend;
    FIPAdress:String;
    FPort:String;
    FLogMessage:String;
    procedure UpdateLog;
  protected
    procedure Execute; override;
  public
    constructor Create(IPAdress,Port:String);
  end;

implementation


constructor TTFTPDaemonThread.Create(IPAdress,Port:String);
begin
  FIPAdress := IPAdress;
  FPort     := Port;
  inherited Create(False);
end;


procedure TTFTPDaemonThread.Execute;
var RequestType:Word;
    FileName:String;
begin
  TFTPDaemon := TTFTPSend.Create;
  FLogMessage := 'ServerThread created on Port ' + FPort;
  TFTPDaemon.TargetHost := FIPAdress;
  TFTPDaemon.TargetPort := FPort;

    TFTPDaemon.Free;
  end;

end.
