program server;

uses laz_synapse, TFTPDaemonThread;

begin
  TTFTPDaemonThread.Create('0.0.0.0','69');
  TTFTPDaemonThread.Execute;
end.

