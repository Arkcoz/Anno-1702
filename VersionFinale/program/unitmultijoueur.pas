{$codepage utf8}
unit unitMultijoueur;                                                            //unité qui s'occupe de la synchronisation des deux programmes (joueur 1  et joueur 2)

interface

uses
  Classes, SysUtils, StrUtils, unitHTTP, unitTraitementDonnees, MenuNouvellePartie;

procedure RemiseAZeroRessources(IP, Partie, Joueur : String);                    //Réécrit le fichier sauvegarde local pour le joueur choisi, remettant toutes les variables à 0
procedure RemiseAZeroLocalPret(Partie, Joueur : String);                         //Réécrit le fichier du signal de départ local pour le joueur choisi, le remettant à 0
procedure rejoindreServeur(IP, Partie, Joueur : String);                         //Envoi le signal pret du joueur 2, attend celui du joueur 1 et télécharge la sauvegarde du joueur 1
procedure nouvellePartie2J(IP, Partie : string);                                 //Remet à 0 les fichiers pret des jourus, attends que l'autre joueur soit connecté et télécharge la sauvegarde du joueur 2
procedure DebutNouveauTour2J_S(IP, Partie : String);                             //Mets à jour les sauvergarde des deux joueurs
procedure DebutNouveauTour2J_C(IP,Partie : String);                              //Mets à jour les sauvergarde des deux joueurs
procedure FinNouveauTour_C(IP,Partie : string);                                  //attends le joueur un et vérifie s'il veut continuer ou quitter
procedure ContinuerOUQuitter_S(IP, Partie : String);                             //Propose au joueur 1 de continuer ou quitter la partie
procedure ContinuerOUQuitter_J2(IP, Partie : String);                            //Propose au joueur 2 de continuer ou quitter la partie
procedure MiseAJourDonnees_verser(IP,Partie, joueur :String);                    //Televerse la sauvegarde du joueur vers le serveur
procedure MiseAJourDonnees_charger(IP,Partie, joueur :String);                   //Télécharge la sauvegarde du joueur du serveur vers un fichier de sauvegarde local
procedure remiseAZeroPret_S(IP,Partie : String);                                 //Envoie au seveur que le joueur 1 n'est plus près à continuer la partie
function getNvTour:boolean;                                                      //Retourne la valeur de nvTour
procedure setNvTour(valeur : boolean);                                           //Assigne une valeur à nvTour
function getQuitterLaPartie: boolean;                                            //Retoune la valeur de QuitterLaPartie
procedure setQuitterLaPartie(valeur : boolean);                                  //Assigne une valeur à QuitterLaPartie
procedure RemiseAZeroCommerce(IP, Partie, Joueur : String);                      //Réécrit le fichier de commerce local pour le joueur choisi, remettant toutes les variables à 0

implementation
const
    Joueur1 = 'J1';                                                              //Facilite la lecture de tout ce qui se rapporte aux joueurs dans la suite du programme
    Joueur2 = 'J2';

var
   nbAdversaire, attenteJoueurs, attenteServeur : integer;
   QuitterlaPartie, nvTour : boolean;

   function getNvTour:boolean;                                                   //Retourne la valeur de nvTour
   begin
      getNvTour := nvTour;
   end;
                                                                                 //Assigne une valeur à nvTour
   procedure setNvTour(valeur : boolean);
   begin
      NvTour := valeur;
   end;
                                                                                 //Retoune la valeur de QuitterLaPartie
   function getQuitterLaPartie: boolean;
   begin
      getQuitterLaPartie := QuitterLaPartie;
   end;

   procedure setQuitterLaPartie(valeur : boolean);                               //Assigne une valeur à QuitterLaPartie
   begin
      QuitterLaPartie := valeur;
   end;


procedure RemiseAZeroRessources(IP, Partie, Joueur : String);                    //Réécrit le fichier sauvegarde local pour le joueur choisi, remettant toutes les variables à 0
var
   save, adresseTxt : string;
   txtSaveFile : textFile;
begin

     save :=  Concat(Perso.nom+';0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;');
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/save.txt';
     AssignFile(txtSaveFile, adresseTxt);
     rewrite(txtSaveFile);
     writeln(txtSaveFile, save);
     CloseFile(txtSaveFile);
     EnvoyerTxt(IP, Partie, Joueur, save);
end;

procedure RemiseAZeroCommerce(IP, Partie, Joueur : String);                      //Réécrit le fichier de commerce local pour le joueur choisi, remettant toutes les variables à 0
var
   save, adresseTxt : string;
   txtSaveFile : textFile;
begin

     save := '0;0;0;0;0;0;';
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/commerce.txt';
     AssignFile(txtSaveFile, adresseTxt);
     rewrite(txtSaveFile);
     writeln(txtSaveFile, save);
     CloseFile(txtSaveFile);
     EnvoyerTxt(IP, Partie, Joueur, save);
end;

procedure RemiseAZeroLocalPret(Partie, Joueur : String);                         //Réécrit le fichier du signal de départ local pour le joueur choisi, le remettant à 0
var
   save, adresseTxt : string;
   txtSaveFile : textFile;
begin

     save :=  '0';
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/pret.txt';
     AssignFile(txtSaveFile, adresseTxt);
     rewrite(txtSaveFile);
     writeln(txtSaveFile, save);
     CloseFile(txtSaveFile);
end;

function ChoixFinTour(IP, Partie: String):integer;                               //Programme qui attend que l'autre joueur fasse le choix de continuer ou quitter et renvoie son choix
const
   CONTINUER = 1;
   QUITTER = 2;

var
   StrChoixJ2, pretJ2txt : string;
   ChoixJ2 : Integer;
   TxtChoixJ2 : Textfile;


begin
     ChoixJ2 := 0;                                                               //choix du joueur initialisé à 0
     pretJ2txt := 'saves/multi/'+Partie+'/J2/pret.txt';                          //adresse du fichier contenant le signal de départ du joueur 2
     writeln('En attente des autres joueurs...');
     Repeat
          sleep(2000);                                                           //Avant de lire lefichier sur le serveur, attendre que l'auter joueur ait eu le temps de finir d'écrire dessus
          LirePret(IP,Partie, 'J2');
          AssignFile(TxtChoixJ2,pretJ2txt);                                      //lecture du fichier téléchargé
          reset(TxtChoixJ2);                                                     //ouverture ficher
          readln(TxtChoixJ2, StrChoixJ2);                                        //
          CloseFile(TxtChoixJ2);                                                 //
          StrChoixJ2 := ExtractDelimited(1,StrChoixJ2,StdWordDelims);            //
          if StrChoixJ2 <> '' then                                               //Si le fichier lu n'est pas vide
              ChoixJ2 := StrToInt(StrChoixJ2);                                   //le choix du joueur est égal à ce qu'il y a dans le fichier
     Until (ChoixJ2 = CONTINUER) OR (ChoixJ2 = QUITTER);                         //Le répeter tant que le choix ne correspond pas à CONTINUER ou QUITTER
     ChoixFinTour := ChoixJ2;

end;

function attendreServeur(IP, Partie : string):Integer;                           //Programme qui attend que le joueur 1 ait envoyé le signal de d&part
var
   StrChoixJ1, pretJ1txt : string;
   ChoixJ1 : Integer;
   TxtChoixJ1 : Textfile;


begin
     pretJ1txt := 'saves/multi/'+Partie+'/J1'+'/pret.txt';
     writeln('En attente du serveur...');
     repeat
           sleep(1000);
           LirePret(IP,Partie, 'J1');
           AssignFile(TxtChoixJ1,pretJ1txt);
           reset(TxtChoixJ1);
           readln(TxtChoixJ1, StrChoixJ1);
           CloseFile(TxtChoixJ1);
           StrChoixJ1 := ExtractDelimited(1,StrChoixJ1,StdWordDelims);
           if StrChoixJ1 <> '' then
              ChoixJ1 := StrToInt(StrChoixJ1);
     Until (ChoixJ1 = 1) OR (ChoixJ1 = 2);
     attendreServeur := 1;
end;

function attendreJoueurs(IP, Partie : string):Integer;                           //Programme qui attend que le joueur 2 ait envoyé le signal de départ

var
   nbJoueurs, debut, nbAttente : Integer;
   nbAttenteStr : string;

begin
     nbJoueurs := StrToInt(Partie);
     nbAttente := nbJoueurs - 1;
     nbAttenteStr := IntToStr(nbAttente);
     debut := ChoixFinTour(IP, Partie);
     writeln('En attente de '+nbAttenteStr+' joueur(s)...');
     While (debut <> nbAttente) do
           begin
                sleep(1000);
                writeln('En attente de '+nbAttenteStr+' joueur(s)...');
                debut := ChoixFinTour(IP, Partie);
             end;
     ResetPret(IP, Partie, 'J2');

     EnvoyerPret(IP, Partie, 'J1');
     attendreJoueurs := 1;
end;

procedure nouvellePartie2J(IP, Partie : string);                                 //Remet à 0 les fichiers pret des jourus, attends que l'autre joueur soit connecté et télécharge la sauvegarde du joueur 2

begin
  nbAdversaire := StrToInt(Partie)-1;
  RemiseAZeroPret(IP);
  RemiseAZeroLocalPret(Partie, 'J1');
  RemiseAZeroLocalPret(Partie, 'J2');
  attenteJoueurs := attendreJoueurs(IP, Partie);
  while (attenteJoueurs <> 1) do
        begin
          attenteJoueurs := attendreJoueurs(IP, Partie);
        end;
  writeln('Tous les joueurs sont connectés !');
  attenteJoueurs := 0;
  TelechargerSave(IP,Partie,Joueur2);
  ExtraireDonneesRessourceJ2(Partie);
end;


procedure rejoindreServeur(IP, Partie, Joueur : String);                         //Envoi le signal pret du joueur 2, attend celui du joueur 1 et télécharge la sauvegarde du joueur 1
begin
     RemiseAZeroRessources(IP, Partie, Joueur2);
     CompresserDonneesRessource(Partie,Joueur2);
     EnvoyerSave(IP,Partie, Joueur2);
     EnvoyerPret(IP, Partie, Joueur);
  attenteServeur := attendreServeur(IP, Partie);
  while (attenteServeur = 0) do
        begin
          attenteServeur := attendreServeur(IP, Partie);
        end;
  writeln('Vous etes bien connecté et la partie peut commecer !');
  attenteServeur := 0;
  TelechargerSave(IP,Partie,Joueur1);
  ExtraireDonneesRessourceJ1(Partie);
end;

procedure FinNouveauTourServeur(IP, Partie : string);                            //attends le joueur 2 et vérifie s'il veut continuer ou quitter

begin
     nbAdversaire := StrToInt(Partie)-1;
      attenteJoueurs := ChoixFinTour(IP, Partie);
      While (attenteJoueurs < nbAdversaire) do
            begin
                 sleep(1000);
                 attenteJoueurs := ChoixFinTour(IP, Partie);
            end;
      if (attenteJoueurs > nbAdversaire) then
         begin
              writeln('Fin de la partie');
              EnvoyerQuitter(IP,Partie,Joueur1);
              CompresserDonneesRessource(Partie,Joueur2);
              QuitterlaPartie := TRUE;
         end
      Else
          begin
               EnvoyerPret(IP,Partie,Joueur1);
               nvTour:=TRUE;
          end;
      end;

procedure DebutNouveauTour2J_S(IP, Partie : String);                             //Mets à jour les sauvergarde des deux joueurs
begin
      sleep(2000);
      ResetPret(IP,Partie,Joueur1);
      TelechargerSave(IP, Partie,Joueur1);
      TelechargerSave(IP, Partie,Joueur2);
      ExtraireSesDonneesRessource(Partie, Joueur1);
      ExtraireDonneesRessourceJ2(Partie);
end;

procedure DebutNouveauTour2J_C(IP,Partie : String);                              //Mets à jour les sauvergarde des deux joueurs
begin
  TelechargerSave(IP,Partie,Joueur2);
  ExtraireSesDonneesRessource(Partie, Joueur2);
  TelechargerSave(IP,Partie,Joueur1);
  ExtraireDonneesRessourceJ1(Partie);
end;

procedure FinNouveauTour_C(IP,Partie : string);                                  //attends le joueur un et vérifie s'il veut continuer ou quitter
begin
   EnvoyerPret(IP,Partie,Joueur2);
   attenteServeur := attendreServeur(IP, Partie);
   while (attenteServeur = 0) do
        begin
             attenteServeur := attendreServeur(IP, Partie);
        end;
   If attenteServeur = 2 then
      begin
           writeln('Un autre joueur a décidé de quitter');
           CompresserDonneesRessource(Partie, Joueur2);
           EnvoyerSave(IP,Partie,Joueur2);
           QuitterlaPartie := TRUE
      end
   Else
       if attenteServeur = 1 then
          begin
               nvTour:=TRUE;
               writeln('Nouveau Tour :');
          end;
   ResetPret(IP,Partie,Joueur2);
end;

procedure ContinuerOUQuitter_S(IP, Partie : String);                             //Propose au joueur 1 de continuer ou quitter la partie
var
   continue : integer;
begin
   CompresserDonneesRessource(Partie,Joueur1);
   EnvoyerSave(IP, Partie, Joueur1);
   writeln('Continuer : 1 | Quitter : 2');
   readln(continue);
   while ((continue <>1) AND (continue <> 2)) do
        begin
             writeln('Veuillez entrer une valeur correcte');
             readln(continue);
        end;
   case (continue) of
   1 : FinNouveauTourServeur(IP, Partie);
   2 : begin
        EnvoyerQuitter(IP, Partie, Joueur1);
        setQuitterlaPartie(TRUE);
        end;
   end;

end;

procedure ContinuerOUQuitter_J2(IP, Partie : string);                            //Propose au joueur 2 de continuer ou quitter la partie
var
   continue : integer;
begin
   CompresserDonneesRessource(Partie, Joueur2);
   EnvoyerSave(IP,Partie,Joueur2);
      writeln('Continuer : 1 | Quitter : 2');
   readln(continue);
   while (continue <> 1) AND (continue <> 2) do
        begin
             writeln('Veuillez entrer une valeur correcte');
             readln(continue);
        end;
   case (continue) of
   1 : FinNouveauTour_C(IP, Partie);
   2 : begin
        EnvoyerQuitter(IP, Partie, Joueur2);
        setQuitterlaPartie(TRUE);
        end;
   end;

end;

procedure MiseAJourDonnees_verser(IP,Partie, Joueur :String);                    //Televerse la sauvegarde du joueur vers le serveur
begin
     CompresserDonneesRessource(Partie, Joueur);
     EnvoyerSave(IP,Partie,Joueur);
end;

procedure MiseAJourDonnees_charger(IP,Partie, Joueur :String);                   //Télécharge la sauvegarde du joueur du serveur vers un fichier de sauvegarde local
begin
     if joueur = 'J1' then
     begin
        TelechargerSave(IP, Partie, Joueur1);
        ExtraireDonneesRessourceJ1(Partie);
     end
     else
         if joueur = 'J2' then
         begin
            TelechargerSave(IP, Partie,Joueur2);
            ExtraireDonneesRessourceJ2(Partie);
         end;
end;



procedure remiseAZeroPret_S(IP,Partie : String);                                 //Envoie au seveur que le joueur 1 n'est plus près à continuer la partie
begin
   ResetPret(IP,Partie,Joueur1);
end;


end.

