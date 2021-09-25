{$codepage utf8}
unit commerceBackEnd;                                                            //unité qui gère les échanges d'informations entre les deux joueurs sur tout ce qui concerne le commerce

interface

uses
  Classes, SysUtils, StrUtils, unitHTTP, MenuNouvellePartie, Ressource, ProposerCommerce;

procedure envoiEchange(IP,Partie, joueur : string);                              //Envoie la proposition d'écange d'un joueur au serveur HTTP
function checkEchange(IP, Partie, Joueur : string):boolean;                      //Renvoie Vrai si le joueur a proposé un échange et Faux dans le cas contraire
function resumeEchange(IP, Partie, joueur : string):string;                      //Renvoie une phrase résumant la proposition d'échange d'un joueur
function checkReponse(IP, Partie, Joueur : string):integer;                      //Renvoie la réponse à un échange d'un joueur
function attendreAouR(IP, Partie, Joueur : string):integer;                      //Attends et renvoie la réponse du joueur à qui on a proposé l'échange
procedure envoyerAccepter(IP, Partie, joueur : string);                          //Envoie au serveur les données de l'échange formulé (0 si aucun formulé) plus la valeur 1 signifiant accepté
procedure envoyerRefuser(IP, Partie, joueur : string);                           //Envoie au serveur les données de l'échange formulé (0 si aucun formulé) plus la valeur 2 signifiant un refus
procedure RAZCommerce(IP, Partie : string);                                      //Remet les données des échanges à 0 dans les fichiers locaux et les envoie au serveur

function getRessourceDonnee_S(IP, Partie, Joueur : string):integer;              //Revoie la valeur de la ressource voule d'un échange envoyé par un joueur
function getQteDonnee_S(IP, Partie, Joueur : string):integer;                    //Revoie la valeur de la quantité de la ressource donnee d'un échange envoyé par un joueur
function getRessourceVoulue_S(IP, Partie, Joueur : string):integer;              //Revoie la valeur de la ressource voule d'un échange envoyé par un joueur
function getQteVoulue_S(IP, Partie, Joueur : string):integer;                    //Revoie la valeur de la quantité de la ressource voule d'un échange envoyé par un joueur

implementation
var
  echangePropose : integer;

procedure envoiEchange(IP, Partie, joueur : string);                             //Envoie la proposition d'écange d'un joueur au serveur HTTP
var
  echange : string;

  begin
       echange := concat('1;'+IntToStr(getRessourceDonnee)+';'+IntToStr(getQteDonnee)+';'+IntToStr(getRessourceVoulue)+';'+IntToStr(getQteVoulue)+';0;');
       write('Proposition bien envoyée');
       envoyerCommerce(IP, Partie, joueur, echange);
  end;

function checkEchange(IP, Partie, Joueur : string):boolean;                      //Renvoie Vrai si le joueur a proposé un échange et Faux dans le cas contraire
var
 strSave, adresseTxt : string;
txtSaveFile : textFile;

begin
     LireCommerce(IP,Partie,Joueur);
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/commerce.txt';
     AssignFile(txtSaveFile, adresseTxt);
     reset(txtSaveFile);
     readln(txtSaveFile, strSave);
     CloseFile(txtSaveFile);
     echangePropose := StrToInt(ExtractDelimited(1,strSave,StdWordDelims));

     case echangePropose of
     0 : checkEchange := FALSE;
     1 : checkEchange := TRUE;
     end;

end;

function checkReponse(IP, Partie, Joueur : string):integer;                      //Renvoie la réponse à un échange d'un joueur
var
 strSave, adresseTxt : string;
txtSaveFile : textFile;

begin
     sleep(1000);
     LireCommerce(IP,Partie,Joueur);
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/commerce.txt';
     AssignFile(txtSaveFile, adresseTxt);
     reset(txtSaveFile);
     readln(txtSaveFile, strSave);
     CloseFile(txtSaveFile);
     checkReponse := StrToInt(ExtractDelimited(6,strSave,StdWordDelims));
end;


function resumeEchange(IP, Partie,joueur : string):string;                       //Renvoie une phrase résumant la proposition d'échange d'un joueur
var
 QteDonnee, QteVoulue : integer;
 RessourceDonnee, RessourceVoulue, nom, adressetxt, strsave : string;
 txtsavefile : textfile;
begin
     LireCommerce(IP,Partie,Joueur);
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/commerce.txt';
     AssignFile(txtSaveFile, adresseTxt);
     reset(txtSaveFile);
     readln(txtSaveFile, strSave);
     CloseFile(txtSaveFile);

     RessourceDonnee := ExtractDelimited(2,strSave,StdWordDelims);
     QteDonnee := StrToInt(ExtractDelimited(3,strSave,StdWordDelims));
     RessourceVoulue := ExtractDelimited(4,strSave,StdWordDelims);
     QteVoulue := StrToInt(ExtractDelimited(5,strSave,StdWordDelims));

     case RessourceDonnee of
     '1': RessourceDonnee := 'Poisson';
     '2': RessourceDonnee := 'Bois';
     '3': RessourceDonnee := 'Outils';
     '4': RessourceDonnee := 'Laine';
     '5': RessourceDonnee := 'Tissu';
     '6': RessourceDonnee := 'Argent';
     end;

     case RessourceVoulue of
     '1': RessourceVoulue := 'Poisson';
     '2': RessourceVoulue := 'Bois';
     '3': RessourceVoulue := 'Outils';
     '4': RessourceVoulue := 'Laine';
     '5': RessourceVoulue := 'Tissu';
     '6': RessourceVoulue := 'Argent';
     end;

     case joueur of
     'J1' : nom := PersoJ1.nom;
     'J2' : nom := PersoJ2.nom;
     end;

     resumeEchange := concat(nom,' propose un échange : il vous donne ', IntToStr(QteDonnee), ' ', RessourceDonnee, ' contre ', IntToStr(QteVoulue), ' ', RessourceVoulue,'.');
end;


function attendreAouR(IP, Partie, Joueur : string):integer;                      //Attends et renvoie la réponse du joueur à qui on a proposé l'échange
var
 reponse : integer;
 moi : string;
begin
     attendreAouR := 0;
     repeat
           reponse := checkReponse(IP, Partie, Joueur);
     until((reponse = 1) OR (reponse = 2));

     case joueur of
     'J1' : moi := 'J2';
     'J2' : moi := 'J1';
     end;

     case reponse of
     1 : attendreAouR := 1;
     2 : attendreAouR := 2;

     end;
end;

procedure envoyerAccepter(IP, Partie, joueur : string);                          //Envoie au serveur les données de l'échange formulé (0 si aucun formulé) plus la valeur 1 signifiant accepté
var
echange : string;

begin
     echange := concat('1;'+IntToStr(getRessourceDonnee)+';'+IntToStr(getQteDonnee)+';'+IntToStr(getRessourceVoulue)+';'+IntToStr(getQteVoulue)+';1;');
     envoyerCommerce(IP, Partie, joueur, echange);
end;

procedure envoyerRefuser(IP, Partie, joueur : string);                           //Envoie au serveur les données de l'échange formulé (0 si aucun formulé) plus la valeur 2 signifiant un refus
var
echange : string;

begin
     echange := concat('1;'+IntToStr(getRessourceDonnee)+';'+IntToStr(getQteDonnee)+';'+IntToStr(getRessourceVoulue)+';'+IntToStr(getQteVoulue)+';2;');
     envoyerCommerce(IP, Partie, joueur, echange);
end;

procedure RAZCommerce(IP, Partie : string);                                      //Remet les données des échanges à 0 dans les fichiers locaux et les envoie au serveur
begin
     RemiseAZeroCommerce(IP, Partie);
     LireCommerce(IP, Partie, 'J1');
     LireCommerce(IP, Partie, 'J2');
end;


function getRessourceDonnee_S(IP, Partie, Joueur : string):integer;              //Revoie la valeur de la ressource donnée d'un échange envoyé par un joueur
var
 adressetxt, strsave: string;
 txtsavefile : textfile;
begin
     LireCommerce(IP,Partie,Joueur);
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/commerce.txt';
     AssignFile(txtSaveFile, adresseTxt);
     reset(txtSaveFile);
     readln(txtSaveFile, strSave);
     CloseFile(txtSaveFile);

     getRessourceDonnee_S := StrToInt(ExtractDelimited(2,strSave,StdWordDelims));

end;
function getQteDonnee_S(IP, Partie, Joueur : string):integer;                    //Revoie la valeur de la quantité de la ressource donnee d'un échange envoyé par un joueur
var
 adressetxt, strsave: string;
 txtsavefile : textfile;
begin
     LireCommerce(IP,Partie,Joueur);
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/commerce.txt';
     AssignFile(txtSaveFile, adresseTxt);
     reset(txtSaveFile);
     readln(txtSaveFile, strSave);
     CloseFile(txtSaveFile);

     getQteDonnee_S := StrToInt(ExtractDelimited(3,strSave,StdWordDelims));

end;

function getRessourceVoulue_S(IP, Partie, Joueur : string):integer;              //Revoie la valeur de la ressource voule d'un échange envoyé par un joueur
var
 adressetxt, strsave: string;
 txtsavefile : textfile;
begin
     LireCommerce(IP,Partie,Joueur);
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/commerce.txt';
     AssignFile(txtSaveFile, adresseTxt);
     reset(txtSaveFile);
     readln(txtSaveFile, strSave);
     CloseFile(txtSaveFile);

     getRessourceVoulue_S := StrToInt(ExtractDelimited(4,strSave,StdWordDelims));

end;

function getQteVoulue_S(IP, Partie, Joueur : string):integer;                    //Revoie la valeur de la quantité de la ressource voule d'un échange envoyé par un joueur
var
 adressetxt, strsave : string;
 txtsavefile : textfile;
begin
     LireCommerce(IP,Partie,Joueur);
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/commerce.txt';
     AssignFile(txtSaveFile, adresseTxt);
     reset(txtSaveFile);
     readln(txtSaveFile, strSave);
     CloseFile(txtSaveFile);

     getQteVoulue_S := StrToInt(ExtractDelimited(5,strSave,StdWordDelims));

end;

end.

