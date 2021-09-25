{$codepage utf8}
program VersionMinimale;
uses
    gestionecran, menuconnexion, MenuNouvellePartie, MenuIle, Ressource,
    GestionBatiments, Marchant, AchatBatiments, Population, Production,
    ResumeFinDePartie;

Var
  Jour:integer;
  choix:integer;

begin
  changertailleconsole(200,60);
  LogoBDV;
  PressEnter;
  readln;
  effacerEcran;
  dessinerCadreXY(0,0,198,58, double, 15, 0);
  Logo;
  deplacerCurseurXY(80,40);
  write('1) Nouvelle partie ');
  deplacerCurseurXY(80,41);
  write('2) Quitter');
  deplacerCurseurXY(80,43);
  write('Quel est votre choix ?');
  write('                    ');
  repeat
    choix:=0;
    deplacerCurseurXY(103,43);
    write('                    ');
    deplacerCurseurXY(103,43);
    readln(choix);                      //Choix MenuConnexion
    if choix=1 then                     //Choix MenuConnexion
        begin
          NouvellePartie;                   //Choix MenuConnexion
          initialisation_player();
          Jour:=1;
          while (Jour<500) do
            begin
              ShowMenuIle;
              deplacerCurseurXY(10,4);
              CouleurTexte(15);
              repeat
                deplacerCurseurXY(17,52);
                couleurTexte(15);
                write('Quel est votre choix ?');
                deplacerCurseurXY(41,52);
                write('                   ');
                deplacerCurseurXY(41,52);
                readln(choix);

                if (choix<=0) or (choix>=3) then
                   begin
                      deplacerCurseurXY(17,57);
                      couleurTexte(12);
                      write('/!\');
                      couleurTexte(15);
                      write('Veuillez écrire un choix valide!');

                   end;
                if choix=1 then
                   begin
                        Jour:=Jour+1;
                        Prod_Globale;
                        SoustrairePoisson;
                        ShowMenuMarchant;
                        ShowMenuFinDeTour;
                   end;
                if choix=2 then
                   begin
                        ShowMenuBatiments;
                   end;


              until ((choix>0) AND (choix<3));
            end;
        end;

    if (choix=2)  then               //Choix MenuConnexion
       begin
         Quitter;
       end;//Choix MenuConnexion
    if ((choix<>1) OR (choix<>2)) then
       begin
            deplacerCurseurXY(80,45);
            couleurTexte(12);
            write('/!\');
            couleurTexte(15);
            write('Veuillez écrire un choix valide!');
       end;


  until (choix=1) OR (choix=2) ;
end.

