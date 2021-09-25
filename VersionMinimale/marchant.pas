unit Marchant;
{$codepage utf8}

interface

uses
  Classes, SysUtils,GestionEcran,Ressource,MenuNouvellePartie;

var
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
procedure vendre_poissons();
procedure vendre_bois();
procedure vendre_tissu();
procedure vendre_outils();
procedure vendre_laine();

implementation

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

procedure InformationGlobale;
begin
     //Données en haut à gauche (Nom du joueur et Or)
  deplacerCurseurXY(10,2);
  write('Nom du joueur  :  ',Perso.nom);
  deplacerCurseurXY(10,3);
  write('Or             :  ',getArgent);

end;

procedure CadreMarchant;
begin
  //Cadre Générale
  dessinerCadreXY(0,0,198,58,Double,15,0);
  dessinerCadreXY(60,0,140,4,Double,15,0);
  deplacerCurseurXY(80,2);
  write('Rencontre avec le Marchant - Dayfell Cay');
end;

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

procedure Commerce;


begin
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
  write(getPoisson);
  deplacerCurseurXY(120,13);
  write('| Prix : ',poissonPrix);

  deplacerCurseurXY(55,14);
  write('Bois :');
  deplacerCurseurXY(80,14);
  write(getBois);
  deplacerCurseurXY(120,14);
  write('| Prix : ',boisPrix);

  deplacerCurseurXY(55,15);
  write('Outils :');
  deplacerCurseurXY(80,15);
  write(getOutils);
  deplacerCurseurXY(120,15);
  write('| Prix : ',outilsPrix);

  deplacerCurseurXY(55,16);
  write('Laine :');
  deplacerCurseurXY(80,16);
  write(getLaine);
  deplacerCurseurXY(120,16);
  write('| Prix : ',lainePrix);

  deplacerCurseurXY(55,17);
  write('Tissu :');
  deplacerCurseurXY(80,17);
  write(getTissu);
  deplacerCurseurXY(120,17);
  write('| Prix : ',tissuPrix);

end;

// VENDRE

procedure vendre_outils();

var
  nb:Integer;
  argent_gagner:Integer;
begin

  if (Inv.outils >= 1) then
  begin
      // Bordure  + laine
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' OUTILS ');
      deplacerCurseurXY(15,11);
      write('Combien d''outils souhaitez vous vendre ?');

      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

    if (nb <= Inv.outils) then
      begin
        effacerecran;
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,4,Simple,11,0);
        deplacerCurseurXY(99,2);
        CouleurTexte(11);
        write(' OUTILS ');

        Inv.outils:=(Inv.outils-nb);
        argent_gagner:= (nb*15);
        Inv.argent:=(Inv.argent + argent_gagner);
        deplacerCurseurXY(15,11);
        writeln('Vente réussite');
        deplacerCurseurXY(15,12);
        writeln('Il vous reste ', Inv.argent, ' et ', Inv.outils, ' outils');
      end
  else
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
         vendre_outils;
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
             write('Vous n''avez pas d''outils');
        end;
end;

procedure vendre_poissons();

var
  nb:Integer;
  argent_gagner:Integer;
begin

  if (Inv.poisson >= 1) then
  begin
      // Bordure  + laine
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' POISSONS ');
      deplacerCurseurXY(15,11);
      write('Combien de poissons souhaitez vous vendre ?');

      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

    if (nb <= Inv.poisson) then
    begin
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' POISSONS ');

      Inv.poisson:=(Inv.poisson-nb);
      argent_gagner:= (nb*3);
      Inv.argent:=(Inv.argent + argent_gagner);
      deplacerCurseurXY(15,11);
      writeln('Vente réussite');
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
        write('Vous avez ', Inv.poisson, ', vous ne pouvez pas vendre ', nb, ' poissons.');
        deplacerCurseurXY(15,12);
        writeln('Veuillez patienter.');
        sleep(2000);
        vendre_poissons;
       end;

     end
    else
        begin
             effacerecran;
             dessinerCadreXY(10,3,190,25,Simple,11,0);
             dessinerCadreXY(80,1,125,4,Simple,11,0);
             deplacerCurseurXY(99,2);
             CouleurTexte(11);
             write(' POISSONS ');
             deplacerCurseurXY(15,11);
             write('Vous n''avez pas de poissons');
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
      // Bordure  + laine
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
      // Bordure  + laine
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
             write('Vous n''avez pas de tissus');
        end;


end;

procedure vendre_laine();

var
  nb:Integer;
  argent_gagner:Integer;
begin

  if (Inv.laine >= 1) then
  begin
      // Bordure  + laine
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
             write('Vous n''avez pas de laines');
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


// ACHETER

procedure acheter_outils();

var
  nb:Integer;
  argent_perdu:Integer;
begin

  if (Inv.argent >= outilsPrix) then
  begin
      // Bordure  + laine
      effacerecran;
      dessinerCadreXY(10,3,190,25,Simple,11,0);
      dessinerCadreXY(80,1,125,4,Simple,11,0);
      deplacerCurseurXY(99,2);
      CouleurTexte(11);
      write(' OUTILS ');
      deplacerCurseurXY(15,11);
      write('Combien d''outils voulez-vous acheter ?');

      deplacerCurseurXY(15,14);
      write('Valeur: ');
      readln(nb);
      effacerecran;

    if (nb*outilsPrix <= Inv.argent) then
      begin
        effacerecran;
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,4,Simple,11,0);
        deplacerCurseurXY(99,2);
        CouleurTexte(11);
        write(' OUTILS ');

        Inv.outils:=(Inv.outils+nb);
        argent_perdu:= (nb*outilsPrix);
        Inv.argent:=(Inv.argent - argent_perdu);
        deplacerCurseurXY(15,11);
        writeln('Achat réussi');
        deplacerCurseurXY(15,12);
        writeln('Il vous reste ', Inv.argent, ' et ', Inv.outils, ' outils');
      end
  else
      begin
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,4,Simple,11,0);
         deplacerCurseurXY(99,2);
         CouleurTexte(11);
         write(' OUTILS ');
         deplacerCurseurXY(15,11);
         write('Vous avez ', Inv.argent, ' pièces d''or, vous ne pouvez pas acheter ', nb, ' outils.');
         deplacerCurseurXY(15,12);
         writeln('Veuillez patienter.');
         sleep(2000);
         acheter_outils;
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
             write('Vous n''avez pas assez d''or');
        end;
end;

procedure acheter_poisson();

var
  nb:Integer;
  argent_perdu:Integer;
begin

  if (Inv.argent >= poissonPrix) then
  begin
      // Bordure  + laine
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

    if (nb*poissonPrix <= Inv.argent) then
      begin
        effacerecran;
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,4,Simple,11,0);
        deplacerCurseurXY(99,2);
        CouleurTexte(11);
        write(' POISSONS ');

        Inv.outils:=(Inv.outils+nb);
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
         write('Vous avez ', Inv.argent, ' pièces d''or, vous ne pouvez pas acheter ', nb, ' poissons.');
         deplacerCurseurXY(15,12);
         writeln('Veuillez patienter.');
         sleep(2000);
         acheter_poisson;
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
             write('Vous n''avez pas assez d''or');
        end;
end;

procedure acheter_laine();

var
  nb:Integer;
  argent_perdu:Integer;
begin

  if (Inv.argent >= lainePrix) then
  begin
      // Bordure  + laine
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
         acheter_laine;
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
             write('Vous n''avez pas assez d''or');
        end;
end;

procedure acheter_tissu();

var
  nb:Integer;
  argent_perdu:Integer;
begin

  if (Inv.argent >= tissuPrix) then
  begin
      // Bordure  + laine
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
         write('Vous avez ', Inv.argent, ' pièces d''or, vous ne pouvez pas acheter ', nb, ' tissu.');
         deplacerCurseurXY(15,12);
         writeln('Veuillez patienter.');
         sleep(2000);
         acheter_tissu;
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
             write('Vous n''avez pas assez d''or');
        end;
end;

procedure acheter_bois();

var
  nb:Integer;
  argent_perdu:Integer;
begin

  if (Inv.bois >= boisPrix) then
  begin
      // Bordure  + laine
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
         write('Vous avez ', Inv.argent, ' pièces d''or, vous ne pouvez pas acheter ', nb, ' bois.');
         deplacerCurseurXY(15,12);
         writeln('Veuillez patienter.');
         sleep(2000);
         acheter_bois;
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
             write('Vous n''avez pas assez d''or');
        end;
end;
//

procedure ShowMenuMarchant;
var
  nombre:integer;
  choix,choix2:integer;

begin
  nombre:=random(100);
  if (nombre >= 50) then
     begin
       Surprise;
       effacerEcran;
       CadreMarchant;
       InformationGlobale;
       Commerce;
       OptionMarchant;
       repeat
          deplacerCurseurXY(71,52);
          couleurTexte(15);
          write('Quel est votre choix ?');
          deplacerCurseurXY(94,52);
          write('                  ');
          deplacerCurseurXY(95,52);
          readln(choix);

          if (choix<0) or (choix>=3) then
             begin
                 deplacerCurseurXY(71,56);
                 couleurTexte(12);
                 write('/!\');
                 couleurTexte(15);
                 write('Veuillez écrire un choix valide!');
             end;
          if choix=0 then
             begin
                  {Ne Rien Faire}
             end;
          if choix=1 then
             begin
                  repeat
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
                    readln(choix2);

                    if (choix2<0) or (choix2>=6) then
                       begin
                         deplacerCurseurXY(71,56);
                         couleurTexte(12);
                         write('/!\');
                         couleurTexte(15);
                         write('Veuillez écrire un choix valide!');
                       end;
                    if choix2=0 then
                       begin
                         effacerEcran;
                         CadreMarchant;
                         InformationGlobale;
                         Commerce;
                         OptionMarchant;
                       end;
                    if choix2=1 then
                       begin
                            vendre_poissons;
                            sleep(1000);
                            OptionMarchant;
                       end;
                    if choix2=2 then
                       begin
                            vendre_bois;
                            sleep(1000);
                            OptionMarchant;
                       end;
                    if choix2=3 then
                       begin
                            vendre_outils;
                            sleep(1000);
                            OptionMarchant;
                       end;
                    if choix2=4 then
                       begin
                            vendre_laine;
                            sleep(1000);
                            OptionMarchant;
                       end;
                    if choix2=5 then
                       begin
                            vendre_tissu;
                            sleep(1000);
                            OptionMarchant;
                       end;

                  until (choix2=0);
                  effacerLogo;
             end;
          if choix=2 then
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
                    readln(choix2);

                    if (choix2<0) AND (choix2>=6) then
                       begin
                         deplacerCurseurXY(71,56);
                         couleurTexte(12);
                         write('/!\');
                         couleurTexte(15);
                         write('Veuillez écrire un choix valide!');

                       end;
                    if choix2=0 then
                       begin
                         effacerEcran;
                         CadreMarchant;
                         InformationGlobale;
                         Commerce;
                         OptionMarchant;
                       end;
                    if choix2=1 then
                       begin
                            acheter_poisson();
                            sleep(1000);
                            OptionMarchant;
                       end;
                    if choix2=2 then
                       begin
                            acheter_bois();
                            sleep(1000);
                            OptionMarchant;
                       end;
                    if choix2=3 then
                       begin
                            acheter_outils();
                            sleep(1000);
                            OptionMarchant;
                       end;
                    if choix2=4 then
                       begin
                            acheter_laine();
                            sleep(1000);
                            OptionMarchant;
                       end;
                    if choix2=5 then
                       begin
                            acheter_tissu();
                            sleep(1000);
                            OptionMarchant;
                       end;

                  until (choix2=0);
                  effacerLogo;
             end;

        until (choix=0);
     end;
end;

end.

