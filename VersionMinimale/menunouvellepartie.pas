unit MenuNouvellePartie;

{$codepage utf8}

interface

uses
  Classes, SysUtils,GestionEcran;

procedure bordureSaisitNom();
procedure NouvellePartie;

type Personnage = record
  nom : String;
end;

var
  Perso : Personnage;
  pos:coordonnees;
implementation

procedure bordureSaisitNom;
const
  X_SET_NAME=85;
  Y_SET_NAME=30;
  X_NEW_GAME=84;
  Y_NEW_GAME=2;

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
end;

procedure NouvellePartie;
begin
     bordureSaisitNom;
end;

end.

