unit Difficulte;
{$codepage utf8}

interface

uses
  Classes, SysUtils, GestionEcran, Ressource;

procedure choixNiveau(); // Procédure qui donne au joueur le choix entre différentes difficultés
function getNiveauActuelEcrit(): string; // Retourne le niveau choisi.

implementation
var
  NiveauChoisi : string; // Variable de type string qui stock le niveau choisi par l'utilisateur


function getNiveauActuelEcrit(): string;
begin
  getNiveauActuelEcrit:= NiveauChoisi;
end;

// Le joueur choisit un niveau de difficulté en fonction de son choix on appelle la procédure d'initialisation des ressources liées à la difficulté sélectionnée.
procedure choixNiveau();

var
  choix:integer; // Variable de type entière tapé par l'utilisateur

begin
  // Affichage
  deplacerCurseurXY(92,24);
  CouleurTexte(12);
  write(' DIFFICULTE ');
  dessinerCadreXY(82,25,113,35,simple,15,0);
  couleurTexte(12);

  deplacerCurseurXY(85,27);
  couleurTexte(11);
  write(' 1| FACILE ');

  deplacerCurseurXY(85,28);
  couleurTexte(11);
  write(' 2| NORMAL ');

  deplacerCurseurXY(85,29);
  couleurTexte(11);
  write(' 3| DIFFICILE ');

  deplacerCurseurXY(85,30);
  couleurTexte(11);
  write(' 4| DÉCOUVERTE  ');
  repeat
        deplacerCurseurXY(85,33);
        couleurTexte(15);
        write('Quel est votre choix ?');
        deplacerCurseurXY(109,33);
        readln(choix);


        if ((choix<1) OR (choix>4)) then  // Affiche un message d'erreur lorsque le choix est invalide
           begin
              deplacerCurseurXY(80,37);
              couleurTexte(12);
              write('/!\');
              couleurTexte(15);
              write('Veuillez écrire un choix valide!');
              deplacerCurseurXY(109,33);
              write('    ',#179,'                  ');
           end;
        // Si choix valide on effectue une de ces conditions.
        if choix=1 then
           begin
                deplacerCurseurXY(80,37);
                write('                                                     ');
                deplacerCurseurXY(80,36);
                write('                                                     ');
                deplacerCurseurXY(83,37);
                write('Vous avez choisi le mode ');
                couleurTexte(10);
                write('Facile');
                deplacerCurseurXY(115,37);
                readln;
                initialisation_player_easy(); // On initialise l'inventaire du joueur
                effacerecran();

                NiveauChoisi:='Facile';
                Inv.NivActuel:=modFacile;
           end;
        if choix=2 then
           begin
                deplacerCurseurXY(80,37);
                write('                                                     ');
                deplacerCurseurXY(80,36);
                write('                                                     ');
                deplacerCurseurXY(83,37);
                write('Vous avez choisi le mode ');
                couleurTexte(8);
                write('Normal');
                deplacerCurseurXY(115,37);
                readln;
                initialisation_player_normal(); // On initialise l'inventaire du joueur
                effacerecran();

                NiveauChoisi:='Normal';
                Inv.NivActuel:=modNormal;
           end;
        if choix=3 then
           begin
                deplacerCurseurXY(80,37);
                write('                                                     ');
                deplacerCurseurXY(80,36);
                write('                                                     ');
                deplacerCurseurXY(81,37);
                write('Vous avez choisi le mode ');
                couleurTexte(12);
                write('Difficile');
                deplacerCurseurXY(116,37);
                readln;
                initialisation_player_hard();  // On initialise l'inventaire du joueur
                effacerecran();

                NiveauChoisi:='Difficile';
                Inv.NivActuel:=modDifficile;
           end;
        if choix=4 then
           begin
                deplacerCurseurXY(80,37);
                write('                                                     ');
                deplacerCurseurXY(80,36);
                write('                                                     ');
                deplacerCurseurXY(81,37);
                write('Vous avez choisi le mode ');
                couleurTexte(13);
                write('Découverte');
                deplacerCurseurXY(117,37);
                readln;
                initialisation_player_decouverte();  // On initialise l'inventaire du joueur
                effacerecran();
                NiveauChoisi:='Découverte';
                Inv.NivActuel:=modDecouverte;
           end;

  until (choix=1) OR (choix=2) OR (choix=3) OR (choix=4) ;
end;

end.


