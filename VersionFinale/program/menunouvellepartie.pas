unit MenuNouvellePartie;

{$codepage utf8}

interface

uses
  Classes, SysUtils,GestionEcran;

procedure bordureSaisitNom();
procedure NouvellePartie;
procedure MenuNouvellePartieMulti_C;

type Personnage = record
  nom : String;
end;

var
  Perso, PersoJ1, PersoJ2 : Personnage;
  pos:coordonnees;
  IP, Partie : String;

implementation
const
// Constante pour définir la position de l'affichage du de saisie du nom de l'utilisateur
  X_SET_NAME=85;
  Y_SET_NAME=30;
  X_NEW_GAME=84;
  Y_NEW_GAME=2;

// Procédure qui affiche le menu pour la saisie du nom de l'utilisateur
procedure bordureSaisitNom;


begin
  // Affichage
  effacerEcran;
  dessinerCadreXY(0,0,198,58,Double,15,0);
  dessinerCadreXY(60,0,140,4,Double,15,0);
  pos.x:=X_NEW_GAME;
  pos.y:=Y_NEW_GAME;
  ecrireEnPosition(pos,'<CREATION D''UNE NOUVELLE PARTIE>');
  dessinerCadreXY(82,28,113,35,simple,15,0);
  couleurTexte(12);
  pos.x:=X_SET_NAME;
  pos.y:=Y_SET_NAME;
  ecrireEnPosition(pos,'< Saisissez votre pseudo >');
  // On repète tant que le nom saisie n'est pas vide
  repeat
    deplacerCurseurXY(90,32);
    couleurTexte(15);
    readln(Perso.nom); // On stock le nom dans Perso.nom
    if Perso.nom='' then // Si le nom est vide on afiche un message d'erreur
       begin
          deplacerCurseurXY(84,36);
          couleurTexte(12);
          write('/!\');
          couleurTexte(15);
          write('Veuillez écrire un pseudo !');
       end;
  until (Perso.nom<>'');
end;

// Procédure qui permet d'afficher le menu de création d'un joueur.
procedure NouvellePartie;
begin
     bordureSaisitNom;
end;

procedure MenuNouvellePartieMulti_C;

begin
  effacerEcran;
  dessinerCadreXY(0,0,198,58,Double,15,0);
  dessinerCadreXY(60,0,140,4,Double,15,0);
  pos.x:=X_NEW_GAME;
  pos.y:=Y_NEW_GAME;
  ecrireEnPosition(pos,'<CREATION D''UNE NOUVELLE PARTIE>');
  dessinerCadreXY(82,28,113,35,simple,15,0);
  couleurTexte(12);
  pos.x:=X_SET_NAME;
  pos.y:=Y_SET_NAME;
  ecrireEnPosition(pos,'< Saisissez votre pseudo >');
  repeat
    deplacerCurseurXY(90,32);
    couleurTexte(15);
    readln(Perso.nom);
    if Perso.nom='' then
       begin
          deplacerCurseurXY(84,36);
          couleurTexte(12);
          write('/!\');
          couleurTexte(15);
          write('Veuillez écrire un pseudo !');
       end;
  until (Perso.nom<>'');
  effacerEcran;
  pos.x:=X_SET_NAME;
  pos.y:=Y_SET_NAME;
  ecrireEnPosition(pos,'< Saisissez l`IP >');
    repeat
    deplacerCurseurXY(90,32);
    couleurTexte(15);
    readln(IP);
    if IP='' then
       begin
          deplacerCurseurXY(84,36);
          couleurTexte(12);
          write('/!\');
          couleurTexte(15);
          write('Veuillez écrire une IP !');
       end;
    until (IP<>'');
end;

end.

