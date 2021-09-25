{$codepage utf8}
unit unitHTTP;


interface
uses
  Classes, SysUtils,Process, StrUtils, httpsend, laz_synapse;



procedure DemarrerHttpServeur();
Procedure TelechargerSave(IP,Partie, Joueur : string);
Procedure LirePret(IP, Partie, Joueur : string);
procedure EnvoyerSave(IP, Partie, Joueur:String);
procedure EnvoyerTxt(IP, Partie, Joueur, save:String);
procedure EnvoyerPret(IP, Partie, Joueur:String);
procedure ResetPret(IP, Partie, Joueur:String);
procedure EnvoyerQuitter(IP, Partie, Joueur:String);
procedure RemiseAZeroPret(IP:String);

implementation

procedure DemarrerHttpServeur();
var
  DemarrHttp: TProcess;
begin
     DemarrHttp := TProcess.Create(nil);
     DemarrHttp.CommandLine := 'UwAmp/UwAmp.exe';
     DemarrHttp.Execute;
     DemarrHttp.Free;
end;

Procedure TelechargerSave(IP,Partie, Joueur : string);
var
  HTTPEnvoi : THTTPSend;
  HTTPGet : boolean;
  URL : String;

begin
     URL := Concat('http://'+IP+'/anno/'+Partie+'/'+Joueur+'/save.txt');
     HTTPEnvoi := THTTPSend.Create;
     HTTPGet := HTTPEnvoi.HTTPMethod('GET', URL);
     HTTPEnvoi.Document.SaveToFile('saves/multi/'+Partie+'/'+Joueur+'/save.txt');
     HTTPEnvoi.Free;
     writeln('Fichier téléchargé')
end;

Procedure LirePret(IP, Partie, Joueur : string);
var
  HTTPEnvoi : THTTPSend;
  HTTPGet : boolean;
  URL : String;

begin
     URL := Concat('http://'+IP+'/anno/'+Partie+'/'+Joueur+'/pret.txt');
     HTTPEnvoi := THTTPSend.Create;
     HTTPGet := HTTPEnvoi.HTTPMethod('GET', URL);
     HTTPEnvoi.Document.SaveToFile('saves/multi/'+Partie+'/'+Joueur+'/pret.txt');
     HTTPEnvoi.Free;
end;

procedure EnvoyerSave(IP, Partie, Joueur:String);
var
  save, adresseTxt : string;
  txtSaveFile : textfile;

begin
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/save.txt';
     AssignFile(txtSaveFile, adresseTxt);                         //transfert le ficher dans une variable de type texte
     reset(txtSaveFile);                                       //ouverture ficher
     readln(txtSaveFile, save);                             //transfert ce type texte dans une variable string
     CloseFile(txtSaveFile);
     query('form((doc("http://'+IP+'/anno/'+Partie+'/'+Joueur+'/save.php")//form)[1], {"textdata": $_1})', [save]).retrieve();
end;

procedure EnvoyerTxt(IP, Partie, Joueur, save:String);

begin
     query('form((doc("http://'+IP+'/anno/'+Partie+'/'+Joueur+'/save.php")//form)[1], {"textdata": $_1})', [save]).retrieve();
end;

procedure EnvoyerPret(IP, Partie, Joueur:String);

begin
     query('form((doc("http://'+IP+'/anno/'+Partie+'/'+Joueur+'/pret.php")//form)[1], {"textdata": $_1})', ['1']).retrieve();
end;

procedure ResetPret(IP, Partie, Joueur:String);

begin
     query('form((doc("http://'+IP+'/anno/'+Partie+'/'+Joueur+'/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();
end;

procedure EnvoyerQuitter(IP, Partie, Joueur:String);

begin
     query('form((doc("http://'+IP+'/anno/'+Partie+'/'+Joueur+'/pret.php")//form)[1], {"textdata": $_1})', ['2']).retrieve();
end;

procedure RemiseAZeroPret(IP:String);
begin
     query('form((doc("http://'+IP+'/anno/2/J1/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();
     query('form((doc("http://'+IP+'/anno/2/J2/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();
     query('form((doc("http://'+IP+'/anno/3/J1/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();
     query('form((doc("http://'+IP+'/anno/3/J2/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();
     query('form((doc("http://'+IP+'/anno/3/J3/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();
     query('form((doc("http://'+IP+'/anno/4/J1/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();
     query('form((doc("http://'+IP+'/anno/4/J2/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();
     query('form((doc("http://'+IP+'/anno/4/J3/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();
     query('form((doc("http://'+IP+'/anno/4/J4/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();
end;

end.

