{$codepage utf8}
unit unitHTTP;                                                                   //Unité qui gère les échanges entre le programme et le seveur HTTP
{Unité s'occupant de la liaison entre le programme et le seveur HTTP (PHP)
Permetant l'envoi et la reception de données}

interface
uses
  Classes, SysUtils,Process, StrUtils, httpsend, laz_synapse, simpleinternet, xquery;



procedure DemarrerHttpServeur();                                                 //Execute un serveur appache portable Uwamp dans le dossier du programme
Procedure TelechargerSave(IP,Partie, Joueur : string);                           //Enregistre le contenu d'un fichier de savegarde en sur le serveur vers un fichier local
Procedure LirePret(IP, Partie, Joueur : string);                                 //Enregistre le contenu d'un fichier de signal de départ en sur le serveur vers un fichier local
procedure EnvoyerSave(IP, Partie, Joueur:String);                                //Envoie le contenu d'un fichier save local vers un serveur PHP où il sera enregistrer dans un fichier texte
procedure EnvoyerTxt(IP, Partie, Joueur, save:String);                           //Envoie le contenu d'une string 'save' vers un serveur PHP où il sera enregistrer dans un fichier texte
procedure EnvoyerPret(IP, Partie, Joueur:String);                                //Envoie la valeur 1 (désignant qu'un joueur est pret) vers un serveur PHP où il sera enregistrer dans un fichier texte
procedure ResetPret(IP, Partie, Joueur:String);                                  //Envoie la valeur 0 (désignant qu'un joueur n'est pas pret) vers un serveur PHP où il sera enregistrer dans un fichier texte
procedure EnvoyerQuitter(IP, Partie, Joueur:String);                             //Envoie la valeur 2 (désignant qu'un joueur veut quitter) vers un serveur PHP où il sera enregistrer dans un fichier texte
procedure RemiseAZeroPret(IP:String);                                            //Envoie la valeur 0 à toutes les pages 'pret' d'un serveur PHP où il sera enregistrer dans un fichier texte (On assigne 'non pret' à tous les joueurs)
procedure EnvoyerCommerce(IP,Partie,Joueur,echange : string);                    //Envoie le contenu d'une string échange vers un serveur PHP où il sera enregistrer dans un fichier texte
procedure LireCommerce(IP, Partie, Joueur : string);                             //Enregistre le contenu d'un fichier de commerce en sur le serveur vers un fichier local
procedure RemiseAZeroCommerce(IP, Partie : string);                              //Envoie une string d'échange nul vers toutes les pages PHP commerce (puis enregistrer dans un fichier texte)

implementation

procedure DemarrerHttpServeur();                                                 //Execute un serveur appache portable Uwamp dans le dossier du programme
var
  DemarrHttp: TProcess;                                                          //DamarreHTTP est un processus
begin
     DemarrHttp := TProcess.Create(nil);                                         //assigne le processus à nul
     DemarrHttp.CommandLine := 'UwAmp/UwAmp.exe';                                //indique au processus l'adresse de l'executable
     DemarrHttp.Execute;                                                         //execute l'executable
     DemarrHttp.Free;                                                            //termine le precessus
end;

Procedure TelechargerSave(IP,Partie, Joueur : string);                           //Enregistre le contenu d'un fichier de savegarde en sur le serveur vers un fichier local
var
  HTTPEnvoi : THTTPSend;
  HTTPGet : boolean;
  URL : String;

begin
     URL := Concat('http://'+IP+'/anno/'+Partie+'/'+Joueur+'/save.txt');         //adresse ULR de la sauvegarde
     HTTPEnvoi := THTTPSend.Create;                                              //Crée d'un processus d'envoi de requête HTTP
     HTTPGet := HTTPEnvoi.HTTPMethod('GET', URL);                                //défini la requête de type GET, dirigé vers l'adresse URL de la sauvegarde
     HTTPEnvoi.Document.SaveToFile('saves/multi/'+Partie+'/'+Joueur+'/save.txt');//Telecharge le ficher à cette adresse et l'enregistre dans un fichier local
     HTTPEnvoi.Free;                                                             //termine le processus
end;

Procedure LirePret(IP, Partie, Joueur : string);                                 //Enregistre le contenu d'un fichier de signal de départ en sur le serveur vers un fichier local
var
  HTTPEnvoi : THTTPSend;
  HTTPGet : boolean;
  URL : String;

begin
     URL := Concat('http://'+IP+'/anno/'+Partie+'/'+Joueur+'/pret.txt');         //adresse ULR du signal de départ
     HTTPEnvoi := THTTPSend.Create;                                              //Crée d'un processus d'envoi de requête HTTP
     HTTPGet := HTTPEnvoi.HTTPMethod('GET', URL);                                //défini la requête de type GET, dirigé vers l'adresse URL du signal de départ
     HTTPEnvoi.Document.SaveToFile('saves/multi/'+Partie+'/'+Joueur+'/pret.txt');//Telecharge le ficher à cette adresse et l'enregistre dans un fichier local
     HTTPEnvoi.Free;                                                             //termine le processus
end;

procedure EnvoyerSave(IP, Partie, Joueur:String);                                //Envoie le contenu d'un fichier save local vers un serveur PHP où il sera enregistrer dans un fichier texte
var
  save, adresseTxt : string;
  txtSaveFile : textfile;

begin
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/save.txt';                 //adresse ou se trouve la sauvegarde
     AssignFile(txtSaveFile, adresseTxt);                                        //transfert le contenu du ficher dans une variable de type texte
     reset(txtSaveFile);                                                         //ouverture ficher
     readln(txtSaveFile, save);                                                  //transfert du contenu de la variable type texte dans une variable string
     CloseFile(txtSaveFile);                                                     //fermeture du fichier
     query('form((doc("http://'+IP+'/anno/'+Partie+'/'+Joueur+'/save.php")//form)[1], {"textdata": $_1})', [save]).retrieve();     //envoi de la string 'save' dans un champ de type texte du form de la page PHP attribué à la sauvegarde de ce joueur
end;

procedure EnvoyerTxt(IP, Partie, Joueur, save:String);                           //Envoie le contenu d'une string 'save' vers un serveur PHP où il sera enregistrer dans un fichier texte

begin
     query('form((doc("http://'+IP+'/anno/'+Partie+'/'+Joueur+'/save.php")//form)[1], {"textdata": $_1})', [save]).retrieve();     //envoi de la string 'save' dans un champ de type texte du form de la page PHP attribué à la sauvegarde de ce joueur
end;

procedure EnvoyerPret(IP, Partie, Joueur:String);                                //Envoie la valeur 1 (désignant qu'un joueur est pret) vers un serveur PHP où il sera enregistrer dans un fichier texte

begin
     query('form((doc("http://'+IP+'/anno/'+Partie+'/'+Joueur+'/pret.php")//form)[1], {"textdata": $_1})', ['1']).retrieve();      //envoi de '1' dans un champ de type texte du form de la page PHP attribué au signal de départ de ce joueur
end;

procedure ResetPret(IP, Partie, Joueur:String);                                  //Envoie la valeur 0 (désignant qu'un joueur n'est pas pret) vers un serveur PHP où il sera enregistrer dans un fichier texte

begin
     query('form((doc("http://'+IP+'/anno/'+Partie+'/'+Joueur+'/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();      //envoi de '0' dans un champ de type texte du form de la page PHP attribué au signal de départ de ce joueur
end;

procedure EnvoyerQuitter(IP, Partie, Joueur:String);                             //Envoie la valeur 2 (désignant qu'un joueur veut quitter) vers un serveur PHP où il sera enregistrer dans un fichier texte

begin
     query('form((doc("http://'+IP+'/anno/'+Partie+'/'+Joueur+'/pret.php")//form)[1], {"textdata": $_1})', ['2']).retrieve();      //envoi de '2' dans un champ de type texte du form de la page PHP attribué au signal de départ de ce joueur
end;

procedure RemiseAZeroPret(IP:String);                                            //Envoie la valeur 0 à toutes les pages 'pret' d'un serveur PHP où il sera enregistrer dans un fichier texte (On assigne 'non pret' à tous les joueurs)
begin
     query('form((doc("http://'+IP+'/anno/2/J1/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();       //envoie de '0' dans un champ de type texte du form de la page PHP attribué au signal de départ de ce joueur
     query('form((doc("http://'+IP+'/anno/2/J2/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();       //
     query('form((doc("http://'+IP+'/anno/3/J1/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();       //
     query('form((doc("http://'+IP+'/anno/3/J2/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();       //
     query('form((doc("http://'+IP+'/anno/4/J1/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();       //
     query('form((doc("http://'+IP+'/anno/4/J2/pret.php")//form)[1], {"textdata": $_1})', ['0']).retrieve();       //
end;

procedure envoyerCommerce (IP, Partie, Joueur, echange : string);
begin
     query('form((doc("http://'+IP+'/anno/'+Partie+'/'+joueur+'/commerce.php")//form)[1], {"textdata": $_1})', [echange]).retrieve();      //envoi de la string 'echange' dans un champ de type texte du form de la page PHP attribué commerce de ce joueur
end;

Procedure LireCommerce(IP, Partie, Joueur : string);                             //Enregistre le contenu d'un fichier de commerce en sur le serveur vers un fichier local
var
  HTTPEnvoi : THTTPSend;
  HTTPGet : boolean;
  URL : String;

begin
     URL := Concat('http://'+IP+'/anno/'+Partie+'/'+Joueur+'/commerce.txt');     //adresse ULR du commerce
     HTTPEnvoi := THTTPSend.Create;                                              //Crée d'un processus d'envoi de requête HTTP
     HTTPGet := HTTPEnvoi.HTTPMethod('GET', URL);                                //défini la requête de type GET, dirigé vers l'adresse URL du commerce
     HTTPEnvoi.Document.SaveToFile('saves/multi/'+Partie+'/'+Joueur+'/commerce.txt'); //Telecharge le ficher à cette adresse et l'enregistre dans un fichier local
     HTTPEnvoi.Free;                                                             //termine le processus
end;

procedure RemiseAZeroCommerce(IP, Partie : string);                              //Envoie une string d'échange nul vers toutes les pages PHP commerce (puis enregistrer dans un fichier texte)
var
   null : string;
begin
     null := '0;0;0;0;0;0;0;';
     query('form((doc("http://'+IP+'/anno/'+Partie+'/J1/commerce.php")//form)[1], {"textdata": $_1})', [null]).retrieve();         //envoi de la string 'null' dans un champ de type texte du form de la page PHP attribué commerce de ce joueur
     query('form((doc("http://'+IP+'/anno/'+Partie+'/J2/commerce.php")//form)[1], {"textdata": $_1})', [null]).retrieve();         //
end;

end.

