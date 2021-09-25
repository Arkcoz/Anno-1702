{$codepage utf8}
unit ProposerCommerce;                                                           //unité permettant à un joueur de proposer un échange au oueur adverse via un menu

interface
uses GestionEcran, Ressource, MenuNouvellePartie;

procedure menuProposerEchange(joueur : string);                                  //Affiche le menu permettant de proposer un échange
function getRessourceDonnee : integer;                                           //renvoie la valeur de la ressource donnée
function getQteDonnee : integer;                                                 //renvoie la valeur de la quantité donnée
function getRessourceVoulue : integer;                                           //renvoie la valeur de la ressource voulue
function getQteVoulue : integer;                                                 //renvoie la valeur de la quantit voulue
function checkRessource(ressource, qte : integer):boolean;                       //vérifie qu'un joueur possède le nombre nécessaire d'une ressource donnée
procedure afficherSesRessources(x,y:integer);                                    //affiche les ressources d'un joueur



implementation
var
  RessourceDonnee, qteDonnee, RessourceVoulue, qteVoulue : integer;

procedure DessinercadreCommerce(joueur : string);                                //affiche l'introduction de l'échange
begin
  //Cadre
  dessinerCadreXY(1,1,199,59,Simple,15,0);
  deplacerCurseurXY(99,10);
  write('Commerce');
  dessinerCadreXY(37,10,167,19, Simple, 15, 0);
  deplacerCurseurXY(90, 11);
  write('Mes ressources');
  deplacerCurseurXY(130, 11);
    case joueur of
    'J1' : write('Ressources de : ',PersoJ2.nom);
    'J2' : write('Ressources de : ',PersoJ1.nom);
    end;
  dessinerCadreXY(37,20,167,34, Simple, 11, 0);
end;

procedure afficherSesRessources(x,y:integer);                                    //affiche les ressources d'un joueur
begin
  begin

  couleurTexte(7);
  deplacerCurseurXY((x-30),y);
  write('Poissons :');
  deplacerCurseurXY((x-30),(y+1));
  write('Bois :');
  deplacerCurseurXY((x-30),(y+2));
  write('Outils :');
  deplacerCurseurXY((x-30),(y+3));
  write('Laine :');
  deplacerCurseurXY((x-30),(y+4));
  write('Tissu :');
  deplacerCurseurXY((x-30),(y+5));
  write('Argent :');

  couleurTexte(10);
  deplacerCurseurXY(x,y);
  write(getPoisson);
  deplacerCurseurXY(x,(y+1));
  write(getBois);
  deplacerCurseurXY(x,(y+2));
  write(getOutils);
  deplacerCurseurXY(x,(y+3));
  write(getLaine);
  deplacerCurseurXY(x,(y+4));
  write(getTissu);
  deplacerCurseurXY(x,(y+5));
  write(getArgent);

end;

end;

procedure afficherRessourcesJ1(x,y:integer);                                     //affiche les ressource du joueur 1
begin
  deplacerCurseurXY(x,y);
  write(InvJ1.poisson);

  deplacerCurseurXY(x,(y+1));
  write(InvJ1.bois);

  deplacerCurseurXY(x,(y+2));
  write(InvJ1.outils);

  deplacerCurseurXY(x,(y+3));
  write(InvJ1.laine);

  deplacerCurseurXY(x,(y+4));
  write(InvJ1.tissu);

  deplacerCurseurXY(x,(y+5));
  write(InvJ1.argent);
end;

procedure afficherRessourcesJ2(x,y:integer);                                     //affiche les ressource du joueur 2
begin
  deplacerCurseurXY(x,y);
  write(InvJ2.poisson);

  deplacerCurseurXY(x,(y+1));
  write(InvJ2.bois);

  deplacerCurseurXY(x,(y+2));
  write(InvJ2.outils);

  deplacerCurseurXY(x,(y+3));
  write(InvJ2.laine);

  deplacerCurseurXY(x,(y+4));
  write(InvJ2.tissu);

  deplacerCurseurXY(x,(y+5));
  write(InvJ2.argent);
end;

procedure afficherChoixCommerce(x : integer; action : string);                   //affiche les différentes ressources disponibles à l'échange
begin
     deplacerCurseurXY((x-10),21);
  write(action,' : ');

  deplacerCurseurXY(x,23);
  write('1| Poisson');

  deplacerCurseurXY(x,24);
  write('2| Bois');

  deplacerCurseurXY(x,25);
  write('3| Outils');

  deplacerCurseurXY(x,26);
  write('4| Laine');

  deplacerCurseurXY(x,27);
  write('5| Tissu');

  deplacerCurseurXY(x,28);
  write('6| Or');

  deplacerCurseurXY(x,30);
  write('0| Ne rien faire');

  deplacerCurseurXY(x,3);

end;

function getRessourceDonnee : integer;                                           //renvoie la valeur de la ressource donnée
begin
   getRessourceDonnee := ressourceDonnee;
end;

function getQteDonnee : integer;                                                 //renvoie la valeur de la quantité donnée
begin
   getQteDonnee := qteDonnee;
end;

function getRessourceVoulue : integer;                                           //renvoie la valeur de la ressource voulue
begin
   getRessourceVoulue := ressourceVoulue;
end;

function getQteVoulue : integer;                                                 //renvoie la valeur de la quantit voulu
begin
   getQteVoulue := qteVoulue
end;

procedure optionCommerce;                                                        //Gere les entrées des choix du joueurs
var
  choix, y, nvPerdu : integer;
  annule : boolean;
begin
  annule := FALSE;

  //Ressource donnee
  afficherChoixCommerce(70,'Donner');

  choix := -1;

  repeat // ressource donnee                                                     //Entrée du choix de la ressource à donner
    readln(choix);

    case choix of
    0 : begin
        annule := TRUE;
        ressourceDonnee := 0;
        end;
    1 : begin
        ressourceDonnee := 1;
        y := 22;
        end;
    2 : begin
        ressourceDonnee := 2;
        y := 23;
        end;
    3 : begin
        ressourceDonnee := 3;
        y := 24;
        end;
    4 : begin
        ressourceDonnee := 4;
        y := 25;
        end;
    5 : begin
        ressourceDonnee := 5;
        y := 26;
        end;
    6 : begin
        ressourceDonnee := 6;
        y := 27;
        end;
    end;

    if ((choix < 0) OR (choix>6)) then                                           //vérification de l'entrée du joueur
       begin
              deplacerCurseurXY(17,57);
              couleurTexte(12);
              write('/!\');
              couleurTexte(15);
              write('Veuillez écrire un choix valide!');
              readln;
       end;
    if (ressourceDonnee <> 0) then
    begin
    if (checkRessource(ressourceDonnee,1)=FALSE) then                            //vérification que le joueur possède cette resource
       begin
            deplacerCurseurXY(17,57);
            couleurTexte(12);
            write('/!\');
            couleurTexte(15);
            write('Vous ne pouvez pas échanger une ressource dont vous ne dispoez pas.');
            choix := -1;
       end;
    end;

  until ((choix>=0) AND (choix<=6));


  if not annule then                                                             //Entrée de la quantité à donner
     begin
     //Qte donnee
     deplacerCurseurXY(80,21);
     write('Quantité à proposer :');
     repeat
           deplacerCurseurXY(90,y);
           write('     ');
           deplacerCurseurXY(90,y);
           readln(qteDonnee);

           if (checkRessource(ressourceDonnee,QteDonnee)=FALSE) then             //vérification que le joueur possède au moins la quantité à donner
           begin
                deplacerCurseurXY(17,57);
                couleurTexte(12);
                write('/!\');
                couleurTexte(15);
                write('Vous ne pouvez pas proposer plus de ressource que vous n''en disposez.');
           end;
     until(checkRessource(ressourceDonnee,QteDonnee)=TRUE);

     afficherChoixCommerce(120, 'En échange de');
     repeat
     deplacerCurseurXY(120, 32);
    readln(choix);

    case choix of                                                                //Entrée de la ressource voulue en échange
    0 : annule := TRUE;
    1 : begin
        ressourceVoulue := 1;
        y := 22;
        end;
    2 : begin
        ressourceVoulue := 2;
        y := 23;
        end;
    3 : begin
        ressourceVoulue := 3;
        y := 24;
        end;
    4 : begin
        ressourceVoulue := 4;
        y := 25;
        end;
    5 : begin
        ressourceVoulue := 5;
        y := 26;
        end;
    6 : begin
        ressourceVoulue := 6;
        y := 27;
        end;
    end;

    if ((choix < 0) OR (choix>6)) then
       begin
              deplacerCurseurXY(17,57);
              couleurTexte(12);
              write('/!\');
              couleurTexte(15);
              write('Veuillez écrire un choix valide!');
       end;


  until ((choix>=0) AND (choix<=6));

     if not annule then                                                          //Entrée de la quantité voulue en échange
        begin
        //Qte voulue
        deplacerCurseurXY(130,21);
        write('Quantité voulue :');
        deplacerCurseurXY(135,y);
        readln(qteVoulue);

     end;

     //caution des ressources
     case RessourceDonnee of                                                     //Prélèvement de la caution de l'échange (les resource que le joueur propose de donner
  1:  begin                                                                      //lui sont retirées (si l'autre joueur refuse l'échange elle lui seront rendue prochainement)
      nvPerdu := (getPoisson - QteDonnee);
      SetPoisson(nvPerdu);
      end;
  2:  begin
      nvPerdu := (getBois - QteDonnee);
      SetBois(nvPerdu);
      end;
  3:  begin
      nvPerdu := (getOutils - QteDonnee);
      SetOutils(nvPerdu);
      end;
  4:  begin
      nvPerdu := (getLaine - QteDonnee);
      SetLaine(nvPerdu);
      end;
  5:  begin
      nvPerdu := (getTissu - QteDonnee);
      SetTissu(nvPerdu);
      end;
  6:  begin
      nvPerdu := (getArgent - QteDonnee);
      SetArgent(nvPerdu);
      end;
  end;
end;
end;

function checkRessource(ressource, qte : integer):boolean;                        //vérifie qu'un joueur possède le nombre nécessaire d'une ressource donnée
begin
  checkRessource:=FALSE;
   case ressource of
   1 : if(qte<=Inv.poisson) then checkRessource := TRUE;
   2 : if(qte<=Inv.bois) then checkRessource := TRUE;
   3 : if(qte<=Inv.outils) then checkRessource := TRUE;
   4 : if(qte<=Inv.laine) then checkRessource := TRUE;
   5 : if(qte<=Inv.tissu) then checkRessource := TRUE;
   6 : if(qte<=Inv.argent) then checkRessource := TRUE;
   end;
end;

procedure illustrationCommerce(x, y : integer);
begin
   deplacerCurseurXY(x,y);
   couleurTexte(4);
   writeln('        ,,,,,,,,,,        *,,,,,,,,,        .,,,,,,,,,.        ,,,,,,,,,,       ');
   deplacerCurseurXY(x,y+1);
   writeln('      .**********        .**********        .**********        .**********      ');
   deplacerCurseurXY(x,y+2);
   writeln('     ***********         ***********         **********,        .**********     ');
   deplacerCurseurXY(x,y+3);
   writeln('    ***********         ,**********,         ***********         ,**********,   ');
   deplacerCurseurXY(x,y+4);
   writeln('   ***********.         ***********,         ***********,         ,***********  ');
   deplacerCurseurXY(x,y+5);
   writeln(' .***********,         ,***********.         ************.         ************ ');
   deplacerCurseurXY(x,y+6);
   writeln('/////////////..........////////////,.........*////////////..........////////////');
   deplacerCurseurXY(x,y+7);
   writeln(',(((((((((((/..........((((((((((((,.........*(((((((((((/..........((((((((((((');
   deplacerCurseurXY(x,y+8);
   writeln('  (((((((((. .........  /(((((((((  ......... .(((((((((,  ........  /((((((((/ ');
   deplacerCurseurXY(x,y+9);
   writeln('     /////                   .                     .                  /////     ');
   deplacerCurseurXY(x,y+10);
   couleurTexte(6);
   writeln('     /////                                        .,,                 /////     ');
   deplacerCurseurXY(x,y+11);
   writeln('     /////                                      ,,,****.              /////     ');
   deplacerCurseurXY(x,y+12);
   writeln('     /////                                      ,,,****.              /////     ');
   deplacerCurseurXY(x,y+13);
   writeln('     /////             ////////////              ,,***                /////     ');
   deplacerCurseurXY(x,y+14);
   writeln('     /////             ((((((((((((             /..,,.(,              /////     ');
   deplacerCurseurXY(x,y+15);
   writeln('     /////             (((((((((((((////     ./////((((((*            /////     ');
   deplacerCurseurXY(x,y+16);
   writeln('     /////             (((((############.    */////(((((((            /////     ');
   deplacerCurseurXY(x,y+17);
   writeln('     /////        *****/////////////////*****/////////////*****       /////     ');
   deplacerCurseurXY(x,y+18);
   writeln('     /////        /////////////////////////////////////////////       /////     ');
   deplacerCurseurXY(x,y+19);
   writeln('     /////        /////////////////////////////////////////////       /////     ');
   deplacerCurseurXY(x,y+20);
   writeln('     /////        /////////////////////////////////////////////       /////     ');
   deplacerCurseurXY(x,y+21);
   writeln('     /////        /////////////////////////////////////////////       /////     ');
   deplacerCurseurXY(x,y+22);
   writeln('     /////        /////////////////////////////////////////////       /////     ');
   deplacerCurseurXY(x,y+23);
   writeln('     /////        /////////////////////////////////////////////       /////     ');
end;

procedure menuProposerEchange(joueur : string);                                  //Affiche le menu avec les resources et les options de l'échange
begin
    effacerEcran;
    DessinercadreCommerce(joueur);
    afficherSesRessources(90,13);
    couleurTexte(9);
    case joueur of
    'J1' : afficherRessourcesJ2(130,13);
    'J2' : afficherRessourcesJ1(130,13);
    end;
    illustrationCommerce(60,35);
    couleurTexte(11);
    optionCommerce;
end;

end.
