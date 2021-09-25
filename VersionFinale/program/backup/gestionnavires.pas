unit GestionNavires;
{$codepage utf8}
interface

uses
  Classes, SysUtils,GestionEcran,MenuNouvellePartie,Ressource,AchatNavire,AmeliorationBateau,CombatNaval;


procedure ShowMenuNavires;
procedure Navires;
procedure InformationGlobale;
procedure CadreNavires;
procedure OptionsNavires;
procedure dessinBateau;

//Affichage des Explorations en cours
procedure Exploration1();
procedure Exploration2();
procedure Exploration3();
procedure Exploration4();

//Affichage des progressions des Bateaux D'Explorations
procedure Progression1();
procedure Progression2();
procedure Progression3();
procedure Progression4();

//Ajouté +1 de progression pour chaque bateau d'exploration acheté
procedure ProgressionPlusUN;

//Initialiser les variables sur les Bateaux d'Explorations
procedure initialisationExploration();


implementation
procedure initialisationExploration();
begin
  //Mise à 0 de la progression des bateaux d'explorations
  Prog.Progression1 := 0;
  Prog.Progression2 := 0;
  Prog.Progression3 := 0;
  Prog.Progression4 := 0;

  //Mise à False l'Etat des bateaux d'explorations (False = Pas Acheté, True = Acheté)
  E.BateauExploration1 := False;
  E.BateauExploration2 := False;
  E.BateauExploration3 := False;
  E.BateauExploration4 := False;

  //Mise à False l'Etat de progression finale des bateaux d'explorations (False = Pas Exploration Fini, True = Exploration Fini)
  PF.FinExploration1 := False;
  PF.FinExploration2 := False;
  PF.FinExploration3 := False;
  PF.FinExploration4 := False;

  //Mise en place de l'Etat de découverte des îles (True = Ile découverte, False = Ile pas encore découverte)
  Dec.Ile1 := True;
  Dec.Ile2 := False;
  Dec.Ile3 := False;
  Dec.Ile4 := False;
  Dec.Ile5 := False;
  Dec.Ile6 := False;
  Dec.Ile7 := False;
  Dec.Ile8 := False;
  Dec.Ile9 := False;
end;

procedure dessinBateau;
var
      CurseurDessinBateau:coordonnees;

begin
    deplacerCurseurXY(17,12);
    CurseurDessinBateau:=positionCurseur();
    write('                                              _  _');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('                                             ',Chr (39),' \/ ',Chr (39),'');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('_  _                      <|');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write(' \/            __',Chr (39),'__     __',Chr (39),'__      __',Chr (39),'__');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('              /    /    /    /     /    /');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('             /\____\    \____\     \____\               _  _');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('            / ___!___   ___!___    ___!___               \/');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('          // (      (  (      (   (      (');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('        / /   \______\  \______\   \______\');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('      /  /   ____!_____ ___!______ ____!_____  ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('    /   /   /         //         //         /  ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('  /    /   |         ||         ||         |   ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('/_____/    \         \\         \\         \ ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('    \       \_________\\_________\\_________\   ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('     \         |          |         |           ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('      \________!__________!_________!________/  ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('       \|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_/|   ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('        \    _______________                /     ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('^^^%%%^%^^^%^%%^\_"/_)/_)_/_)__)/_)/)/)_)_"_',Chr (39),'_"_//)/)/)/)%%%^^^%^^%%%%^ ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('^!!^^"!%%!^^^!^^^!!^^^%%%%%!!!!^^^%%^^^!!%%%%^^^!!!!!!%%%^^^^%^^%%%^^^! ');
end;

procedure InformationGlobale;
begin
     //Données en haut à gauche (Nom du joueur et Or)
  deplacerCurseurXY(10,2);
  write('Nom du joueur  :  ',Perso.nom);
  deplacerCurseurXY(10,3);
  write('Or             :  ',getArgent);

end;

procedure CadreNavires;
begin
  //Cadre Générale
  dessinerCadreXY(0,0,198,58,Double,15,0);
  dessinerCadreXY(60,0,140,4,Double,15,0);
  deplacerCurseurXY(92,2);
  write('Gestion des Navires');
end;

procedure Navires;
begin
     //Liste des Navires
//Cadre
  dessinerCadreXY(105,10,190,55,Simple,15,0);
  dessinerCadreXY(137,9,160,11,Simple,15,0);
  deplacerCurseurXY(141,10);
  write('Liste des navires');

//Contenu
  deplacerCurseurXY(112,13);
  write('Navire de colonisation  : ');
  deplacerCurseurXY(145,13);
  write('Vous avez ',getNavireColonisation,' navire(s) de colonisation.');

  deplacerCurseurXY(112,14);
  write('Navire de d',chr(39),'exploration :');
  deplacerCurseurXY(145,14);
  write('Vous avez ',getNavireExploration,' navire(s) de d',chr(39),'exploration.');

  deplacerCurseurXY(112,15);
  write('Navire de transport     :');
  deplacerCurseurXY(145,15);
  write('Vous avez ',getNavireTransport,' navire(s) de transport.');

end;


procedure Exploration1();
begin
  if (getEtatExploration1=true) then
     begin
         dessinerCadreXY(107,18,188,23,Simple,15,0);
         dessinerCadreXY(135,17,162,19,Simple,15,0);
         deplacerCurseurXY(137,18);
         write('Bateau d',chr(39),'exploration n°1');

         deplacerCurseurXY(108,19);
         write('PV : ',VG[1]);

         deplacerCurseurXY(112,21);
         write('Progression : ');
         dessinerCadreXY(126,20,180,22,Simple,15,0);
         Progression1();
     end;

end;

procedure Exploration2();
begin
  if (getEtatExploration2=true) then
     begin
          dessinerCadreXY(107,26,188,31,Simple,15,0);
          dessinerCadreXY(135,25,162,27,Simple,15,0);
          deplacerCurseurXY(137,26);
          write('Bateau d',chr(39),'exploration n°2');

          deplacerCurseurXY(108,27);
          write('PV : ',VG[2]);

          deplacerCurseurXY(112,29);
          write('Progression : ');
          dessinerCadreXY(126,28,180,30,Simple,15,0);
          Progression2();
     end;
end;

procedure Exploration3();
begin
  if (getEtatExploration3=true) then
     begin
          dessinerCadreXY(107,34,188,39,Simple,15,0);
          dessinerCadreXY(135,33,162,35,Simple,15,0);
          deplacerCurseurXY(137,34);
          write('Bateau d',chr(39),'exploration n°3');

          deplacerCurseurXY(108,35);
          write('PV : ',VG[3]);

          deplacerCurseurXY(112,37);
          write('Progression : ');
          dessinerCadreXY(126,36,180,38,Simple,15,0);
          Progression3();
     end;
end;

procedure Exploration4();
begin
  if (getEtatExploration4=true) then
    begin
          dessinerCadreXY(107,42,188,47,Simple,15,0);
          dessinerCadreXY(135,41,162,43,Simple,15,0);
          deplacerCurseurXY(137,42);
          write('Bateau d',chr(39),'exploration n°4');

          deplacerCurseurXY(108,43);
          write('PV : ',VG[4]);

          deplacerCurseurXY(112,45);
          write('Progression : ');
          dessinerCadreXY(126,44,180,46,Simple,15,0);
          Progression4();
    end;
end;


procedure ProgressionPlusUN;
begin
  if (getEtatExploration1 = true) then
     Prog.Progression1 := Prog.Progression1+1;

  if (getEtatExploration2 = true) then
     Prog.Progression2 := Prog.Progression2+1;

  if (getEtatExploration3 = true) then
     Prog.Progression3 := Prog.Progression3+1;

  if (getEtatExploration4 = true) then
     Prog.Progression4 := Prog.Progression4+1;

  if Prog.Progression1>=6 then
     PF.FinExploration1 := true;

  if Prog.Progression2>=6 then
     PF.FinExploration2 := true;

  if Prog.Progression3>=6 then
     PF.FinExploration3 := true;

  if Prog.Progression4>=6 then
     PF.FinExploration4 := true;
end;

procedure Progression1();

begin
    if Prog.Progression1=1 then
       begin
            deplacerCurseurXY(127,21);
            write(#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression1=2 then
       begin
            deplacerCurseurXY(127,21);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression1=3 then
       begin
            deplacerCurseurXY(127,21);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression1=4 then
       begin
            deplacerCurseurXY(127,21);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression1=5 then
       begin
            deplacerCurseurXY(127,21);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression1>=6 then
       begin
            couleurTexte(13);
            deplacerCurseurXY(127,21);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
            couleurTexte(15);
       end
    else
       begin
            deplacerCurseurXY(127,21);
            write(' ');
       end;

end;

procedure Progression2();

begin
    if Prog.Progression2=1 then
       begin
            deplacerCurseurXY(127,29);
            write(#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression2=2 then
       begin
            deplacerCurseurXY(127,29);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression2=3 then
       begin
            deplacerCurseurXY(127,29);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression2=4 then
       begin
            deplacerCurseurXY(127,29);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression2=5 then
       begin
            deplacerCurseurXY(127,29);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression2>=6 then
       begin
            couleurTexte(13);
            deplacerCurseurXY(127,29);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
            couleurTexte(15);
       end
    else
       begin
            deplacerCurseurXY(127,29);
            write(' ');
       end;

end;

procedure Progression3();

begin
    if Prog.Progression3=1 then
       begin
            deplacerCurseurXY(127,37);
            write(#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression3=2 then
       begin
            deplacerCurseurXY(127,37);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression3=3 then
       begin
            deplacerCurseurXY(127,37);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression3=4 then
       begin
            deplacerCurseurXY(127,37);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression3=5 then
       begin
            deplacerCurseurXY(127,37);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression3>=6 then
       begin
            couleurTexte(13);
            deplacerCurseurXY(127,37);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
            couleurTexte(15);
       end
    else
       begin
            deplacerCurseurXY(127,37);
            write(' ');
       end;

end;

procedure Progression4();

begin
    if Prog.Progression4=1 then
       begin
            deplacerCurseurXY(127,45);
            write(#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression4=2 then
       begin
            deplacerCurseurXY(127,45);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression4=3 then
       begin
            deplacerCurseurXY(127,45);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression4=4 then
       begin
            deplacerCurseurXY(127,45);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression4=5 then
       begin
            deplacerCurseurXY(127,45);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
       end
    else if Prog.Progression4>=6 then
       begin
            couleurTexte(13);
            deplacerCurseurXY(127,45);
            write(#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254#254);
            couleurTexte(15);
       end
    else
       begin
            deplacerCurseurXY(127,45);
            write(' ');
       end;

end;

// Affiche les différents navires disponible à l'achat ainsi que leur coût en argents/Ressources
procedure OptionsNavires;
begin
  //Options des Navires
//Cadre
  dessinerCadreXY(10,36,95,50,Simple,11,0);
  dessinerCadreXY(41,35,63,37,Simple,11,0);
  deplacerCurseurXY(46,36);
  CouleurTexte(11);
  write(#200,#205,' Options ',#205,#188);

//Contenu
  deplacerCurseurXY(14,38);
  CouleurTexte(5);
  write('Construire :');
  CouleurTexte(11);

  deplacerCurseurXY(60,38);
  CouleurTexte(5);
  write('Coût :');
  CouleurTexte(11);

  deplacerCurseurXY(17,39);
  write('1| Navire de colonisation');
  deplacerCurseurXY(63,39);
  write('32 Bois, 20 Outils, 16 Tissus');

  deplacerCurseurXY(17,40);
  write('2| Navire d',Chr (39),'exploration');
  deplacerCurseurXY(63,40);
  write('40 Bois, 20 Outils, 8 Tissus');

  deplacerCurseurXY(17,41);
  write('3| Navire de transport');
  deplacerCurseurXY(63,41);
  write('24 Bois, 16 Tissus');

  deplacerCurseurXY(14,43);
  CouleurTexte(5);
  write('Amélioration :');
  CouleurTexte(11);

  deplacerCurseurXY(60,43);
  CouleurTexte(5);
  write('Avancée :');
  CouleurTexte(11);

  deplacerCurseurXY(17,44);
  write('4| Navire de colonisation');
  deplacerCurseurXY(63,44);
  write(ABateau[Colonisation,Mat]+ABateau[Colonisation,Voile]+ABateau[Colonisation,Coque],' / 9');

  deplacerCurseurXY(17,45);
  write('5| Navire d',Chr (39),'exploration');
  deplacerCurseurXY(63,45);
  write(ABateau[Exploration,Mat]+ABateau[Exploration,Voile]+ABateau[Exploration,Coque],' / 9');

  deplacerCurseurXY(17,46);
  write('6| Navire de transport');
  deplacerCurseurXY(63,46);
  write(ABateau[Transport,Mat]+ABateau[Transport,Voile]+ABateau[Transport,Coque],' / 9');

  deplacerCurseurXY(17,48);
  write('0| Ne rien construire');


end;

procedure ShowMenuNavires; // Affiche le menu d'achat des navires
var
  choix:integer;
begin
  repeat
        effacerEcran;
        CadreNavires;
        dessinBateau;
        InformationGlobale;
        Navires;
        OptionsNavires;



        if (getEtatExploration1 = true) OR (getEtatExploration2 = true) OR (getEtatExploration3 = true) OR (getEtatExploration4 = true) then
           begin
             if (getEtatExploration1 = true) then
                Exploration1();

             if (getEtatExploration2 = true) then
                Exploration2();

             if (getEtatExploration3 = true) then
                Exploration3();

             if (getEtatExploration4 = true) then
                Exploration4();
           end;


        deplacerCurseurXY(17,52);
        couleurTexte(15);
        write('Quel est votre choix ?');
        deplacerCurseurXY(41,52);
        write('                  ');
        deplacerCurseurXY(41,52);
        readln(choix);

          if (choix<0) or (choix>=7) then // Affiche un message d'erreur si le choix est invalide
             begin
               deplacerCurseurXY(17,57);
               couleurTexte(12);
               write('/!\');
               couleurTexte(15);
               write('Veuillez écrire un choix valide!');
             end;
          if choix=0 then
             begin
                  {Revenir au Menu Ile}
             end;
          if choix=1 then // Achat navire de colonisation
             begin
                  deplacerCurseurXY(17,57);
                  achat_nav_colonisation();
                  sleep(1000);

             end;
          if choix=2 then // Achat navire d'exploration
             begin
                  deplacerCurseurXY(17,57);
                  achat_nav_exploration();
                  sleep(1000);

             end;
          if choix=3 then // Achat navire de transport
             begin
                  deplacerCurseurXY(17,57);
                  achat_nav_transport();
                  sleep(1000);

             end;
          if choix=4 then
             begin
                  AmeliorationNavireColonisation();
             end;

          if choix=5 then
             begin
                  AmeliorationNavireExploration();
             end;

          if choix=6 then
             begin
                  AmeliorationNavireTransport();
             end;


  until (choix=0);
end;


end.


