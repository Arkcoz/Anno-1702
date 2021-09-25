unit MenusMulti;                                                                 //unité qui s'occupe d'afficher les menus du joueur adverse

{$codepage utf8}
interface

uses
  Classes, SysUtils,GestionEcran,MenuNouvellePartie,MenuConnexion,Ressource,Population, ProposerCommerce, commerceBackEnd;

procedure ShowMenuIleJ1(Partie, joueur : string);                                        //Affiche le menu de l'ile du joueur 1 (utilisé par le joueur 2)
procedure ShowMenuIleJ2(Partie, joueur : string);                                        //Affiche le menu de l'ile du joueur 2 (utilisé par le joueur 1)
function getTotalMulti(joueur : string; b : batiments) : integer;                //Renvoie le nombre total d'un type de batiment d'un joueur
procedure ResetEchangePropose;                                                   //Remet la variable qui correspond à la proposition d'un échange à FAUX (donc aucun échange encore proposé)

implementation
var
   echangePropose : boolean;

function getTotalMulti(joueur : string; b : batiments) : integer;                //Renvoie le nombre total d'un type de batiment d'un joueur
var
  ileItt : iles;
begin
   getTotalMulti := 0;
   for ileItt := DayfellCay to VolcanoIsland do
   begin
     case joueur of
     'J1' : getTotalMulti := getTotalMulti + ileJ1[ileItt,b];
     'J2' : getTotalMulti := getTotalMulti + ileJ2[ileItt,b];
     end;
   end;
end;

procedure ResetEchangePropose;                                                   //Remet la variable qui correspond à la proposition d'un échange à FAUX (donc aucun échange encore proposé)
begin
   echangePropose := FALSE;
end;

procedure DescriptionJ1;                                                         //Affiche les information générales du joueur 1
begin
  //Description de l'ile
//Cadre
  dessinerCadreXY(10,10,95,20,Simple,15,0);
  dessinerCadreXY(41,9,63,11,Simple,15,0);
  deplacerCurseurXY(47,10);
  write('Description');

//Contenu
  deplacerCurseurXY(17,13);
  write('Nom de l',Chr (39),#140,'le       :');
  deplacerCurseurXY(60,13);
  write('Dayfell Cay');

  deplacerCurseurXY(17,14);
  write('Propriétaire       :');
  deplacerCurseurXY(60,14);
  write(PersoJ1.nom);

end;

procedure ListeHabitantsJ1;                                                      //Affiche les information générales du joueur 1
begin
  //Liste des Habitants
//Cadre
  dessinerCadreXY(10,25,95,35,Simple,15,0);
  dessinerCadreXY(41,24,63,26,Simple,15,0);
  deplacerCurseurXY(43,25);
  write('Liste des Habitants');

//Contenu
  deplacerCurseurXY(17,28);
  write('Nombre de Colon(s)   :');
  deplacerCurseurXY(60,28);
  write(PopJ1.colon);

  deplacerCurseurXY(17,29);
  write('Nombre de Citoyen(s) :');
  deplacerCurseurXY(60,29);
  write(PopJ1.citoyen);


end;

procedure ListeRessourcesJ1;                                                     //Affiche les ressources du joueur 1
begin
     //Liste des Ressources
//Cadre
  dessinerCadreXY(105,10,190,20,Simple,15,0);
  dessinerCadreXY(135,9,158,11,Simple,15,0);
  deplacerCurseurXY(137,10);
  write('Liste des Ressources');

//Contenu
  deplacerCurseurXY(112,13);
  write('Quantité de Poissons         :');
  deplacerCurseurXY(161,13);
  write(InvJ1.poisson);

  deplacerCurseurXY(112,14);
  write('Quantité de Bois             :');
  deplacerCurseurXY(161,14);
  write(InvJ1.bois);

  deplacerCurseurXY(112,15);
  write('Quantité de d',Chr (39),'Outils         :');
  deplacerCurseurXY(161,15);
  write(InvJ1.outils);

  deplacerCurseurXY(112,16);
  write('Quantité de Laine            :');
  deplacerCurseurXY(161,16);
  write(InvJ1.laine);

  deplacerCurseurXY(112,17);
  write('Quantité de Tissu            :');
  deplacerCurseurXY(161,17);
  write(InvJ1.tissu);
end;

procedure ListeBatiments(joueur : string);                                       //affiche les batiments que possède un joueur donné
begin
     //Liste des Batiments
//Cadre
  dessinerCadreXY(105,25,190,40,Simple,15,0);
  dessinerCadreXY(135,24,158,26,Simple,15,0);
  deplacerCurseurXY(137,25);
  write('Liste des Batiments');

//Contenu
  deplacerCurseurXY(112,28);
  write('Maisons de Colons            :');
  deplacerCurseurXY(161,28);
  write(getTotalMulti(joueur, maison_colon));

  deplacerCurseurXY(112,29);
  write('Maisons de Citoyens          :');
  deplacerCurseurXY(161,29);
  write(getTotalMulti(joueur, maison_citoyen));

  deplacerCurseurXY(112,33);
  write('Cabanes de bûcheron          :');
  deplacerCurseurXY(161,33);
  write(getTotalMulti(joueur, cabanes_de_bucheron));

  deplacerCurseurXY(112,34);
  write('Cabanes de pêcheur           :');
  deplacerCurseurXY(161,34);
  write(getTotalMulti(joueur, cabanes_de_pecheur));

  deplacerCurseurXY(112,35);
  write('Bergeries                    :');
  deplacerCurseurXY(161,35);
  write(getTotalMulti(joueur, bergeries));

  deplacerCurseurXY(112,36);
  write('Ateliers de tisserands       :');
  deplacerCurseurXY(161,36);
  write(getTotalMulti(joueur, ateliers_de_tisserands));
end;

procedure InformationGlobaleJ1;                                                  //affiche le nom du joueur 1 (vu du joueur 2)
begin
     //Données en haut à gauche (Nom du joueur et Or)
  dessinerCadreXY(0,0,198,58,Double,15,0);
  dessinerCadreXY(60,0,140,4,Double,15,0);
  deplacerCurseurXY(87,2);
  write('Bienvenue sur : l''Ile de ', PersoJ1.nom);

end;


procedure ShowMenuIleJ1(Partie, joueur : string);                                        //Affiche les information de l'ile du J1 et les options disponible (échange)
const
  PROPOSER_UN_ECHANGE = 1;
  RETOUR = 0;
var
    choix : integer;
begin
  echangePropose := False;
    repeat
          effacerEcran;
          InformationGlobaleJ1;
          DescriptionJ1;
          ListeHabitantsJ1;
          ListeRessourcesJ1;
          ListeBatiments('J1');

          //Options
        //Cadre
          dessinerCadreXY(10,40,95,50,Simple,11,0);
          dessinerCadreXY(41,39,63,41,Simple,11,0);
          deplacerCurseurXY(46,40);
          CouleurTexte(11);
          write(#200,#205,' Options ',#205,#188);

        //Contenu
          deplacerCurseurXY(17,43);
          if (not echangePropose) then
             write('1  | Proposer un échange')
          else
             write('1  | Modifier sa proposition');

          deplacerCurseurXY(17,44);
          write('0  | Retour');

          deplacerCurseurXY(41,52);
          readln(choix);

    if (choix<>RETOUR) OR (choix<>PROPOSER_UN_ECHANGE) then
             begin
                deplacerCurseurXY(17,57);
                couleurTexte(12);
                write('/!\');
                couleurTexte(15);
                write('Veuillez écrire un choix valide!');
                readln;
             end;

    case choix of
    RETOUR : deplacerCurseurXY(17,57);
    PROPOSER_UN_ECHANGE : begin
                               menuProposerEchange(joueur);
                               if getRessourceDonnee<>0 then
                               begin
                                    envoiEchange(IP, Partie, Joueur);
                                    echangePropose := TRUE;
                               end;
                          end;
    end;

    until (choix=RETOUR);

  end;


procedure DescriptionJ2;                                                         //Affiche les information générales du joueur 2
begin
  //Description de l'ile
//Cadre
  dessinerCadreXY(10,10,95,20,Simple,15,0);
  dessinerCadreXY(41,9,63,11,Simple,15,0);
  deplacerCurseurXY(47,10);
  write('Description');

//Contenu
  deplacerCurseurXY(17,13);
  write('Nom de l',Chr (39),#140,'le       :');
  deplacerCurseurXY(60,13);
  write('Dayfell Cay');

  deplacerCurseurXY(17,14);
  write('Propriétaire       :');
  deplacerCurseurXY(60,14);
  write(PersoJ2.nom);

end;

procedure ListeHabitantsJ2;                                                      //Affiche les information sur la population du joueur 2
begin
  //Liste des Habitants
//Cadre
  dessinerCadreXY(10,25,95,35,Simple,15,0);
  dessinerCadreXY(41,24,63,26,Simple,15,0);
  deplacerCurseurXY(43,25);
  write('Liste des Habitants');

//Contenu
  deplacerCurseurXY(17,28);
  write('Nombre de Colon(s)   :');
  deplacerCurseurXY(60,28);
  write(PopJ2.colon);

  deplacerCurseurXY(17,29);
  write('Nombre de Citoyen(s) :');
  deplacerCurseurXY(60,29);
  write(PopJ2.citoyen);


end;

procedure ListeRessourcesJ2;                                                     //Affiche les ressources du joueur 2
begin
     //Liste des Ressources
//Cadre
  dessinerCadreXY(105,10,190,20,Simple,15,0);
  dessinerCadreXY(135,9,158,11,Simple,15,0);
  deplacerCurseurXY(137,10);
  write('Liste des Ressources');

//Contenu
  deplacerCurseurXY(112,13);
  write('Quantité de Poissons         :');
  deplacerCurseurXY(161,13);
  write(InvJ2.poisson);

  deplacerCurseurXY(112,14);
  write('Quantité de Bois             :');
  deplacerCurseurXY(161,14);
  write(InvJ2.bois);

  deplacerCurseurXY(112,15);
  write('Quantité de d',Chr (39),'Outils         :');
  deplacerCurseurXY(161,15);
  write(InvJ2.outils);

  deplacerCurseurXY(112,16);
  write('Quantité de Laine            :');
  deplacerCurseurXY(161,16);
  write(InvJ2.laine);

  deplacerCurseurXY(112,17);
  write('Quantité de Tissu            :');
  deplacerCurseurXY(161,17);
  write(InvJ2.tissu);
end;


procedure InformationGlobaleJ2;                                                  //affiche le nom du joueur 2 (vu du joueur 1)
begin
     //Données en haut à gauche (Nom du joueur et Or)
     dessinerCadreXY(0,0,198,58,Double,15,0);
     dessinerCadreXY(60,0,140,4,Double,15,0);
     deplacerCurseurXY(87,2);
     write('Bienvenue sur : l''Ile de ', PersoJ2.nom);

end;

procedure ShowMenuIleJ2(Partie, joueur : string);                                        //Affiche les information de l'ile du J2 et les options disponible (échange)
const
  PROPOSER_UN_ECHANGE = 1;
  RETOUR = 0;
var
    choix : integer;
    echangePropose : boolean;
begin
  echangePropose := False;
    repeat
          effacerEcran;
          InformationGlobaleJ2;                                                  //affiche le nom du joueur 2 (vu du joueur 1)
          DescriptionJ2;                                                         //Affiche les information générales du joueur 2
          ListeHabitantsJ2;                                                      //Affiche les information sur la population du joueur 2
          ListeRessourcesJ2;                                                     //Affiche les ressources du joueur 2
          ListeBatiments('J2');                                                  //affiche les batiments que possède du joueur 2

                                                                                 //Gere l'entrée des Options possible pour le joueur
        //Cadre
          dessinerCadreXY(10,40,95,50,Simple,11,0);
          dessinerCadreXY(41,39,63,41,Simple,11,0);
          deplacerCurseurXY(46,40);
          CouleurTexte(11);
          write(#200,#205,' Options ',#205,#188);

        //Contenu
          deplacerCurseurXY(17,43);
          if (not echangePropose) then
             write('1  | Proposer un échange')
          else
             write('1  | Modifier sa proposition');

          deplacerCurseurXY(17,44);
          write('0  | Retour');

          deplacerCurseurXY(41,52);
          readln(choix);

    if (choix<0) OR (choix>1) then
             begin
                deplacerCurseurXY(17,57);
                couleurTexte(12);
                write('/!\');
                couleurTexte(15);
                write('Veuillez écrire un choix valide!');
                readln;
             end;

    case choix of
    RETOUR : deplacerCurseurXY(17,57);
    PROPOSER_UN_ECHANGE : begin
                               menuProposerEchange(joueur);
                               if getRessourceDonnee<>0 then
                               begin
                                    envoiEchange(IP, Partie, Joueur);
                                    echangePropose := TRUE;
                               end;
                          end;
    end;

    until (choix=RETOUR);

  end;

end.
