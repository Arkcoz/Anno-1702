unit CombatPirate;
{$codepage utf8}

interface

uses
  Classes, SysUtils,Temps,GestionEcran,Ressource,Population;

type Combat = record
  NbrPirate : Integer;
  NbrTroupe : Integer;
  ViePirate : Integer;
  VieTroupe : Integer;
  AttaquePirate : Integer;
  AttaqueTroupe : Integer;
  Somme : Integer;
end;

var
  Com : Combat;

  //Nombres de Pirate
function getNbrPirate() : Integer;
procedure setNbrPirate(valeur : integer);

  //Nombres de troupe
function getNbrTroupe() : Integer;
procedure setNbrTroupe(valeur : integer);

  //Vie des pirates
function getViePirate() : Integer;
procedure setViePirate(valeur : integer);

  //Vie des troupes
function getVieTroupe() : Integer;
procedure setVieTroupe(valeur : integer);

  //Attaque des pirates
function getAttaquePirate() : Integer;
procedure setAttaquePirate(valeur : integer);

  //Attaque des troupes
function getAttaqueTroupe() : Integer;
procedure setAttaqueTroupe(valeur : integer);

  //Somme à payer pour fuir
function getSomme() : Integer;
procedure setSomme(valeur : integer);

procedure SurprisePirate();         //Affichage de l'avertissement de l'attaque par des pirates
procedure CadrePirate();            //Cadre d'information des pirates
procedure ConditionPirate();        //Calcul du nombre de pirate qui apparait
procedure InterfaceCombat();        //Affichage de l'interface de combat
procedure Payer();                  //Procedure choix de payer
procedure Attaquer();               //Procedure choix d'attaque
procedure InformationGlobale();     //Information Globale (Nom joueur + Argent)
procedure MettreTroupeA0();         //Remise à 0 des troupes (en cas de défaite face au pirate)
procedure LogoTeteDeMort();         //Affichage du logo Tete de Mort
procedure dessinPirateVivant();     //Affichage du dessin de Pirate Vivant
procedure dessinPirateMort();       //Affichage du dessin de Pirate Mort
procedure dessinVS();               //Affichage du dessin "VS"
procedure dessinSoldatVivant();     //Affichage du dessin Soldat Vivant
procedure dessinSoldatMort();       //Affichage du dessin Soldat Mort

implementation

//Nombre de Pirate
function getNbrPirate() : Integer;
begin
     getNbrPirate := Com.NbrPirate;
end;

procedure setNbrPirate(valeur : integer);
begin
     Com.NbrPirate := valeur;
end;

//Nombre de membres dans vos troupes
function getNbrTroupe() : Integer;
begin
     getNbrTroupe := Com.NbrTroupe;
end;

procedure setNbrTroupe(valeur : integer);
begin
     Com.NbrTroupe := valeur;
end;

//Vie des Pirates
function getViePirate() : Integer;
begin
     getViePirate := Com.ViePirate;
end;

procedure setViePirate(valeur : integer);
begin
     Com.ViePirate := valeur;
end;

//Vie des Troupes
function getVieTroupe() : Integer;
begin
     getVieTroupe := Com.VieTroupe;
end;

procedure setVieTroupe(valeur : integer);
begin
     Com.VieTroupe := valeur;
end;

//Attaque des Pirates
function getAttaquePirate() : Integer;
begin
     getAttaquePirate := Com.AttaquePirate;
end;

procedure setAttaquePirate(valeur : integer);
begin
     Com.AttaquePirate := valeur;
end;

//Attaque des Troupes
function getAttaqueTroupe() : Integer;
begin
     getAttaqueTroupe := Com.AttaqueTroupe;
end;

procedure setAttaqueTroupe(valeur : integer);
begin
     Com.AttaqueTroupe := valeur;
end;

//Somme à payer pour fuire
function getSomme() : Integer;
begin
     getSomme := Com.Somme;
end;

procedure setSomme(valeur : integer);
begin
     Com.Somme := valeur;
end;

//Dessin des Troupes
procedure dessinSoldatMort();
var
  CurseurDessin: coordonnees;

begin
  couleurTexte(15);
  CurseurDessin := positionCurseur();
  Write('   |\');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('   || .---. ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('   ||/_____\');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('   ||( X.X ) ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('   || \_-_/_  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('   :-"`', Chr(39), 'V', Chr(39), '//-. ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('  / ,   |// , `\');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write(' / /|Ll //Ll|| |');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('/_/||__//   || |');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('\ \/---|[]==|| |');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write(' \/\__/ |   \| |');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write(' /\|_   | Ll_\ |');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write(' `--|`^"""^`||_|');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    |   |   ||/ ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    |   |   |  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    |   |   |  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    |   |   |  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    L___l___J  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('     |_ | _|   ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    (___|___)  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('     ^^^ ^^^   ');

end;

procedure dessinSoldatVivant();
var
  CurseurDessin: coordonnees;

begin
  couleurTexte(15);
  CurseurDessin := positionCurseur();
  Write('   |\');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('   || .---. ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('   ||/_____\');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('   ||( ', Chr(39), '.', Chr(39), ' ) ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('   || \_-_/_  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('   :-"`', Chr(39), 'V', Chr(39), '//-. ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('  / ,   |// , `\');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write(' / /|Ll //Ll|| |');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('/_/||__//   || |');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('\ \/---|[]==|| |');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write(' \/\__/ |   \| |');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write(' /\|_   | Ll_\ |');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write(' `--|`^"""^`||_|');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    |   |   ||/ ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    |   |   |  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    |   |   |  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    |   |   |  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    L___l___J  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('     |_ | _|   ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('    (___|___)  ');
  CurseurDessin.y := CurseurDessin.y + 1;
  deplacerCurseur(CurseurDessin);
  Write('     ^^^ ^^^   ');

end;

procedure dessinVS();
var
  CurseurDessin : coordonnees;

begin
      deplacerCurseurXY(82,21);
      couleurTexte(4);
      CurseurDessin := positionCurseur();
      write('____    ____   _______.');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('\   \  /   /  /       |');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write(' \   \/   /  |   (----`');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('  \      /    \   \ ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   \    / .----)   |');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('    \__/  |_______/ ');
      couleurTexte(15);
end;


//Attaque des Pirates
procedure dessinPirateVivant();
var
  CurseurDessin : coordonnees;

begin
      deplacerCurseurXY(10,10);
      CurseurDessin := positionCurseur();
      write('                     ;&&&&&&&&&&&&&&&&. ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                  &&&&&&&&&&&&&&&&&&&&&&&;');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('        .&&&&&   &&&&&&&&&&&[X  X]&&&&&&&&&&&&   .&&&&&. ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('           .&&&&&&&&&&&&&&&&&&[]&&&&&&&&&&&&&&&&&&&&& ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('       &##   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('      &###      @@@@@@@@@@@@@@@@@@@@@@%@@@@%@%% ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('    ,%####%     @@@@@@%%..............%@@@%@@@. ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('    &####        %%........................@@@%@');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   &####          %.....( $ }.....{ $ )....&@@@@@@@%%.');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   &###%           %...........°°.............@@@@@&@@@@ ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   &###%             .....................@@@@*     %@@@@.');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   &###%              ,......=###=.......,  @@@%%');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('    &###                 *,.......,,,,*       %@@ ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('     ###                ,:,%%  ..  *%%%%*,,,');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   %##&#&###%        .;*%%%%   .    %%%(,,.:,. ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   #&&&&&#%          .:,%%%.       .%%%%. .;.:,.');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('    ##&...#;,:;,   ;:,.*%*%         %%%%.   ,:;.; ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('      #&&&&&&;.,:;:.;:.%%*        .*%% %%.:,.;., ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('               ,.;.,.. %%,         .**%%%%.,;; ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                    ;.%%*,         *.%%%%%%.; ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                    (%%..*##@@@@@##**.*%%%*, ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                    .%%*,*##########,.%%%%%. ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                         %%%%%%%%%%%%%..');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                        %%%%%%% %%%%%%%  ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                        %%%%%%% %%%%%%% ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                      %&&&&&&%   %%&&&&&& ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                      &&&&&&&&   &&&&&&&&/ ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                       &&&&&&     &&&&&&  ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                  #&&,,*&&&&       &&&&/,,#&% ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                 %&&&&&&&&&/        &&&&&&&&&%   ');

end;

procedure dessinPirateMort();
var
  CurseurDessin : coordonnees;

begin
      deplacerCurseurXY(10,10);
      CurseurDessin := positionCurseur();
      write('                     ;&&&&&&&&&&&&&&&&. ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                  &&&&&&&&&&&&&&&&&&&&&&&;');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('        .&&&&&   &&&&&&&&&&&[X  X]&&&&&&&&&&&&   .&&&&&. ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('           .&&&&&&&&&&&&&&&&&&[]&&&&&&&&&&&&&&&&&&&&& ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('       &##   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('      &###      @@@@@@@@@@@@@@@@@@@@@@%@@@@%@%% ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('    ,%####%     @@@@@@%%..............%@@@%@@@. ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('    &####        %%........................@@@%@');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   &####          %.....( X }.....{ X )....&@@@@@@@%%.');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   &###%           %...........°°.............@@@@@&@@@@ ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   &###%             .....................@@@@*     %@@@@.');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   &###%              ,......=###=.......,  @@@%%');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('    &###                 *,.......,,,,*       %@@ ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('     ###                ,:,%%  ..  *%%%%*,,,');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   %##&#&###%        .;*%%%%   .    %%%(,,.:,. ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('   #&&&&&#%          .:,%%%.       .%%%%. .;.:,.');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('    ##&...#;,:;,   ;:,.*%*%         %%%%.   ,:;.; ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('      #&&&&&&;.,:;:.;:.%%*        .*%% %%.:,.;., ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('               ,.;.,.. %%,         .**%%%%.,;; ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                    ;.%%*,         *.%%%%%%.; ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                    (%%..*##@@@@@##**.*%%%*, ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                    .%%*,*##########,.%%%%%. ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                         %%%%%%%%%%%%%..');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                        %%%%%%% %%%%%%%  ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                        %%%%%%% %%%%%%% ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                      %&&&&&&%   %%&&&&&& ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                      &&&&&&&&   &&&&&&&&/ ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                       &&&&&&     &&&&&&  ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                  #&&,,*&&&&       &&&&/,,#&% ');
      CurseurDessin.y := CurseurDessin.y + 1;
      deplacerCurseur(CurseurDessin);
      write('                 %&&&&&&&&&/        &&&&&&&&&%   ');

end;

//Dessin Logo tete de mort
procedure LogoTeteDeMort();
var
  CurseurLogoTeteDeMort : coordonnees;
begin
  deplacerCurseurXY(50, 9);
  CurseurLogoTeteDeMort := positionCurseur();
  write('                                            (@@@@@@@@@@@@@@,                                                    ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                                       @@@@@@@@@@@@@@@@@@@@@@                                                   ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                                    .@@@@@@@@@@@@@@@@@@@@@@@@@@                                                 ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write(' /@                                @@@@(,@@@@@@@@@@@@@@@@@@@@@@@,                                               ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('  @@(                             %@@@( @@@@@@@@@@@@@@@@@@@@@@@@@                                &,             ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('  %@@@.                           @@@ &@@@@@@@@@@@@@@@@@@@@@@@@@@                              @@@              ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('   &@@@@,                         %@@ @@@@    /@@@@@@#   ,@@@@@@@,                           @@@@,              ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('    %@@@@@/                        @@ @@&       @@@@       @@(#@@.                         %@@@@*               ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('     .@@@@@@&                       * @@      *@@@@@@      #@./@%                        #@@@@@.                ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('       @@@@@@@@.                   @@@@@@@%@@@@@% (@@@@/./@@@@@@,                      &@@@@@@                  ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('        .@@@@@@@@#                  @@@@@@@@@@@@   %@@@@@@@@@@@@*                    @@@@@@@&                   ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('          ,@@@@@@@@@.                   ,@@@@@@@@@@@@@@@@@@&*.                    #@@@@@@@@                     ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('            /@@@@@@@@@&                *@  (@@@@@@@@@@@@@  %                   .@@@@@@@@@.                      ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('              *@@@@@@@@@@/             %@@@  @,( , . %*  @@@/               ,@@@@@@@@@@.                        ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                 @@@@@@@@@@@.          /@@@.   , # .    @@@@             #@@@@@@@@@@@                           ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                   &@@@@@@@@@@@/        @@@@ @,@.@(&%&& @@@@         ,@@@@@@@@@@@@.                             ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                      @@@@@@@@@@@@@      *@@@@@@&#((#@@@@@@       @@@@@@@@@@@@@(                                ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                        .@@@@@@@ @@@@@#    %@@@@@@@@@@@@@    .@@@@@@@@@@@@@@#                                   ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                            @@@@@@@ /@@@@@(              *@@@@@@  &@@@@@@(                                      ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                 #@@           &@@@@@@& (@@@@@&      &@@@@@% .@@@@@@@@,                                         ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('               @@@@@@.             @@@@@@@@  &@@@@@@ ,@@ ,@@@@@@@@%            .@#                              ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                  &@@@.             *%,#@@@@@@@&. (@@@@@@&,.((               .@@@@@@.                           ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('        #,         *@@@#  #@@@@@@@@@@@@@@(  @@@@@@@@@, .@@@@@@@@@%          .@@@@/                              ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('     @@@@@.@@@@@@@@( @@@@@& &@@@&*   (@@@@@@@@@*.&@@@@@@@@@, *@@@@@@@@@@@@ #@@@@                                ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('     @@@@@@ @@@@@@@@@. &@@@@ /@@@@@@@@@@@%            .%@@@@@@@@@@, ,.  &@@@@@, @@@@@@@& @@@@@                  ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('      %@@@,%@          %@@@#                                  ./@@@@@@/,@@@@( @@@@@@@@@@ @@@@@&                 ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('         /%             @@@@@                                           @@@@           * @@@@@                  ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                         .@@@@@@@@@@                            &@.   %@@@@.           /@@                      ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                             @@@@&                             ,@@@@@@@@@#                                      ');
  CurseurLogoTeteDeMort.y := CurseurLogoTeteDeMort.y + 1;
  deplacerCurseur(CurseurLogoTeteDeMort);
  write('                                                                  .,.                                           ');
end;

procedure SurprisePirate();

begin
  effacerEcran;
  LogoTeteDeMort();
  dessinerCadreXY(80,28,120,32,Double,15,0);
  deplacerCurseurXY(83,30);
  couleurtexte(12);
  write('Vous êtes attaqué par des pirates !');
  couleurTexte(15);
  readln;
end;

procedure InformationGlobale();
begin
      setSomme(getNbrPirate*200);             //Chaques pirate va demander 200 d'or
      setViePirate(getNbrPirate*10);          //Chaques pirate a 10 points de vie
      setAttaquePirate(getNbrPirate*6);       //Chaques pirate a 6 points d'attaque
      setAttaqueTroupe(getConscrit*3+getSoldat*6+getFusilier*11);  //Calcul de l'attaque global des troupes en fonction des troupes détenues
      setVieTroupe(getConscrit*5+getSoldat*9+getFusilier*7);       //Calcul de la vie globale des troupes en fonction des troupes détenues
      setNbrTroupe(getConscrit + getSoldat + getFusilier);         //Calcul du nombre global des troupes en fonction des troupes détenues
end;


procedure CadrePirate();

begin

  //Cadre Option
  dessinerCadreXY(19,49,179,55,Double,15,0);
  dessinerCadreXY(20,48,180,54,Double,15,0);
  deplacerCurseurXY(25,50);
  write('Que voulez vous faire ?');
  deplacerCurseurXY(25,52);
  write('1| Attaquer !');
  deplacerCurseurXY(60,52);
  write('2| Payer !  (', (getSomme),' pièces d',chr(39),'or)');


  //Cadre Pirate
  dessinerCadreXY(10,2,70,6,simple,15,0);

  deplacerCurseurXY(12,3);
  write('Nombre de Pirate  :');
  deplacerCurseurXY(40,3);
  write(getNbrPirate);


  deplacerCurseurXY(12,4);
  write('Vie               :');
  deplacerCurseurXY(40,4);
  write(getViePirate);

  deplacerCurseurXY(12,5);
  write('Attaque           :');
  deplacerCurseurXY(40,5);
  write(getAttaquePirate);


  //Cadre Troupe du Joueur
  dessinerCadreXY(125,40,185,44,simple,15,0);

  deplacerCurseurXY(127,41);
  write('Nombre de Troupe  :');
  deplacerCurseurXY(155,41);
  write(getNbrTroupe);

  deplacerCurseurXY(127,42);
  write('Vie               :');
  deplacerCurseurXY(155,42);
  write(getVieTroupe);

  deplacerCurseurXY(127,43);
  write('Attaque           :');
  deplacerCurseurXY(155,43);
  write(getAttaqueTroupe);

end;

procedure ConditionPirate();
var
   n : Integer;

begin
  n:=0;
  n:=random (100);
  if n>60 then
     begin
       if getTour<5 then
           setNbrPirate(random (1)+1)
        else if getTour<10 then
           setNbrPirate(random (4)+1)
        else if getTour<20 then
           setNbrPirate(random (19)+1)
        else if getTour<40 then
           setNbrPirate(random (29)+1)
        else if getTour<60  then
           setNbrPirate(random (39)+1)
        else if getTour<80  then
           setNbrPirate(random (49)+1)
        else if getTour<100 then
           setNbrPirate(random (59)+1);
        SurprisePirate();
        InformationGlobale();
        InterfaceCombat();
     end;

end;

procedure MettreTroupeA0();
begin
  Pop.Conscrit:=0;
  Pop.Soldat:=0;
  Pop.Fusilier:=0;
end;

procedure Attaquer();
var
   de : Integer;   //dé à 6 faces

begin

  dessinerCadreXY(19,49,179,55,Double,15,0);
  dessinerCadreXY(20,48,180,54,Double,15,0);

  de:=random(5)+1;
  if de>5 then
      begin
          setViePirate(getViePirate-getAttaqueTroupe);

          couleurTexte(4);
          deplacerCurseurXY(44,4);
          write('-',getAttaqueTroupe);
          couleurTexte(15);

          deplacerCurseurXY(25,50);
          write('Chance ! Les Pirates ne vous ont pas attaqué !');
      end

  else
      begin
           setVieTroupe(getVieTroupe-getAttaquePirate);
           setViePirate(getViePirate-getAttaqueTroupe);

           couleurTexte(4);
           deplacerCurseurXY(44,4);
           write('-',getAttaqueTroupe);
           deplacerCurseurXY(159,42);
           write('-',getAttaquePirate);
           couleurTexte(15);

           deplacerCurseurXY(25,50);
           write('Les Pirates vous ont aussi attaqué !');
      end;
  if (getViePirate<=0) then
     dessinPirateMort();
  if (getVieTroupe <=0) then
     begin
        if (getNbrTroupe=0) then
               {Ne pas afficher de soldat}
        if (getNbrTroupe>=1) then
          begin
            deplacerCurseurXY(140, 7);
            dessinSoldatMort();
          end;
        if (getNbrTroupe>=2) then
          begin
            deplacerCurseurXY(160, 7);
            dessinSoldatMort();
          end;
        if (getNbrTroupe>=3) then
          begin
            deplacerCurseurXY(135, 17);
            dessinSoldatMort();
          end;
        if (getNbrTroupe>=4) then
          begin
            deplacerCurseurXY(155, 17);
            dessinSoldatMort();
          end;
     end;
  readln();

  if (getViePirate<=0) AND (getVieTroupe>0)then
      begin
           effacerEcran;
           dessinerCadreXY(80,28,120,32,Double,15,0);
           deplacerCurseurXY(83,30);
           couleurtexte(12);
           write('Vous avez vaincu les pirates !');
           readln();
      end;

  if (getVieTroupe<=0) AND (getViePirate>0) then
      begin
           effacerEcran;
           dessinerCadreXY(80,28,135,33,Double,15,0);
           deplacerCurseurXY(83,30);
           couleurtexte(12);
           write('Votre armée a été décimée !');
           MettreTroupeA0();
           deplacerCurseurXY(83,31);
           write('Les Pirates vous ont volé ',getSomme,' pièces d',chr(39),'or');

           setArgent(getArgent-getSomme);

           readln();
      end;

  if (getVieTroupe<=0) AND (getViePirate<=0) then
      begin
           effacerEcran;
           dessinerCadreXY(80,28,120,32,Double,15,0);
           deplacerCurseurXY(83,30);
           couleurtexte(12);
           write('Vous avez vaincu les pirates !');
           MettreTroupeA0();
           readln();
      end;

  if (getVieTroupe>0) AND (getViePirate>0) then
      begin
           deplacerCurseurXY(120,52);
           couleurTexte(15);
           write('< Vous n',chr(39),'avez pas tué tous les pirates >');
           readln;
           InterfaceCombat();
      end;
end;

procedure Payer();

begin
  setArgent(getArgent-getSomme);       //Soustraire la somme payée
  effacerEcran;
  dessinerCadreXY(80,28,120,32,Double,15,0);
  deplacerCurseurXY(83,30);
  couleurtexte(12);
  write('Vous avez payé ',getSomme,' pièces d',chr(39),'or');
  couleurTexte(15);
  readln();

end;



procedure InterfaceCombat();
var
  choixCombat : Integer;

begin
  repeat
      effacerEcran;
      CadrePirate();
      DessinPirateVivant();
      dessinVS();
      if (getNbrTroupe>=1) then
         begin
           deplacerCurseurXY(140, 7);
           dessinSoldatVivant();
         end;
      if (getNbrTroupe>=2) then
         begin
           deplacerCurseurXY(160, 7);
           dessinSoldatVivant();
         end;
      if (getNbrTroupe>=3) then
         begin
           deplacerCurseurXY(135, 17);
           dessinSoldatVivant();
         end;
      if (getNbrTroupe>=4) then
         begin
           deplacerCurseurXY(155, 17);
           dessinSoldatVivant();
         end;

      deplacerCurseurXY(49,50);
      write('     ');
      deplacerCurseurXY(49,50);
      readln(choixCombat);
      if choixCombat=1 then
         Attaquer()
      else if choixCombat=2 then
         Payer()
      else
         begin
            deplacerCurseurXY(110,55);
            couleurTexte(12);
            write('/!\');
            couleurTexte(15);
            write('Veuillez écrire un choix valide!');
            readln;
         end;

  until (choixCombat=1) OR (choixCombat=2);


end;

end.

