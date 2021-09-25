unit Marchant;
{$codepage utf8}

interface

uses
  Classes, SysUtils,GestionEcran,Ressource,MenuNouvellePartie;

var
  // Variable stockant le prix de chaque ressource
  poissonPrix:integer;
  boisPrix:integer;
  outilsPrix:integer;
  lainePrix:integer;
  tissuPrix:integer;

procedure InformationGlobale;
procedure CadreMarchant;
procedure ShowMenuMarchant;
procedure Commerce;
procedure OptionMarchant;
procedure OptionMarchantVendre;
procedure OptionMarchantAcheter;
procedure LogoVendre;
procedure LogoAcheter;
procedure effacerLogo;
procedure Surprise;

// Procédure permettant de vendre une ressource, chacun de ces procédures fonctionnent de la même manière. Il suffit de changer la ressource.
procedure vendre_poissons();
procedure vendre_bois();
procedure vendre_tissu();
procedure vendre_outils();
procedure vendre_laine();

// Procédure qui permet d'achter une ressource, chacune de ces procédures fonctionnent de la même manière. Il suffit de changer la ressource.
procedure acheter_poisson(diffi : Difficultes);
procedure acheter_bois(diffi : Difficultes);
procedure acheter_tissu(diffi : Difficultes);
procedure acheter_outils(diffi : Difficultes);
procedure acheter_laine(diffi : Difficultes);


implementation

//Procedure qui affiche un dessin acheter
procedure LogoAcheter;
var
  CurseurLogoAcheter:coordonnees;
begin
  couleurTexte(10);
  deplacerCurseurXY(158,2);
  CurseurLogoAcheter:=positionCurseur();
  write('               _          _ ');
  CurseurLogoAcheter.y:=CurseurLogoAcheter.y+1;
  deplacerCurseur(CurseurLogoAcheter);
  write('     /\       | |        | |');
  CurseurLogoAcheter.y:=CurseurLogoAcheter.y+1;
  deplacerCurseur(CurseurLogoAcheter);
  write('    /  \   ___| |__   ___| |_ ___ _ __');
  CurseurLogoAcheter.y:=CurseurLogoAcheter.y+1;
  deplacerCurseur(CurseurLogoAcheter);
  write('   / /\ \ / __| ',char(39),'_ \ / _ \ __/ _ \ ',char(39),'__|');
  CurseurLogoAcheter.y:=CurseurLogoAcheter.y+1;
  deplacerCurseur(CurseurLogoAcheter);
  write('  / ____ \ (__| | | |  __/ ||  __/ |');
  CurseurLogoAcheter.y:=CurseurLogoAcheter.y+1;
  deplacerCurseur(CurseurLogoAcheter);
  write(' /_/    \_\___|_| |_|\___|\__\___|_|   ');
end;

//Procedure qui affiche un dessin vendre
procedure LogoVendre;
var
  CurseurLogoVendre:coordonnees;
begin
  couleurTexte(12);
  deplacerCurseurXY(162,2);
  CurseurLogoVendre:=positionCurseur();
  write(' __      __            _');
  CurseurLogoVendre.y:=CurseurLogoVendre.y+1;
  deplacerCurseur(CurseurLogoVendre);
  write(' \ \    / /           | |');
  CurseurLogoVendre.y:=CurseurLogoVendre.y+1;
  deplacerCurseur(CurseurLogoVendre);
  write('  \ \  / /__ _ __   __| |_ __ ___ ');
  CurseurLogoVendre.y:=CurseurLogoVendre.y+1;
  deplacerCurseur(CurseurLogoVendre);
  write('   \ \/ / _ \ ',Chr (39),'_ \ / _` | ',Chr (39),'__/ _ \ ');
  CurseurLogoVendre.y:=CurseurLogoVendre.y+1;
  deplacerCurseur(CurseurLogoVendre);
  write('    \  /  __/ | | | (_| | | |  __/ ');
  CurseurLogoVendre.y:=CurseurLogoVendre.y+1;
  deplacerCurseur(CurseurLogoVendre);
  write('     \/ \___|_| |_|\__,_|_|  \___| ');
end;

//Procedure qui efface le dessin
procedure effacerLogo;

var
  CurseurLogoVendre:coordonnees;
begin
  couleurTexte(12);
  deplacerCurseurXY(162,2);
  CurseurLogoVendre:=positionCurseur();
  write('                                    ');
  CurseurLogoVendre.y:=CurseurLogoVendre.y+1;
  deplacerCurseur(CurseurLogoVendre);
  write('                                    ');
  CurseurLogoVendre.y:=CurseurLogoVendre.y+1;
  deplacerCurseur(CurseurLogoVendre);
  write('                                    ');
  CurseurLogoVendre.y:=CurseurLogoVendre.y+1;
  deplacerCurseur(CurseurLogoVendre);
  write('                                    ');
  CurseurLogoVendre.y:=CurseurLogoVendre.y+1;
  deplacerCurseur(CurseurLogoVendre);
  write('                                    ');
  CurseurLogoVendre.y:=CurseurLogoVendre.y+1;
  deplacerCurseur(CurseurLogoVendre);
  write('                                    ');
end;

//Procedure qui affiche les informations globales
procedure InformationGlobale;
begin
  //Données en haut à gauche (Nom du joueur et Or)
  deplacerCurseurXY(10,2);
  write('Nom du joueur  :  ',Perso.nom);
  deplacerCurseurXY(10,3);
  write('Or             :  ',getArgent);

end;

//Procedure qui affiche le cadre marchant
procedure CadreMarchant;
begin
  //Cadre Générale
  dessinerCadreXY(0,0,198,58,Double,15,0);
  dessinerCadreXY(60,0,140,4,Double,15,0);
  deplacerCurseurXY(80,2);
  write('Rencontre avec le Marchant - Dayfell Cay');
end;

// Affiche les choix possible entre vendre/achter/Ne rien faire
procedure OptionMarchant;
begin
//Cadre
  dessinerCadreXY(54,39,146,50,Simple,11,0);
  dessinerCadreXY(91,38,113,40,Simple,11,0);
  deplacerCurseurXY(96,39);
  CouleurTexte(11);
  write(#200,#205,' Options ',#205,#188);
//Contenu
  deplacerCurseurXY(71,43);
  write('1| Vendre');

  deplacerCurseurXY(71,44);
  write('2| Acheter');

  deplacerCurseurXY(71,48);
  write('0| Finir le tour');
end;

// Affiche les options possible à la vente
procedure OptionMarchantVendre;
begin
//Cadre
  dessinerCadreXY(54,39,146,50,Simple,11,0);
  dessinerCadreXY(91,38,113,40,Simple,11,0);
  deplacerCurseurXY(96,39);
  CouleurTexte(11);
  write(#200,#205,' Options ',#205,#188);

  //Contenu
  deplacerCurseurXY(71,42);
  write('1| Poisson');

  deplacerCurseurXY(71,43);
  write('2| Bois');

  deplacerCurseurXY(71,44);
  write('3| Outils');

  deplacerCurseurXY(71,45);
  write('4| Laine');

  deplacerCurseurXY(71,46);
  write('5| Tissu');

  deplacerCurseurXY(71,48);
  write('0| Ne rien faire');

end;

// Affiche les options possible à l'achat
procedure OptionMarchantAcheter;
begin
//Cadre
  dessinerCadreXY(54,39,146,50,Simple,11,0);
  dessinerCadreXY(91,38,113,40,Simple,11,0);
  deplacerCurseurXY(96,39);
  CouleurTexte(11);
  write(#200,#205,' Options ',#205,#188);

  //Contenu
  deplacerCurseurXY(71,42);
  write('1| Poisson');

  deplacerCurseurXY(71,43);
  write('2| Bois');

  deplacerCurseurXY(71,44);
  write('3| Outils');

  deplacerCurseurXY(71,45);
  write('4| Laine');

  deplacerCurseurXY(71,46);
  write('5| Tissu');

  deplacerCurseurXY(71,48);
  write('0| Ne rien faire');

end;

// Affiche la liste des ressources à vendre/acheter ainsi que leur prix
procedure Commerce;

begin
//initialisation des prix pour chaques ressources
  poissonPrix :=3;
  boisPrix :=5;
  outilsPrix :=15;
  lainePrix :=8;
  tissuPrix :=8;
//Cadre
  dessinerCadreXY(50,10,150,57,Simple,15,0);
  dessinerCadreXY(91,9,113,11,Simple,15,0);
  deplacerCurseurXY(99,10);
  write('Commerce');

//Contenu
  deplacerCurseurXY(55,13);
  write('Poissons :');
  deplacerCurseurXY(80,13);
  write(getPoisson,'/',LimitR[getNiveauActuel,Rpoisson]);
  deplacerCurseurXY(120,13);
  write('| Prix : ',poissonPrix);

  deplacerCurseurXY(55,14);
  write('Bois :');
  deplacerCurseurXY(80,14);
  write(getBois,'/',LimitR[getNiveauActuel,Rbois]);
  deplacerCurseurXY(120,14);
  write('| Prix : ',boisPrix);

  deplacerCurseurXY(55,15);
  write('Outils :');
  deplacerCurseurXY(80,15);
  write(getOutils,'/',LimitR[getNiveauActuel,Routil]);
  deplacerCurseurXY(120,15);
  write('| Prix : ',outilsPrix);

  deplacerCurseurXY(55,16);
  write('Laine :');
  deplacerCurseurXY(80,16);
  write(getLaine,'/',LimitR[getNiveauActuel,Rlaine]);
  deplacerCurseurXY(120,16);
  write('| Prix : ',lainePrix);

  deplacerCurseurXY(55,17);
  write('Tissu :');
  deplacerCurseurXY(80,17);
  write(getTissu,'/',LimitR[getNiveauActuel,Rtissu]);
  deplacerCurseurXY(120,17);
  write('| Prix : ',tissuPrix);

end;

//////////////////// VENDRE ////////////////////

procedure vendre_outils();

var
  nb:Integer; // Variable de type entière qui correspond au nombre de ressource que l'utilisateur veut vendre
  argent_gagner:Integer; // Variable de type entière qui correspond à l'argent gagné après la vente
begin

  if (Inv.outils >= 1) then  // On vérifie que l'utilisateur possède la ressource
  begin
      // Affichage
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' OUTILS ');
      deplacerCurseurXY(15,11);
      write('Combien d',chr(39),'outils souhaitez vous vendre ?');

      // Saisie du nombre de ressource à vendre
      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

    if (nb <= Inv.outils) then // On vérifie s'il a suffisamment de ressource
      begin
        effacerecran;
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,4,Simple,11,0);
        deplacerCurseurXY(99,2);
        CouleurTexte(11);
        write(' OUTILS ');

        Inv.outils:=(Inv.outils-nb); // On retire de son inventaire les ressources qu'il a vendu
        argent_gagner:= (nb*15); // On calcule l'argent gagné
        Inv.argent:=(Inv.argent + argent_gagner); // On rajoute dans son inventaire l'argent gagné
        deplacerCurseurXY(15,11);
        // Affichage du message de succès.
        writeln('Vente réussite');
        deplacerCurseurXY(15,12);
        writeln('Il vous reste ', Inv.argent, ' et ', Inv.outils, ' outils');
      end
  else // Sinon on affiche un message d'erreur
      begin
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,4,Simple,11,0);
         deplacerCurseurXY(99,2);
         CouleurTexte(11);
         write(' OUTILS ');
         deplacerCurseurXY(15,11);
         write('Vous avez ', Inv.outils, ', vous ne pouvez pas vendre ', nb, ' outils.');
         deplacerCurseurXY(15,12);
         writeln('Veuillez patienter.');
         sleep(2000);
         vendre_outils; // On le renvoie au menu de vente des outils
      end;

  end
   else // On affiche un message d'erreur si l'utilisateur n'a pas cette ressource dans son inventaire
        begin
             effacerecran;
             dessinerCadreXY(10,3,190,25,Simple,11,0);
             dessinerCadreXY(80,1,125,4,Simple,11,0);
             deplacerCurseurXY(99,2);
             CouleurTexte(11);
             write(' OUTILS ');
             deplacerCurseurXY(15,11);
             write('Vous n',chr(39),'avez pas d',chr(39),'outils');
        end;
end;

procedure vendre_poissons();

var
  nb:Integer; // Variable de type entière qui correspond au nombre de ressource que l'utilisateur veut vendre
  argent_gagner:Integer; // Variable de type entière qui correspond à l'argent gagné après la vente
begin

  if (Inv.poisson >= 1) then // On vérifie que l'utilisateur possède la ressource
  begin
      // Affichage
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' POISSONS ');
      deplacerCurseurXY(15,11);
      write('Combien de poissons souhaitez vous vendre ?');

      // Saisie du nombre de ressource à vendre
      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

    if (nb <= Inv.poisson) then // On vérifie s'il a suffisamment de ressource
    begin
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' POISSONS ');

      Inv.poisson:=(Inv.poisson-nb);  // On retire de son inventaire les ressources qu'il a vendu
      argent_gagner:= (nb*3); // On calcule l'argent gagné
      Inv.argent:=(Inv.argent + argent_gagner); // On rajoute dans son inventaire l'argent gagné
      deplacerCurseurXY(15,11);
      // Affichage du message de succès.
      writeln('Vente réussite');
      deplacerCurseurXY(15,12);
      writeln('Il vous reste ', Inv.argent, ' et ', Inv.poisson, ' poissons');
    end
     else // Sinon on affiche un message d'erreur
       begin
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,4,Simple,11,0);
        deplacerCurseurXY(99,2);
        CouleurTexte(11);
        write(' POISSONS ');
        deplacerCurseurXY(15,11);
        write('Vous avez ', Inv.poisson, ', vous ne pouvez pas vendre ', nb, ' poissons.');
        deplacerCurseurXY(15,12);
        writeln('Veuillez patienter.');
        sleep(2000);
        vendre_poissons; // On le renvoie au menu de vente de sa ressource
       end;

     end
    else // On affiche un message d'erreur si l'utilisateur n'a pas cette ressource dans son inventaire
        begin
             effacerecran;
             dessinerCadreXY(10,3,190,25,Simple,11,0);
             dessinerCadreXY(80,1,125,4,Simple,11,0);
             deplacerCurseurXY(99,2);
             CouleurTexte(11);
             write(' POISSONS ');
             deplacerCurseurXY(15,11);
             write('Vous n',chr(39),'avez pas de poissons');
        end;
  end;

procedure vendre_bois();

var
  nb:Integer;
  argent_gagner:Integer;
begin
  nb:= getbois;
  if (Inv.bois >= 1) then
  begin
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' BOIS ');
      deplacerCurseurXY(15,11);
      write('Combien de bois souhaitez vous vendre ?');

      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

    if (nb <= Inv.bois) then
    begin
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' BOIS ');

      Inv.bois:=(Inv.bois-nb);
      argent_gagner:= (nb*5);
      Inv.argent:=(Inv.argent + argent_gagner);
      deplacerCurseurXY(15,11);
      writeln('Vente réussite');
      deplacerCurseurXY(15,12);
      writeln('Il vous reste ', Inv.argent, ' et ', Inv.bois, ' bois');
    end
     else
     begin
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,4,Simple,11,0);
        deplacerCurseurXY(99,2);
        CouleurTexte(11);
        write(' BOIS ');
        deplacerCurseurXY(15,11);
        write('Vous avez ', Inv.bois, ', vous ne pouvez pas vendre ', nb, ' bois.');
        deplacerCurseurXY(15,12);
        writeln('Veuillez patienter.');
        sleep(2000);
        vendre_bois;
     end;

  end
   else
        begin
             effacerecran;
             dessinerCadreXY(10,3,190,25,Simple,11,0);
             dessinerCadreXY(80,1,125,4,Simple,11,0);
             deplacerCurseurXY(99,2);
             CouleurTexte(11);
             write(' BOIS ');
             deplacerCurseurXY(15,11);
             write('Vous n''avez pas de bois');
        end;


end;

procedure vendre_tissu();

var
  nb:Integer;
  argent_gagner:Integer;
begin

  if (Inv.tissu >= 1) then
  begin
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' TISSUS ');
      deplacerCurseurXY(15,11);
      write('Combien de tissus souhaitez vous vendre ?');

      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

    if (nb <= Inv.tissu) then
    begin
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' OUTILS ');

      Inv.tissu:=(Inv.tissu-nb);
      argent_gagner:= (nb*8);
      Inv.argent:=(Inv.argent + argent_gagner);
      deplacerCurseurXY(15,11);
      writeln('Vente réussite');
      deplacerCurseurXY(15,12);
      writeln('Il vous reste ', Inv.argent, ' et ', Inv.tissu, ' tissu');
    end
     else
       begin
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,4,Simple,11,0);
        deplacerCurseurXY(99,2);
        CouleurTexte(11);
        write(' TISSUS ');
        deplacerCurseurXY(15,11);
        write('Vous avez ', Inv.tissu, ', vous ne pouvez pas vendre ', nb, ' tissus.');
        deplacerCurseurXY(15,12);
        writeln('Veuillez patienter.');
        sleep(2000);
        vendre_tissu;
       end;

  end
   else
        begin
             effacerecran;
             dessinerCadreXY(10,3,190,25,Simple,11,0);
             dessinerCadreXY(80,1,125,4,Simple,11,0);
             deplacerCurseurXY(99,2);
             CouleurTexte(11);
             write(' TISSUS ');
             deplacerCurseurXY(15,11);
             write('Vous n',chr(39),'avez pas de tissus');
        end;


end;

procedure vendre_laine();

var
  nb:Integer;
  argent_gagner:Integer;
begin

  if (Inv.laine >= 1) then
  begin
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' LAINES ');
      deplacerCurseurXY(15,11);
      write('Combien de laines souhaitez vous vendre ?');

      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

    if (nb <= Inv.laine) then
      begin
        effacerecran;
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,4,Simple,11,0);
        deplacerCurseurXY(99,2);
        CouleurTexte(11);
        write(' LAINES ');

        Inv.laine:=(Inv.laine-nb);
        argent_gagner:= (nb*8);
        Inv.argent:=(Inv.argent + argent_gagner);
        deplacerCurseurXY(15,11);
        writeln('Vente réussite');
        deplacerCurseurXY(15,12);
        writeln('Il vous reste ', Inv.argent, ' et ', Inv.laine, ' laines');
      end
    else
    begin
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' LAINES ');
      deplacerCurseurXY(15,11);
      write('Vous avez ', Inv.laine, ', vous ne pouvez pas vendre ', nb, ' laines.');
      deplacerCurseurXY(15,12);
      writeln('Veuillez patienter.');
      sleep(2000);
      vendre_laine;
    end;

  end
   else
        begin
             effacerecran;
             dessinerCadreXY(10,3,190,25,Simple,11,0);
             dessinerCadreXY(80,1,125,4,Simple,11,0);
             deplacerCurseurXY(99,2);
             CouleurTexte(11);
             write(' LAINES ');
             deplacerCurseurXY(15,11);
             write('Vous n',chr(39),'avez pas de laines');
             sleep(1000);
        end;


end;

procedure Surprise;
begin
  effacerEcran;
  dessinerCadreXY(80,28,120,32,Double,15,0);
  deplacerCurseurXY(86,30);
  couleurtexte(12);
  write('Quelqu',char(39),'un vient vers vous...');
  readln;
end;


//////////////////// ACHETER ////////////////////

procedure acheter_outils(diffi : Difficultes ); // Paramètre qui correspond à la difficulté, cela va permettre d'obtenir la limite de ressource

var
  nb:Integer; // Variable de type entière tapé par l'utilisateur et qui correspond au nombre de ressource qu'il souhaite acheter
  argent_perdu:Integer; // Variable de type entière permettant de stocker l'argent dépensé
begin

  if (Inv.argent >= outilsPrix) AND (Inv.outils < LimitR[diffi,Routil]) then // On vérifie que l'utilisateur possède assez d'argent pour acheter la ressource et qu'il n'a pas atteint sa limite en ressource
    begin
        // Affichage
        effacerecran;
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,4,Simple,11,0);
        deplacerCurseurXY(99,2);
        CouleurTexte(11);
        write(' OUTILS ');
        deplacerCurseurXY(15,11);
        write('Combien d',chr(39),'outils voulez-vous acheter ?');

        // Lecture du nombre de ressource qu'il souhaite acheter
        deplacerCurseurXY(15,14);
        write('Valeur: ');
        readln(nb);
        effacerecran;

      if (nb+getoutils > LimitR[diffi,Routil]) then // On vérifie que le nombre de ressource qu'il souhaite acheter ne soit pas supérieur à la limite
      begin
        // Dans le cas ou le nombre de ressource de demandé est supérieur
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,4,Simple,11,0);
        deplacerCurseurXY(99,2);
        CouleurTexte(11);
        write(' OUTILS ');
        deplacerCurseurXY(15,11);
        // Affichage du message d'erreur indiquant le nombre de ressource qu'il peut acheter au maximum
        write('Vous ne pouvez pas dépassez la limite de vos ressources.');
        deplacerCurseurXY(15,12);
        writeln('Vous pouvez acheter au maximum ', LimitR[diffi,Routil]-getoutils, 'outils');
        sleep(4000);
        acheter_outils(diffi); // On renvoie l'utilisateur au menu d'achat
      end
      else // Dans le cas ou il peut acheter les ressources sans dépasser la limite
          begin
            if (nb*outilsPrix <= Inv.argent) then // On regarde si le prix est bien dans son budget
              begin
                // Affichage
                effacerecran;
                dessinerCadreXY(10,3,190,25,Simple,11,0);
                dessinerCadreXY(80,1,125,4,Simple,11,0);
                deplacerCurseurXY(99,2);
                CouleurTexte(11);
                write(' OUTILS ');

                // On rajoute à son inventaire la ressource et retire l'argent qu'il a dépensé
                Inv.outils:=(Inv.outils+nb);
                argent_perdu:= (nb*outilsPrix);
                Inv.argent:=(Inv.argent - argent_perdu);
                deplacerCurseurXY(15,11);
                writeln('Achat réussi');
                deplacerCurseurXY(15,12);
                writeln('Il vous reste ', Inv.argent, ' et ', Inv.outils, ' outils');
              end
          else // Si ce qu'il demande n'est pas dans son budget on affiche un message d'erreur
              begin
                 dessinerCadreXY(10,3,190,25,Simple,11,0);
                 dessinerCadreXY(80,1,125,4,Simple,11,0);
                 deplacerCurseurXY(99,2);
                 CouleurTexte(11);
                 write(' OUTILS ');
                 deplacerCurseurXY(15,11);
                 write('Vous avez ', Inv.argent, ' pièces d',chr(39),'or, vous ne pouvez pas acheter ', nb, ' outils.');
                 deplacerCurseurXY(15,12);
                 writeln('Veuillez patienter.');
                 sleep(2000);
                 acheter_outils(diffi); // On renvoie l'utilisateur sur le menu d'achat de la ressource
              end;
          end;

    end
    else
        begin
             effacerecran;
             dessinerCadreXY(10,3,190,25,Simple,11,0);
             dessinerCadreXY(80,1,125,4,Simple,11,0);
             deplacerCurseurXY(99,2);
             CouleurTexte(11);
             write(' OUTILS ');
             deplacerCurseurXY(15,11);
             write('Vous n',chr(39),'avez pas assez d',chr(39),'or');
        end;
end;

procedure acheter_poisson(diffi : Difficultes);

var
  nb:Integer;
  argent_perdu:Integer;
begin

  if (Inv.argent >= poissonPrix) then
    begin

      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' POISSONS ');
      deplacerCurseurXY(15,11);
      write('Combien de poissons voulez-vous acheter ?');

      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

      if (nb+getpoisson > LimitR[diffi,Rpoisson]) then
      begin
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,4,Simple,11,0);
        deplacerCurseurXY(99,2);
        CouleurTexte(11);
        write(' POISSONS ');
        deplacerCurseurXY(15,11);
        write('Vous ne pouvez pas dépassez la limite de vos ressources.');
        deplacerCurseurXY(15,12);
        writeln('Vous pouvez acheter au maximum ', LimitR[diffi,Rpoisson]-getpoisson, ' poissons.');
        sleep(4000);
        acheter_poisson(diffi);
      end
      else
          begin
            if (nb*poissonPrix <= Inv.argent) then
              begin
                effacerecran;
                dessinerCadreXY(10,3,190,25,Simple,11,0);
                dessinerCadreXY(80,1,125,4,Simple,11,0);
                deplacerCurseurXY(99,2);
                CouleurTexte(11);
                write(' POISSONS ');

                Inv.poisson:=(Inv.poisson+nb);
                argent_perdu:= (nb*poissonPrix);
                Inv.argent:=(Inv.argent - argent_perdu);
                deplacerCurseurXY(15,11);
                writeln('Achat réussi');
                deplacerCurseurXY(15,12);
                writeln('Il vous reste ', Inv.argent, ' et ', Inv.poisson, ' poissons');
              end
          else
              begin
                 dessinerCadreXY(10,3,190,25,Simple,11,0);
                 dessinerCadreXY(80,1,125,4,Simple,11,0);
                 deplacerCurseurXY(99,2);
                 CouleurTexte(11);
                 write(' POISSONS ');
                 deplacerCurseurXY(15,11);
                 write('Vous avez ', Inv.argent, ' pièces d',chr(39),'or, vous ne pouvez pas acheter ', nb, ' poissons.');
                 deplacerCurseurXY(15,12);
                 writeln('Veuillez patienter.');
                 sleep(2000);
                 acheter_poisson(diffi);
              end;

          end
      end
   else
        begin
             effacerecran;
             dessinerCadreXY(10,3,190,25,Simple,11,0);
             dessinerCadreXY(80,1,125,4,Simple,11,0);
             deplacerCurseurXY(99,2);
             CouleurTexte(11);
             write(' OUTILS ');
             deplacerCurseurXY(15,11);
             write('Vous n',chr(39),'avez pas assez d',chr(39),'or');
        end;
end;

procedure acheter_laine(diffi : Difficultes);

var
  nb:Integer;
  argent_perdu:Integer;
begin

  if (Inv.argent >= lainePrix) then
    begin

      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' LAINES ');
      deplacerCurseurXY(15,11);
      write('Combien de laines voulez-vous acheter ?');

      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

      if (nb+getlaine > LimitR[diffi,Rlaine]) then
        begin
          dessinerCadreXY(10,3,190,25,Simple,11,0);
          dessinerCadreXY(80,1,125,4,Simple,11,0);
          deplacerCurseurXY(99,2);
          CouleurTexte(11);
          write(' LAINES ');
          deplacerCurseurXY(15,11);
          write('Vous ne pouvez pas dépassez la limite de vos ressources.');
          deplacerCurseurXY(15,12);
          writeln('Vous pouvez acheter au maximum ', LimitR[diffi,Rlaine]-getlaine, ' laines.');
          sleep(4000);
          acheter_laine(diffi);
        end
        else
            begin
              if (nb*lainePrix <= Inv.argent) then
                begin
                  effacerecran;
                  dessinerCadreXY(10,3,190,25,Simple,11,0);
                  dessinerCadreXY(80,1,125,4,Simple,11,0);
                  deplacerCurseurXY(99,2);
                  CouleurTexte(11);
                  write(' LAINES ');

                  Inv.laine:=(Inv.laine+nb);
                  argent_perdu:= (nb*lainePrix);
                  Inv.argent:=(Inv.argent - argent_perdu);
                  deplacerCurseurXY(15,11);
                  writeln('Achat réussi');
                  deplacerCurseurXY(15,12);
                  writeln('Il vous reste ', Inv.argent, ' et ', Inv.laine, ' poissons');
                end
              else
                  begin
                     dessinerCadreXY(10,3,190,25,Simple,11,0);
                     dessinerCadreXY(80,1,125,4,Simple,11,0);
                     deplacerCurseurXY(99,2);
                     CouleurTexte(11);
                     write(' LAINES ');
                     deplacerCurseurXY(15,11);
                     write('Vous avez ', Inv.argent, ' pièces d''or, vous ne pouvez pas acheter ', nb, ' laines.');
                     deplacerCurseurXY(15,12);
                     writeln('Veuillez patienter.');
                     sleep(2000);
                     acheter_laine(diffi);
                  end;
           end;
  end
   else
        begin
             effacerecran;
             dessinerCadreXY(10,3,190,25,Simple,11,0);
             dessinerCadreXY(80,1,125,4,Simple,11,0);
             deplacerCurseurXY(99,2);
             CouleurTexte(11);
             write(' LAINES ');
             deplacerCurseurXY(15,11);
             write('Vous n',chr(39),'avez pas assez d',chr(39),'or');
        end;
end;

procedure acheter_tissu(diffi : Difficultes);

var
  nb:Integer;
  argent_perdu:Integer;
begin

  if (Inv.argent >= tissuPrix) then
    begin

      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' TISSUS ');
      deplacerCurseurXY(15,11);
      write('Combien de tissus voulez-vous acheter ?');

      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

      if (nb+gettissu > LimitR[diffi,Rtissu]) then
        begin
          dessinerCadreXY(10,3,190,25,Simple,11,0);
          dessinerCadreXY(80,1,125,4,Simple,11,0);
          deplacerCurseurXY(99,2);
          CouleurTexte(11);
          write(' TISSUS ');
          deplacerCurseurXY(15,11);
          write('Vous ne pouvez pas dépassez la limite de vos ressources.');
          deplacerCurseurXY(15,12);
          writeln('Vous pouvez acheter au maximum ', LimitR[diffi,Rtissu]-gettissu, ' tissus.');
          sleep(4000);
          acheter_tissu(diffi);
        end
        else
            begin
              if (nb*tissuPrix <= Inv.argent) then
                begin
                  effacerecran;
                  dessinerCadreXY(10,3,190,25,Simple,11,0);
                  dessinerCadreXY(80,1,125,4,Simple,11,0);
                  deplacerCurseurXY(99,2);
                  CouleurTexte(11);
                  write(' TISSUS ');

                  Inv.tissu:=(Inv.tissu+nb);
                  argent_perdu:= (nb*tissuPrix);
                  Inv.argent:=(Inv.argent - argent_perdu);
                  deplacerCurseurXY(15,11);
                  writeln('Achat réussi');
                  deplacerCurseurXY(15,12);
                  writeln('Il vous reste ', Inv.argent, ' et ', Inv.tissu, ' tissus');
                end
            else
                begin
                   dessinerCadreXY(10,3,190,25,Simple,11,0);
                   dessinerCadreXY(80,1,125,4,Simple,11,0);
                   deplacerCurseurXY(99,2);
                   CouleurTexte(11);
                   write(' TISSUS ');
                   deplacerCurseurXY(15,11);
                   write('Vous avez ', Inv.argent, ' pièces d',chr(39),'or, vous ne pouvez pas acheter ', nb, ' tissu.');
                   deplacerCurseurXY(15,12);
                   writeln('Veuillez patienter.');
                   sleep(2000);
                   acheter_tissu(diffi);
                end;

            end;
    end
   else
        begin
             effacerecran;
             dessinerCadreXY(10,3,190,25,Simple,11,0);
             dessinerCadreXY(80,1,125,4,Simple,11,0);
             deplacerCurseurXY(99,2);
             CouleurTexte(11);
             write(' TISSUS ');
             deplacerCurseurXY(15,11);
             write('Vous n',chr(39),'avez pas assez d',chr(39),'or');
        end;
end;

procedure acheter_bois(diffi : Difficultes);

var
  nb:Integer;
  argent_perdu:Integer;
begin

  if (Inv.bois >= boisPrix) then
    begin

      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' BOIS ');
      deplacerCurseurXY(15,11);
      write('Combien de bois voulez-vous acheter ?');

      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

      if (nb+getbois > LimitR[diffi,Rbois]) then
        begin
          dessinerCadreXY(10,3,190,25,Simple,11,0);
          dessinerCadreXY(80,1,125,4,Simple,11,0);
          deplacerCurseurXY(99,2);
          CouleurTexte(11);
          write(' BOIS ');
          deplacerCurseurXY(15,11);
          write('Vous ne pouvez pas dépassez la limite de vos ressources.');
          deplacerCurseurXY(15,12);
          writeln('Vous pouvez acheter au maximum ', LimitR[diffi,Rbois]-getbois, ' bois.');
          sleep(4000);
          acheter_bois(diffi);
        end
        else
            begin
              if (nb*boisPrix <= Inv.argent) then
                begin
                  effacerecran;
                  dessinerCadreXY(10,3,190,25,Simple,11,0);
                  dessinerCadreXY(80,1,125,4,Simple,11,0);
                  deplacerCurseurXY(99,2);
                  CouleurTexte(11);
                  write(' BOIS ');

                  Inv.bois:=(Inv.bois+nb);
                  argent_perdu:= (nb*boisPrix);
                  Inv.argent:=(Inv.argent - argent_perdu);
                  deplacerCurseurXY(15,11);
                  writeln('Achat réussi');
                  deplacerCurseurXY(15,12);
                  writeln('Il vous reste ', Inv.argent, ' et ', Inv.bois, ' bois');
                end
            else
                begin
                   dessinerCadreXY(10,3,190,25,Simple,11,0);
                   dessinerCadreXY(80,1,125,4,Simple,11,0);
                   deplacerCurseurXY(99,2);
                   CouleurTexte(11);
                   write(' BOIS ');
                   deplacerCurseurXY(15,11);
                   write('Vous avez ', Inv.argent, ' pièces d',chr(39),'or, vous ne pouvez pas acheter ', nb, ' bois.');
                   deplacerCurseurXY(15,12);
                   writeln('Veuillez patienter.');
                   sleep(2000);
                   acheter_bois(diffi);
                end;

            end;
    end
   else
        begin
             effacerecran;
             dessinerCadreXY(10,3,190,25,Simple,11,0);
             dessinerCadreXY(80,1,125,4,Simple,11,0);
             deplacerCurseurXY(99,2);
             CouleurTexte(11);
             write(' OUTILS ');
             deplacerCurseurXY(15,11);
             write('Vous n',chr(39),'avez pas assez d',chr(39),'or');
        end;
end;
//

procedure ShowMenuMarchant; // Procédure qui va afficher le menu d'achat du marchant
var
  nombre:integer; // Variable de type entière qui permet de stocker un chiffre aléatoire en 0 et 100
  choix,choix2:integer; // Variable de type entière correspondant au choix fait par l'utilisateur

begin
  nombre:=random(100); // On initialise la variable avec un chiffre aléatoire
  if (nombre >= 50) then // Si ce chiffre est supérieur ou égal à 50 on appelle toutes ces procédures
     begin
       Surprise;
       effacerEcran;
       CadreMarchant;
       InformationGlobale;
       Commerce;
       OptionMarchant;
       repeat // On demande au joueur de faire un choix entre acheter, vendre ou ne rien faire
          deplacerCurseurXY(71,52);
          couleurTexte(15);
          write('Quel est votre choix ?');
          deplacerCurseurXY(94,52);
          write('                  ');
          deplacerCurseurXY(95,52);
          readln(choix);

          if (choix<0) or (choix>=3) then // Affichage d'un message d'erreur si le choix n'est pas valide
             begin
                 deplacerCurseurXY(71,56);
                 couleurTexte(12);
                 write('/!\');
                 couleurTexte(15);
                 write('Veuillez écrire un choix valide!');
             end;
          if choix=0 then // Choix de ne rien faire
             begin
                  {Ne Rien Faire}
             end;
          if choix=1 then // Choix de vendre des ressources
             begin
                  repeat
                    // Affichage
                    effacerEcran;
                    CadreMarchant;
                    InformationGlobale;
                    Commerce;
                    OptionMarchantVendre;
                    LogoVendre;
                    deplacerCurseurXY(71,52);
                    couleurTexte(15);
                    write('Que voulez-vous ');
                    couleurtexte(12);
                    write('vendre');
                    couleurtexte(15);
                    write(' ?');
                    deplacerCurseurXY(97,52);
                    write('                  ');
                    deplacerCurseurXY(97,52);
                    readln(choix2); // Lecture du choix correspondant à la ressource à vendre

                    case choix2 of // Pour chacun des choix on ouvre le menu qui lui est attribué
                    0 : begin // Ne rien faire
                            effacerEcran;
                            CadreMarchant;
                            InformationGlobale;
                            Commerce;
                            OptionMarchant;
                       end;
                    1 : begin // Vendre poissons
                            vendre_poissons;
                            sleep(1000);
                            OptionMarchant;
                       end;
                    2 : begin // Vendre bois
                            vendre_bois;
                            sleep(1000);
                            OptionMarchant;
                       end;
                    3 : begin // Vendre outils
                            vendre_outils;
                            sleep(1000);
                            OptionMarchant;
                       end;
                    4 : begin // Vendre laine
                            vendre_laine;
                            sleep(1000);
                            OptionMarchant;
                       end;
                    5 : begin // Vendre tissu
                            vendre_tissu;
                            sleep(1000);
                            OptionMarchant;
                       end;
                    end;

                  until (choix2=0);
                  effacerLogo;
             end;
          if choix=2 then // Sélection du choix 2 correspondant à l'achat d'une ressource
             begin
                  repeat
                    effacerEcran;
                    CadreMarchant;
                    InformationGlobale;
                    Commerce;
                    OptionMarchantVendre;
                    LogoAcheter;
                    deplacerCurseurXY(71,52);
                    couleurTexte(15);
                    write('Que voulez-vous ');
                    couleurtexte(10);
                    write('acheter');
                    couleurtexte(15);
                    write(' ?');
                    deplacerCurseurXY(97,52);
                    write('                  ');
                    deplacerCurseurXY(97,52);
                    readln(choix2); // Lecture de la ressource que l'utilisateur souhaite vendre

                    case choix2 of // Affichage du menu lié au choix sélectionnenr
                    0 : begin
                            effacerEcran;
                            CadreMarchant;
                            InformationGlobale;
                            Commerce;
                            OptionMarchant;
                       end;
                    1 : begin
                            acheter_poisson(getNiveauActuel);
                            sleep(1000);
                            OptionMarchant;
                       end;
                    2 : begin
                            acheter_bois(getNiveauActuel);
                            sleep(1000);
                            OptionMarchant;
                       end;
                    3 : begin
                            acheter_outils(getNiveauActuel);
                            sleep(1000);
                            OptionMarchant;
                       end;
                    4 : begin
                            acheter_laine(getNiveauActuel);
                            sleep(1000);
                            OptionMarchant;
                       end;
                    5 : begin
                            acheter_tissu(getNiveauActuel);
                            sleep(1000);
                            OptionMarchant;
                       end;
                    end;

                  until (choix2=0);
                  effacerLogo;
             end;

        until (choix=0);
     end;
end;

end.


