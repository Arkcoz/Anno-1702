unit MenuIle;
{$codepage utf8}
interface

uses
  Classes, SysUtils,GestionEcran,MenuNouvellePartie,MenuConnexion,Ressource,Population;

procedure ShowMenuIle;
procedure Description;
procedure ListeHabitants;
procedure ListeRessources;
procedure ListeBatiments;
procedure InformationGlobale;
procedure CadreMenuIle;
procedure OptionsIle;

implementation
procedure Description;
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
  write(Perso.nom);

end;

procedure ListeHabitants;
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
  write(getColon);

  deplacerCurseurXY(17,29);
  write('Nombre de Citoyen(s) :');
  deplacerCurseurXY(60,29);
  write(getCitoyen);


end;

procedure ListeRessources;
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
  write(getPoisson);

  deplacerCurseurXY(112,14);
  write('Quantité de Bois             :');
  deplacerCurseurXY(161,14);
  write(getBois);

  deplacerCurseurXY(112,15);
  write('Quantité de d',Chr (39),'Outils         :');
  deplacerCurseurXY(161,15);
  write(getOutils);

  deplacerCurseurXY(112,16);
  write('Quantité de Laine            :');
  deplacerCurseurXY(161,16);
  write(getLaine);

  deplacerCurseurXY(112,17);
  write('Quantité de Tissu            :');
  deplacerCurseurXY(161,17);
  write(getTissu);
end;

procedure ListeBatiments;
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
  write(getmaisonColon);

  deplacerCurseurXY(112,29);
  write('Maisons de Citoyens          :');
  deplacerCurseurXY(161,29);
  write(getmaisonCitoyen);

  deplacerCurseurXY(112,33);
  write('Cabanes de bûcheron          :');
  deplacerCurseurXY(161,33);
  write(getCabanesDeBucheron);

  deplacerCurseurXY(112,34);
  write('Cabanes de pêcheur           :');
  deplacerCurseurXY(161,34);
  write(getCabanesDePecheur);

  deplacerCurseurXY(112,35);
  write('Bergeries                    :');
  deplacerCurseurXY(161,35);
  write(getBergeries);

  deplacerCurseurXY(112,36);
  write('Ateliers de tisserands       :');
  deplacerCurseurXY(161,36);
  write(getAtelierDeTisserands);
end;

procedure InformationGlobale;
begin
     //Données en haut à gauche (Nom du joueur et Or)
  deplacerCurseurXY(10,2);
  write('Nom du joueur  :  ',Perso.nom);
  deplacerCurseurXY(10,3);
  write('Or             :  ',getArgent);

end;

procedure CadreMenuIle;
begin
  //Cadre Générale
  dessinerCadreXY(0,0,198,58,Double,15,0);
  dessinerCadreXY(60,0,140,4,Double,15,0);
  deplacerCurseurXY(87,2);
  write('Bienvenue sur : Dayfell Cay');
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
  write('2  | Accéder au menu de gestion des bâtiments');

end;

procedure ShowMenuIle;
begin
  effacerEcran;
  CadreMenuIle;
  InformationGlobale;
  Description;
  ListeHabitants;
  ListeRessources;
  ListeBatiments;
  OptionsIle;
end;

end.


