unit GestionArmees;

{$codepage utf8}

interface

uses
  Classes, SysUtils, GestionEcran, MenuNouvellePartie, Ressource,AchatArmee,Population;

procedure ShowMenuArmees;          //Programme Principal du menu de gestion de l'Armée
procedure InformationGlobale;      //
procedure CadreArmees;             //Cadre global
procedure OptionsArmees;           //Option disponible pour le joueur
procedure Troupes;                 //Liste des troupes actuelles du joueur
procedure DessinSoldat1;           //Dessin du soldat n°1
procedure DessinSoldat2;           //Dessin du soldat n°2

implementation

procedure InformationGlobale;
begin
  //Données en haut à gauche (Nom du joueur et Or)
  deplacerCurseurXY(10, 2);
  Write('Nom du joueur  :  ', Perso.nom);
  deplacerCurseurXY(10, 3);
  Write('Or             :  ', getArgent);

end;

procedure CadreArmees;
begin
  //Cadre Générale
  dessinerCadreXY(0, 0, 198, 58, double, 15, 0);
  dessinerCadreXY(60, 0, 140, 4, double, 15, 0);
  deplacerCurseurXY(92, 2);
  Write('Gestion des Armées');
end;

procedure Troupes;
begin
  //Cadre
  dessinerCadreXY(64, 10, 136, 30, Simple, 15, 0);
  dessinerCadreXY(91, 9, 113, 11, Simple, 15, 0);
  deplacerCurseurXY(97, 10);
  Write('Vos troupes');

  //Contenu
  deplacerCurseurXY(67, 13);
  couleurTexte(5);
  Write('Troupes');
  couleurTexte(15);

  deplacerCurseurXY(70, 14);
  Write('Conscrits   :');
  deplacerCurseurXY(90, 14);
  Write(getConscrit);

  deplacerCurseurXY(70, 15);
  Write('Soldats     :');
  deplacerCurseurXY(90, 15);
  Write(getSoldat);

  deplacerCurseurXY(70, 16);
  Write('Fusiliers   :');
  deplacerCurseurXY(90, 16);
  Write(getFusilier);

  deplacerCurseurXY(67, 20);
  couleurTexte(5);
  Write('Statistiques');
  couleurTexte(15);

  deplacerCurseurXY(70, 21);
  Write('Conscrit    :');
  deplacerCurseurXY(90, 21);
  Write('5 points de vie  |   3 points d',chr(39),'attaque');

  deplacerCurseurXY(70, 22);
  Write('Soldat      :');
  deplacerCurseurXY(90, 22);
  Write('9 points de vie  |   6 points d',chr(39),'attaque');

  deplacerCurseurXY(70, 23);
  Write('Fusilier    :');
  deplacerCurseurXY(90, 23);
  Write('7 points de vie  |   11 points d',chr(39),'attaque');

end;

procedure OptionsArmees;
begin
  //Options des armées
  //Cadre
  dessinerCadreXY(64, 41, 136, 50, Simple, 11, 0);
  dessinerCadreXY(91, 40, 113, 42, Simple, 11, 0);
  deplacerCurseurXY(96, 41);
  CouleurTexte(11);
  Write(#200, #205, ' Options ', #205, #188);

  //Contenu
  deplacerCurseurXY(68, 43);
  Write('Recruter :');

  deplacerCurseurXY(71, 44);
  Write('1| Conscrit');
  deplacerCurseurXY(101, 44);
  Write('300 or, 3 tissus');

  deplacerCurseurXY(71, 45);
  Write('2| Soldat');
  deplacerCurseurXY(101, 45);
  Write('500 or, 10 tissus');

  deplacerCurseurXY(71, 46);
  Write('3| Fusilier');
  deplacerCurseurXY(101, 46);
  Write('700 or, 10 tissus, 2 armes');

  deplacerCurseurXY(71, 48);
  Write('0| Ne pas recruter');

end;

procedure DessinSoldat1;
var
  CurseurDessinSoldat1: coordonnees;

begin
  couleurTexte(15);
  deplacerCurseurXY(20, 17);
  CurseurDessinSoldat1 := positionCurseur();
  Write('       .---. ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('  ___ /_____\');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write(' /\.-`( ', Chr(39), '.', Chr(39), ' ) ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('/ /    \_-_/_  ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('\ `-.-"`', Chr(39), 'V', Chr(39), '//-.');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write(' `.__,   |// , \ ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('     |Ll //Ll|\ \ ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('     |__//   | \_\ ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('    /---|[]==| / / ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('    \__/ |   \/\/  ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('    /_   | Ll_\|   ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('     |`^"""^`|     ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('     |   |   |     ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('     |   |   |     ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('     |   |   |     ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('     |   |   |     ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('     L___l___J     ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('      |_ | _|      ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('     (___|___)     ');
  CurseurDessinSoldat1.y := CurseurDessinSoldat1.y + 1;
  deplacerCurseur(CurseurDessinSoldat1);
  Write('      ^^^ ^^^      ');
end;

procedure DessinSoldat2;
var
  CurseurDessinSoldat2: coordonnees;

begin
  couleurTexte(15);
  deplacerCurseurXY(160, 17);
  CurseurDessinSoldat2 := positionCurseur();
  Write('   |\       ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('   || .---. ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('   ||/_____\');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('   ||( ', Chr(39), '.', Chr(39), ' ) ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('   || \_-_/_  ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('   :-"`', Chr(39), 'V', Chr(39), '//-. ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('  / ,   |// , `\');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write(' / /|Ll //Ll|| |');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('/_/||__//   || |');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('\ \/---|[]==|| |');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write(' \/\__/ |   \| |');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write(' /\|_   | Ll_\ |');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write(' `--|`^"""^`||_|');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('    |   |   ||/ ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('    |   |   |  ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('    |   |   |  ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('    |   |   |  ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('    L___l___J  ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('     |_ | _|   ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('    (___|___)  ');
  CurseurDessinSoldat2.y := CurseurDessinSoldat2.y + 1;
  deplacerCurseur(CurseurDessinSoldat2);
  Write('     ^^^ ^^^   ');

end;

procedure ShowMenuArmees;
var
  choix: integer;
begin
  repeat
    effacerEcran;
    CadreArmees;
    InformationGlobale;
    Troupes;
    OptionsArmees;
    DessinSoldat1;
    DessinSoldat2;
    deplacerCurseurXY(71, 52);
    couleurTexte(15);
    Write('Quel est votre choix ?');
    deplacerCurseurXY(95, 52);
    Write('                  ');
    deplacerCurseurXY(95, 52);
    readln(choix);

    if (choix < 0) or (choix >= 4) then
    begin
      deplacerCurseurXY(71, 57);
      couleurTexte(12);
      Write('/!\');
      couleurTexte(15);
      Write('Veuillez écrire un choix valide!');
    end;

    if choix = 0 then
    begin
      deplacerCurseurXY(71, 57);
    end;

    if choix = 1 then
    begin
      deplacerCurseurXY(17,57);
      achat_conscrit();
      sleep(1000);
    end;

    if choix = 2 then
    begin
      deplacerCurseurXY(71, 57);
      achat_soldat();
      sleep(1000);
    end;

    if choix = 3 then
    begin
      deplacerCurseurXY(71, 57);
      achat_fusilier();
      sleep(1000);
    end;


  until (choix = 0);
end;

end.

