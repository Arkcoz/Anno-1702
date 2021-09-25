unit MenuConnexion;

{$codepage utf8}

interface

uses
  GestionEcran;

Procedure Quitter;
Procedure Logo;
Procedure LogoBDV;
Procedure LogoBye;
Procedure PressEnter;

implementation
Procedure PressEnter;
begin
  dessinerCadreXY(65,35,134,39, double, 15, 0);
  deplacerCurseurXY(88,37);
  write('Press Enter to continue...');
end;

Procedure Logo ;
begin
  deplacerCurseurXY(2,2);
  write('                                   #                         #########                #######          #########                #######                  ###############');
  deplacerCurseurXY(2,3);
  write('                                  ###                           #######                 ###               #######                 ###                 #####            ####');
  deplacerCurseurXY(2,4);
  write('                                 #####                          #########               ###               ########                ###               ####                #####');
  deplacerCurseurXY(2,5);
  write('                                #######                         ##  ######              ##                ## #######              ##               ####                   ####');
  deplacerCurseurXY(2,6);
  write('                               ##  #####                        ##   #######            ##                ##   #######            ##              ####                     ####');
  deplacerCurseurXY(2,7);
  write('                              ##    #####                       ##     #######          ##                ##     #######          ##             ####                       ####');
  deplacerCurseurXY(2,8);
  write('                             ##      #####                      ##       #######        ##                ##       #######        ##             ####                       ####');
  deplacerCurseurXY(2,9);
  write('                            ##        #####                     ##         #######      ##                ##         ######       ##             ####                       ####');
  deplacerCurseurXY(2,10);
  write('                           #################                    ##          #######      #                ##          #######      #             ####                       ####');
  deplacerCurseurXY(2,11);
  write('                          ###################                   ##            #######    #                ##            #######    #             ####                       ####');
  deplacerCurseurXY(2,12);
  write('                         ##             ######                  ##              #######  #                ##              #######  #             #####                     #####');
  deplacerCurseurXY(2,13);
  write('                        ##               ######                 ##                ###### #                ##               ####### #              ####                     ####');
  deplacerCurseurXY(2,14);
  write('                       ##                 ######                ##                 #######                ##                 #######               #####                 #####');
  deplacerCurseurXY(2,15);
  write('                      ###                  ######               ##                   #####                ##                   #####                ######              ####');
  deplacerCurseurXY(2,16);
  write('                     ####                   ######             ####                   ####               ####                   ####                  ######         #####');
  deplacerCurseurXY(2,17);
  write('                    #######                #########          #######                   ##              #######                   ##                     ###############');
  deplacerCurseurXY(2,19);
  write('        ###############################################################################################################################################################################');
  deplacerCurseurXY(2,20);
  write('          ###########################################################################################################################################################################');
  deplacerCurseurXY(2,21);
  write('                ############################                                                                                                       ############################');
  deplacerCurseurXY(2,22);
  write('                  ##    ####################             ##         #################            ######                    #######                 ####################    ##');
  deplacerCurseurXY(2,23);
  write('                             ###############           ####         ################           ###    ###               ####    #####              ###############');
  deplacerCurseurXY(2,24);
  write('                                  ##########         ######         ##         ####          ###        ###            ##         ####             ########## ');
  deplacerCurseurXY(2,25);
  write('                                     #######            ###         #          ###          ####        ####          ##           ####            ####### ');
  deplacerCurseurXY(2,26);
  write('                                       #####            ###                   ###          ####          ####         ##           ####            ####');
  deplacerCurseurXY(2,27);
  write('                                          ##            ###                  ##            ####          ####          ##          ###             ##');
  deplacerCurseurXY(2,28);
  write('                                          ##            ###                 ##             ####          ####                     ####             ##');
  deplacerCurseurXY(2,29);
  write('                                           #            ###                ##              ####          ####                    ###               #');
  deplacerCurseurXY(2,30);
  write('                                           #            ###              ###               ####          ####                  ###                 #');
  deplacerCurseurXY(2,31);
  write('                                                        ###             ###                 ####        ####                 ###                ');
  deplacerCurseurXY(2,32);
  write('                                                        ###            ###                   ###        ###               #######     #');
  deplacerCurseurXY(2,33);
  write('                                                       ####           ###                      ###    ###               ###############');
  deplacerCurseurXY(2,34);
  write('                                                      #######       #######                      ######                ################');
end;

Procedure LogoBDV;
var
    CurseurLogoBDV:coordonnees;
begin
  dessinerCadreXY(65,10,134,28, double, 15, 0);
  deplacerCurseurXY(66,11);
  CurseurLogoBDV:=positionCurseur();
  write('             ,----------------,              ,---------,');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('        ,-----------------------,          ,"        ,"|');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('      ,"                      ,"|        ,"        ,"  |');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('     +-----------------------+  |      ,"        ,"    |');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('     |  .-----------------.  |  |     +---------+      |');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('     |  |  ');
  couleurTexte(12);
  write('MADE BY...     ');
  couleurTexte(15);
  writeln('|  |  |     | -==---- |      |');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('     |  |  ______________ |  |  |     |         |      |');

  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('     |  | |');
  couleurTexte(12);
  write('C:\>_BDV_CORP');
  couleurTexte(15);
  write('| |  |  |/----|`---=    |      |');

  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('     |  | |');
  couleurTexte(12);
  write('C:\>_        ');
  couleurTexte(15);
  write('| |  |  |   ,/|==== ooo |      ;');


  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('     |  | \-------------/ |  |  |  // |(((( [33]|    ," ');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('     |  `-----------------`  |," .;`| |((((     |  ,"   ');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('     +-----------------------+  ;;  | |         |,"     ');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('        /_)______________(_/  //,   | +---------+       ');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('   ___________________________/___  `,                  ');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('  /  oooooooooooooooo  .o.  oooo /,   \,"-----------    ');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write(' / ==ooooooooooooooo==.o.  ooo= //   ,`\--()B     ,"    ');
  CurseurLogoBDV.y:=CurseurLogoBDV.y+1;
  deplacerCurseur(CurseurLogoBDV);
  write('/_==__==========__==_ooo__ooo=_/,   /___________,"      ');
end;
Procedure LogoBye;

var
  CurseurLogoBye:coordonnees;

begin
  deplacerCurseurXY(65,32);
  CurseurLogoBye:=positionCurseur();
  write('#############            ###           #####        #################');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('###############           ###          ####      #######################');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('####      #######          ####        ###      ######           ########');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('####       ######           ####      ###      #####                #####');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('####      #######            ####    ###       ####                 #####');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('####     #######              ####  ###       #####                #####');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('##############                 #######        #####           #########');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('###############                ######         ######################');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('####     ########              #####          ###################');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('####       #######            #####           ######');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('####        ######           #####             #####');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('####        ######          #####               #####');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('####       ######          #####                 ########');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('################         #####                     #####################');
  CurseurLogoBye.y:=CurseurLogoBye.y+1;
  deplacerCurseur(CurseurLogoBye);
  write('#############          ######                        ###################');
end;

Procedure Quitter;

Begin
  effacerEcran;
  LogoBDV;
  LogoBye;
  readln;
End;
end.

