unit MenuIle;
{$codepage utf8}
interface

uses
  Classes, SysUtils,GestionEcran,MenuNouvellePartie,Ressource,Population,Difficulte;

procedure ShowMenuIle(i : iles);         //Programme principal qui affiche le menu de l'île
procedure Description(i : iles);
procedure ListeHabitants;
procedure ListeRessources;
procedure ListeBatiments(i : iles);
procedure InformationGlobale;
procedure CadreMenuIle(i : iles);
procedure OptionsIle;
procedure ShowMenuIleMulti(i : iles);

implementation
procedure Description(i : iles);
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
  write(i);

  deplacerCurseurXY(17,14);
  write('Propriétaire       :');
  deplacerCurseurXY(60,14);
  write(Perso.nom);

  deplacerCurseurXY(17,15);
  write('Nombre d',Chr (39),#140,'le       :');
  deplacerCurseurXY(60,15);
  write(getNbrIle);

  deplacerCurseurXY(17,16);
  write('Difficulté         :');
  deplacerCurseurXY(60,16);
  write(getNiveauActuelEcrit);
end;

procedure ListeHabitants;
begin
  //Liste des Habitants
//Cadre
  dessinerCadreXY(10,25,95,36,Simple,15,0);
  dessinerCadreXY(41,24,63,26,Simple,15,0);
  deplacerCurseurXY(47,25);
  write('Populations');

//Contenu
  deplacerCurseurXY(14,27);
  couleurTexte(5);
  write('Habitants');
  couleurTexte(15);

  deplacerCurseurXY(17,28);
  write('Nombre de Colon(s)    :');
  deplacerCurseurXY(60,28);
  write(getColon);

  deplacerCurseurXY(17,29);
  write('Nombre de Citoyen(s)  :');
  deplacerCurseurXY(60,29);
  write(getCitoyen);

  deplacerCurseurXY(14,31);
  couleurTexte(5);
  write('Troupes');
  couleurTexte(15);

  deplacerCurseurXY(17,32);
  write('Nombre de Conscrit(s) :');
  deplacerCurseurXY(60,32);
  write(getConscrit);

  deplacerCurseurXY(17,33);
  write('Nombre de Soldat(s)   :');
  deplacerCurseurXY(60,33);
  write(getSoldat);

  deplacerCurseurXY(17,34);
  write('Nombre de Fusilier(s) :');
  deplacerCurseurXY(60,34);
  write(getFusilier);


end;

procedure ListeRessources;
begin
     //Liste des Ressources
//Cadre
  dessinerCadreXY(105,10,190,20,Simple,15,0);
  dessinerCadreXY(135,9,158,11,Simple,15,0);
  deplacerCurseurXY(140,10);
  write('Vos Ressources');

//Contenu
  deplacerCurseurXY(112,13);
  write('Quantité de Poissons         :');
  deplacerCurseurXY(161,13);
  write(getPoisson,'/',LimitR[getNiveauActuel,Rpoisson]);

  deplacerCurseurXY(112,14);
  write('Quantité de Bois             :');
  deplacerCurseurXY(161,14);
  write(getBois,'/',LimitR[getNiveauActuel,Rbois]);

  deplacerCurseurXY(112,15);
  write('Quantité de d',Chr (39),'Outils         :');
  deplacerCurseurXY(161,15);
  write(getOutils,'/',LimitR[getNiveauActuel,Routil]);

  deplacerCurseurXY(112,16);
  write('Quantité de Laines           :');
  deplacerCurseurXY(161,16);
  write(getLaine,'/',LimitR[getNiveauActuel,Rlaine]);

  deplacerCurseurXY(112,17);
  write('Quantité de Tissus           :');
  deplacerCurseurXY(161,17);
  write(getTissu,'/',LimitR[getNiveauActuel,Rtissu]);

  deplacerCurseurXY(112,18);
  write('Quantité d',Chr(39),'Armes             :');
  deplacerCurseurXY(161,18);
  write(getArmes,'/',LimitR[getNiveauActuel,Rarme]);
end;

procedure ListeBatiments(i : iles);
begin
     //Liste des Batiments
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

procedure InformationGlobale;
begin
     //Données en haut à gauche (Nom du joueur et Or)
  deplacerCurseurXY(10,2);
  write('Nom du joueur  :  ',Perso.nom);
  deplacerCurseurXY(10,3);
  write('Or             :  ',getArgent);

end;

procedure CadreMenuIle(i : iles);
begin
  //Cadre Générale
  dessinerCadreXY(0,0,198,58,Double,15,0);
  dessinerCadreXY(60,0,140,4,Double,15,0);
  deplacerCurseurXY(87,2);
  write('Bienvenue sur : ');
  couleurTexte(5);
  write(i);
  couleurTexte(15);
end;

procedure OptionsIle;
begin
  //Options
//Cadre
  dessinerCadreXY(10,40,95,50,Simple,11,0);
  dessinerCadreXY(41,39,63,41,Simple,11,0);
  deplacerCurseurXY(46,40);
  CouleurTexte(11);
  write(#200,#205,' Options ',#205,#188);

//Contenu
  deplacerCurseurXY(17,43);
  write('1  | Tour suivant');
  deplacerCurseurXY(17,44);
  write('2  | Aller sur l',Chr (39),#140,'le suivante');
  deplacerCurseurXY(17,46);
  write('3  | Accéder au menu de gestion des bâtiments');
  deplacerCurseurXY(17,47);
  write('4  | Accéder au menu de gestion des navires');
  deplacerCurseurXY(17,48);
  write('5  | Accéder au menu de gestion des armées');

end;

//Procedure qui affiche le menu de gestion de l'île actuelle
procedure ShowMenuIle(i : iles);
begin
  effacerEcran;
  CadreMenuIle(i);
  InformationGlobale;
  Description(i);
  ListeHabitants;
  ListeRessources;
  ListeBatiments(i);
  OptionsIle;
end;

procedure OptionsIleMulti;
begin
  //Options
//Cadre
  dessinerCadreXY(10,40,95,50,Simple,11,0);
  dessinerCadreXY(41,39,63,41,Simple,11,0);
  deplacerCurseurXY(46,40);
  CouleurTexte(11);
  write(#200,#205,' Options ',#205,#188);

//Contenu
  deplacerCurseurXY(17,43);
  write('1  | Tour suivant');
  deplacerCurseurXY(17,44);
  write('2  | Aller sur l',Chr (39),#140,'le suivante');
  deplacerCurseurXY(17,45);
  write('3  | Accéder au menu de gestion des bâtiments');
  deplacerCurseurXY(17,46);
  write('4  | Accéder au menu de gestion des navires');
  deplacerCurseurXY(17,47);
  write('5  | Accéder au menu de gestion des armées');
  deplacerCurseurXY(17,48);
  write('6  | Rendre visite à l''ile adverse');

end;

//Procedure qui affiche le menu de gestion de l'île actuelle en multi
procedure ShowMenuIleMulti(i : iles);
begin
  effacerEcran;
  CadreMenuIle(i);
  InformationGlobale;
  Description(i);
  ListeHabitants;
  ListeRessources;
  ListeBatiments(i);
  OptionsIleMulti;
end;

end.


