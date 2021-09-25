unit GestionBatiments;

{$codepage utf8}
interface

uses
  Classes, SysUtils,GestionEcran,MenuNouvellePartie,Ressource,AchatBatiments;

procedure ShowMenuBatiments(i : iles);           //Programme Principal pour le menu de Gestion des Batiments en fonction de l'ile choisi
procedure Maisons;                               //Affiche le cadre des Maisons
procedure SocialMilitaire;                       //Affiche le cadre des Batiments Socials et Militaires
procedure Industries;                            //Affiche le cadre des Industries
procedure InformationGlobale;                    //Affiche le cadre des information global (Nom joueur + Argent)
procedure CadreBatiments(i : iles);              //Cadre Général
procedure OptionsIle;                            //Affiche le cadre des Options disponibles
procedure AchatReussi;                           //Cadre indiquant l'achat réussi
procedure choixGestionIle_RUSTINE;               //Affiche les choix en fonction des îles découvertes
procedure ListeBatiments(i : iles);              //Affiche les Batiments possédés par le Joueur

implementation

procedure ListeBatiments(i : iles); // Affiche la liste des batiments disponible à l'achat
begin
     //Liste des Bâtiments
//Cadre
  dessinerCadreXY(105,25,190,44,Simple,15,0);
  dessinerCadreXY(135,24,158,26,Simple,15,0);
  deplacerCurseurXY(140,25);
  write('Vos Bâtiments');

//Contenu
  couleurTexte(5);
  deplacerCurseurXY(108,27);
  write('Maisons :');
  couleurTexte(15);

  deplacerCurseurXY(112,28);
  write('Maisons de Colons            :');
  deplacerCurseurXY(161,28);
  write(getmaisonColon(i));

  deplacerCurseurXY(112,29);
  write('Maisons de Citoyens          :');
  deplacerCurseurXY(161,29);
  write(getmaisonCitoyen(i));

  couleurTexte(5);
  deplacerCurseurXY(108,31);
  write('Socials et Militaires :');
  couleurTexte(15);


  deplacerCurseurXY(112,32);
  write('Entrepots                    :');
  deplacerCurseurXY(161,32);
  write(getEntrepots(i));

  deplacerCurseurXY(112,33);
  write('Centres-villes               :');
  deplacerCurseurXY(161,33);
  write(getCentre_Villes(i));

  deplacerCurseurXY(112,34);
  write('Chapelles                    :');
  deplacerCurseurXY(161,34);
  write(getChapelle(i));

  couleurTexte(5);
  deplacerCurseurXY(108,36);
  write('Industries :');
  couleurTexte(15);

  deplacerCurseurXY(112,37);
  write('Cabanes de pêcheur           :');
  deplacerCurseurXY(161,37);
  write(getCabanesDePecheur(i));

  deplacerCurseurXY(112,38);
  write('Cabanes de bûcheron          :');
  deplacerCurseurXY(161,38);
  write(getCabanesDeBucheron(i));

  deplacerCurseurXY(112,39);
  write('Bergeries                    :');
  deplacerCurseurXY(161,39);
  write(getBergeries(i));

  deplacerCurseurXY(112,40);
  write('Ateliers de tisserands       :');
  deplacerCurseurXY(161,40);
  write(getAtelierDeTisserands(i));

  deplacerCurseurXY(112,41);
  write('Armureries                   :');
  deplacerCurseurXY(161,41);
  write(getArmureries(i));

  deplacerCurseurXY(112,42);
  write('Chantier naval               :');
  deplacerCurseurXY(161,42);
  write(getChantierNaval(i));
end;

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
  write('1 | Maisons de Colons');
  deplacerCurseurXY(50,13);
  write('2 Bois');

  deplacerCurseurXY(17,14);
  write('2 | Maisons de Citoyens');
  deplacerCurseurXY(50,14);
  write('1 Bois, 1 Outils, 1 Maison de Colons');

end;

procedure SocialMilitaire;
begin
  //Liste "Social et militaire"
//Cadre
  dessinerCadreXY(10,25,95,40,Simple,15,0);
  dessinerCadreXY(41,24,63,26,Simple,15,0);
  deplacerCurseurXY(43,25);
  write('Social et militaire');

//Contenu
  deplacerCurseurXY(17,28);
  write('3 | Entrepots');
  deplacerCurseurXY(50,28);
  write('200 or, 5 Bois, 3 Outils');

  deplacerCurseurXY(17,29);
  write('4 | Centres-villes');
  deplacerCurseurXY(50,29);
  write('200 or, 8 Bois, 4 Outils');

  deplacerCurseurXY(17,30);
  write('5 | Chapelles');
  deplacerCurseurXY(50,30);
  write('300 or, 6 Bois, 3 Outils');


end;

procedure Industries;
begin
     //Liste des Ressources
//Cadre
  dessinerCadreXY(105,10,190,20,Simple,15,0);
  dessinerCadreXY(135,9,158,11,Simple,15,0);
  deplacerCurseurXY(142,10);
  write('Industries');

//Contenu
  deplacerCurseurXY(112,13);
  write('6 | Cabanes de pêcheur');
  deplacerCurseurXY(161,13);
  write('100 or, 5 Bois, 3 Outils');

  deplacerCurseurXY(112,14);
  write('7 | Cabanes de bûcheron');
  deplacerCurseurXY(161,14);
  write('50 or, 3 Outils');

  deplacerCurseurXY(112,15);
  write('8 | Bergeries');
  deplacerCurseurXY(161,15);
  write('200 or, 4 Bois, 2 Outils');

  deplacerCurseurXY(112,16);
  write('9 | Ateliers de tisserands');
  deplacerCurseurXY(161,16);
  write('300 or, 3 Bois, 2 Outils');

  deplacerCurseurXY(112,17);
  write('10| Armureries');
  deplacerCurseurXY(161,17);
  write('500 or, 10 Bois, 5 Outils');

  deplacerCurseurXY(112,18);
  write('11| Chantier Naval');
  deplacerCurseurXY(161,18);
  write('1000 or, 50 Bois, 15 Outils');

end;

procedure InformationGlobale;
begin
     //Données en haut à gauche (Nom du joueur et Or)
  deplacerCurseurXY(10,2);
  write('Nom du joueur  :  ',Perso.nom);
  deplacerCurseurXY(10,3);
  write('Or             :  ',getArgent);

end;

procedure CadreBatiments(i : iles);
begin
  //Cadre Générale
  dessinerCadreXY(0,0,198,58,Double,15,0);
  dessinerCadreXY(60,0,140,4,Double,15,0);
  deplacerCurseurXY(82,2);
  write('Gestion des bâtiments de ');
  couleurTexte(5);
  write(i);
  couleurTexte(15);
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

procedure ShowMenuBatiments(i : iles); // Menu d'achat pour les batiments
var
  choix:integer;
begin
  repeat
        effacerEcran;
        CadreBatiments(i);
        ListeBatiments(i);
        InformationGlobale;
        Maisons;
        SocialMilitaire;
        Industries;
        OptionsIle;
        deplacerCurseurXY(17,52);
        couleurTexte(15);
        write('Quel est votre choix ?');
        deplacerCurseurXY(41,52);
        readln(choix);
        if (choix<0) OR (choix>12) then // Si choix invalide on affiche un message d'erreur
           begin
              deplacerCurseurXY(17,57);
              couleurTexte(12);
              write('/!\');
              couleurTexte(15);
              write('Veuillez écrire un choix valide!');
              readln;
           end
        else
            begin // Pour chaque choix valide on appelle la procédure d'achat qui est prédéfini au batiment acheté
              case (choix) of
                   0 : deplacerCurseurXY(17,57);
                   1 : begin
                            deplacerCurseurXY(17,57);
                            achat_maison_colon(i);
                            sleep(1000);
                       end;
                   2 : begin
                            deplacerCurseurXY(17,57);
                            achat_maison_citoyen(i);
                            sleep(1000);
                      end;
                   3 : begin
                            deplacerCurseurXY(17,57);
                            achat_entrepot(i);
                            sleep(1000);
                       end;

                   4 : begin
                           deplacerCurseurXY(17,57);
                           achat_centre_villes(i);
                           sleep(1000);
                       end;
                   5 : begin
                            deplacerCurseurXY(17,57);
                            achat_chapelle(i);
                            sleep(1000);
                      end;
                   6 : begin
                            deplacerCurseurXY(17,57);
                            cabane_de_pecheur(i);
                            sleep(1000);
                      end;
                    7 : begin
                            deplacerCurseurXY(17,57);
                            cabane_de_bucheron(i);
                            sleep(1000);
                       end;

                    8 : begin
                            deplacerCurseurXY(17,57);
                            achat_bergeries(i);
                            sleep(1000);
                       end;

                    9 : begin
                            deplacerCurseurXY(17,57);
                            atelier_de_tisserands(i);
                            sleep(1000);
                         end;

                    10 : begin
                            deplacerCurseurXY(17,57);
                            achat_armureries(i);
                            sleep(1000);
                         end;
                    11 : begin
                            deplacerCurseurXY(17,57);
                            achat_chantier_naval(i);
                            sleep(1000);
                         end;
              end;
            end;
  until (choix=0);
end;

procedure ChoixGestionIle;
var
  choix1 : Integer;

begin
   repeat
       effacerEcran;
       deplacerCurseurXY(50,10);
       write('Quelle île voulez vous gérer ?');

       if (getDecouverteIle1 = true) then
          begin
               deplacerCurseurXY(55,12);
               write('1| DayfellCay');
          end;
       if(getDecouverteIle2 = true) then
          begin
               deplacerCurseurXY(55,13);
               write('2| Soupex');
          end;
       if (getDecouverteIle3 = true) then
          begin
               deplacerCurseurXY(55,14);
               write('3| GreyTerminal');
          end;
       if (getDecouverteIle4 = true) then
          begin
               deplacerCurseurXY(55,15);
               write('4| WaterSeven');
          end;
       if (getDecouverteIle5 = true) then
          begin
               deplacerCurseurXY(55,16);
               write('5| Amazonia');
          end;
       if (getDecouverteIle6 = true) then
          begin
               deplacerCurseurXY(55,17);
               write('6| Luden');
          end;
       if (getDecouverteIle7 = true) then
          begin
               deplacerCurseurXY(55,18);
               write('7| Croomelt');
          end;
       if (getDecouverteIle8 = true) then
          begin
               deplacerCurseurXY(55,19);
               write('8| Skeld');
          end;
       if (getDecouverteIle9 = true) then
          begin
               deplacerCurseurXY(55,20);
               write('9| VolcanoIsland');
          end;


       deplacerCurseurXY(55,21);
       write('0| Retour en arrière');


       deplacerCurseurXY(81,10);
       readln(choix1);
       if choix1=1 then
          ShowMenuBatiments(DayfellCay)
       else if (choix1 = 2) AND (getDecouverteIle2 = true) then
          ShowMenuBatiments(Soupex)
       else if (choix1 = 3) AND (getDecouverteIle3 = true) then
          ShowMenuBatiments(GreyTerminal)
       else if (choix1 = 4) AND (getDecouverteIle4 = true) then
          ShowMenuBatiments(WaterSeven)
       else if (choix1 = 5) AND (getDecouverteIle5 = true) then
          ShowMenuBatiments(Amazonia)
       else if (choix1 = 6) AND (getDecouverteIle6 = true) then
          ShowMenuBatiments(Luden)
       else if (choix1 = 7) AND (getDecouverteIle7 = true) then
          ShowMenuBatiments(Croomelt)
       else if (choix1 = 8) AND (getDecouverteIle8 = true) then
          ShowMenuBatiments(Skeld)
       else if (choix1 = 9) AND (getDecouverteIle9 = true) then
          ShowMenuBatiments(VolcanoIsland)
       else if (choix1 = 0) then
          {Revenir en Arrière}
       else
          begin
              deplacerCurseurXY(50,23);
              couleurTexte(12);
              write('/!\');
              couleurTexte(15);
              write('Veuillez écrire un choix valide!');
              readln;
          end;
 until (choix1 =0);

end;

procedure choixGestionIle_RUSTINE;
var
  choix : integer;
begin
  repeat
       effacerEcran;
       deplacerCurseurXY(50,10);
       write('Quelle île voulez vous gérer ?');

       if (getDecouverteIle1 = true) then
          begin
               deplacerCurseurXY(55,12);
               write('1| DayfellCay');
          end;
       if(getDecouverteIle2 = true) then
          begin
               deplacerCurseurXY(55,13);
               write('2| Soupex');
          end;
       if (getDecouverteIle3 = true) then
          begin
               deplacerCurseurXY(55,14);
               write('3| GreyTerminal');
          end;
       if (getDecouverteIle4 = true) then
          begin
               deplacerCurseurXY(55,15);
               write('4| WaterSeven');
          end;
       if (getDecouverteIle5 = true) then
          begin
               deplacerCurseurXY(55,16);
               write('5| Amazonia');
          end;
       if (getDecouverteIle6 = true) then
          begin
               deplacerCurseurXY(55,17);
               write('6| Luden');
          end;
       if (getDecouverteIle7 = true) then
          begin
               deplacerCurseurXY(55,18);
               write('7| Croomelt');
          end;
       if (getDecouverteIle8 = true) then
          begin
               deplacerCurseurXY(55,19);
               write('8| Skeld');
          end;
       if (getDecouverteIle9 = true) then
          begin
               deplacerCurseurXY(55,20);
               write('9| VolcanoIsland');
          end;


       deplacerCurseurXY(55,21);
       write('0| Retour en arrière');;
       deplacerCurseurXY(81,10);
       readln(choix);

       //Choix pour savoir pour quelle île vous voulez gérer les batiments
       case choix of
       1 : begin
                if (getDecouverteIle1 = true) then
                   ShowMenuBatiments(DayfellCay);
           end;
       2 : begin
                if (getDecouverteIle2 = true) then
                   ShowMenuBatiments(Soupex);
           end;
       3 : begin
                if (getDecouverteIle3 = true) then
                   ShowMenuBatiments(GreyTerminal);
           end;
       4 : begin
                if (getDecouverteIle4 = true) then
                   ShowMenuBatiments(WaterSeven);
           end;
       5 : begin
                if (getDecouverteIle5 = true) then
                   ShowMenuBatiments(Amazonia);
           end;
       6 : begin
                if (getDecouverteIle6 = true) then
                   ShowMenuBatiments(Luden);
           end;
       7 : begin
                if (getDecouverteIle7 = true) then
                   ShowMenuBatiments(Croomelt);
           end;
       8 : begin
                if (getDecouverteIle8 = true) then
                   ShowMenuBatiments(Skeld);
           end;
       9 : begin
                if (getDecouverteIle9 = true) then
                   ShowMenuBatiments(VolcanoIsland);
           end;
       end;
       //Fin du choix


       if (choix = 0) then
          {Revenir en Arrière}
       else if ((choix<0) AND (choix>10)) then
          begin
              deplacerCurseurXY(50,23);
              couleurTexte(12);
              write('/!\');
              couleurTexte(15);
              write('Veuillez écrire un choix valide!');
              readln;
          end;

  until (choix = 0);
end;

end.


