unit GestionBatiments;

{$codepage utf8}
interface

uses
  Classes, SysUtils,GestionEcran,MenuNouvellePartie,MenuConnexion,Ressource,AchatBatiments;

procedure ShowMenuBatiments;
procedure Maisons;
procedure Industries;
procedure InformationGlobale;
procedure CadreBatiments;
procedure OptionsIle;
procedure AchatReussi;

implementation
procedure Maisons;
begin
  //Liste des Maisons
//Cadre
  dessinerCadreXY(10,10,95,20,Simple,15,0);
  dessinerCadreXY(41,9,63,11,Simple,15,0);
  deplacerCurseurXY(49,10);
  write('Maisons');

//Contenu
  deplacerCurseurXY(17,13);
  write('1| Maisons de Colons');
  deplacerCurseurXY(50,13);
  write('2 Bois');

  deplacerCurseurXY(17,14);
  write('2| Maisons de Citoyens');
  deplacerCurseurXY(50,14);
  write('1 Bois, 1 Outils, 1 Maison de Colons');

end;


procedure Industries;
begin
     //Liste des Ressources
//Cadre
  dessinerCadreXY(105,10,190,55,Simple,15,0);
  dessinerCadreXY(135,9,158,11,Simple,15,0);
  deplacerCurseurXY(142,10);
  write('Industries');

//Contenu
  deplacerCurseurXY(112,13);
  write('3| Cabanes de bûcheron');
  deplacerCurseurXY(161,13);
  write('50 or, 3 Outils');

  deplacerCurseurXY(112,14);
  write('4| Cabanes de pêcheur');
  deplacerCurseurXY(161,14);
  write('100 or, 5 Bois, 3 Outils');

  deplacerCurseurXY(112,15);
  write('5| Bergeries');
  deplacerCurseurXY(161,15);
  write('200 or, 4 Bois, 2 Outils');

  deplacerCurseurXY(112,16);
  write('6| Ateliers de tisserands');
  deplacerCurseurXY(161,16);
  write('300 or, 3 Bois, 2 Outils');

end;

procedure InformationGlobale;
begin
     //Données en haut à gauche (Nom du joueur et Or)
  deplacerCurseurXY(10,2);
  write('Nom du joueur  :  ',Perso.nom);
  deplacerCurseurXY(10,3);
  write('Or             :  ',getArgent);

end;

procedure CadreBatiments;
begin
  //Cadre Générale
  dessinerCadreXY(0,0,198,58,Double,15,0);
  dessinerCadreXY(60,0,140,4,Double,15,0);
  deplacerCurseurXY(82,2);
  write('Gestion des bâtiments de Dayfell Cay');
end;

procedure OptionsIle;
begin
  //Options
//Cadre
  dessinerCadreXY(10,45,95,50,Simple,11,0);
  dessinerCadreXY(41,44,63,46,Simple,11,0);
  deplacerCurseurXY(46,45);
  CouleurTexte(11);
  write(#200,#205,' Options ',#205,#188);

//Contenu
  deplacerCurseurXY(17,48);
  write('0| Ne rien construire');


end;
procedure AchatReussi;
begin
  effacerEcran;
  deplacerCurseurXY(46,45);
  write('Achat Reussi');
end;

procedure ShowMenuBatiments;
var
  choix:integer;
begin
  repeat
        effacerEcran;
        CadreBatiments;
        InformationGlobale;
        Maisons;
        Industries;
        OptionsIle;
        deplacerCurseurXY(17,52);
        couleurTexte(15);
        write('Quel est votre choix ?');
        deplacerCurseurXY(41,52);
        readln(choix);

        if (choix<0) OR (choix>7) then
           begin
              deplacerCurseurXY(17,57);
              couleurTexte(12);
              write('/!\');
              couleurTexte(15);
              write('Veuillez écrire un choix valide!');
              readln;
           end;
        if choix=0 then
           begin
                deplacerCurseurXY(17,57);
           end;
        if choix=1 then
           begin
                deplacerCurseurXY(17,57);
                achat_maison_colon();
                sleep(1000);
           end;
        if choix=2 then
           begin
                deplacerCurseurXY(17,57);
                achat_maison_citoyen();
                sleep(1000);
           end;
        if choix=3 then
           begin
                deplacerCurseurXY(17,57);
                cabane_de_bucheron();
                sleep(1000);
           end;
        if choix=4 then
           begin
                deplacerCurseurXY(17,57);
                cabane_de_pecheur();
                sleep(1000);
           end;
        if choix=5 then
           begin
                deplacerCurseurXY(17,57);
                bergeries();
                sleep(1000);
           end;
        if choix=6 then
           begin
                deplacerCurseurXY(17,57);
                atelier_de_tisserands();
                sleep(1000);
           end;

  until (choix=0);
end;

end.

