unit Ressource;
{$codepage utf8}

interface


uses
  Classes, SysUtils,Population;

type
  Difficultes = (modFacile,modNormal,modDifficile,modDecouverte);
  Ressources = (Rbois,Rlaine,Rargent,Rpoisson,Rtissu,Routil,Rarme);
  LimiteRessource = array [Difficultes,Ressources] of integer;

// Ensemble des variables qui composent l'inventaire du joueur
  Inventairee = record
  bois : Integer;
  laine : Integer;
  argent : Integer;
  poisson : Integer;
  tissu : Integer;
  outils : Integer;
  armes : Integer;
  navire_colonisation : integer;
  navire_exploration : integer;
  navire_transport : integer;
  NivActuel : Difficultes;
end;


  Progression = record
    Progression1 : Integer;
    Progression2 : Integer;
    Progression3 : Integer;
    Progression4 : Integer;

  end;

  Progression_Fini = record
    FinExploration1 : boolean;
    FinExploration2 : boolean;
    FinExploration3 : boolean;
    FinExploration4 : boolean;
  end;

  Etat = record
    BateauExploration1 : boolean ;
    BateauExploration2 : boolean ;
    BateauExploration3 : boolean ;
    BateauExploration4 : boolean ;
    Embarcation        : boolean ;
  end;

  Decouverte = record
    Ile1 : Boolean;
    Ile2 : Boolean;
    Ile3 : Boolean;
    Ile4 : Boolean;
    Ile5 : Boolean;
    Ile6 : Boolean;
    Ile7 : Boolean;
    Ile8 : Boolean;
    Ile9 : Boolean;
    NbrIle : Integer;
  end;

  iles = (DayfellCay,Soupex,GreyTerminal,WaterSeven,Amazonia,Luden,Croomelt,Skeld,VolcanoIsland);
  batiments = (maison_colon, maison_citoyen, entrepots, centres_villes, chapelle, cabanes_de_bucheron,
              cabanes_de_pecheur, bergeries, ateliers_de_tisserands, armureries, chantier_naval);

  batimentIle = array [iles, batiments] of integer;

var
  Inv, InvJ1, InvJ2 : Inventairee;
  ile, ileJ1, ileJ2 : batimentIle;
  Prog : Progression;
  E : Etat;
  PF : Progression_Fini;
  Dec : Decouverte;
  LimitR : LimiteRessource;

// Fonction retournant le nombre de ressources/batiments/navires que le joueur possède
  function getArgent() : Integer;
  function getTissu() : Integer;
  function getBois() : Integer;
  function getPoisson() : Integer;
  function getLaine() : Integer;
  function getOutils() : Integer;
  function getArmes() : Integer;

  function getmaisonColon(i : iles) : Integer;
  function getmaisonCitoyen(i : iles) : Integer;
  function getEntrepots(i : iles) : Integer;
  function getCentre_Villes(i : iles) : Integer;
  function getChapelle(i : iles) : Integer;
  function getCabanesDeBucheron(i : iles) : Integer;
  function getCabanesDePecheur(i : iles) : Integer;
  function getBergeries(i : iles) : Integer;
  function getAtelierDeTisserands(i : iles) : Integer;
  function getArmureries(i : iles) : Integer;
  function getChantierNaval(i : iles) : Integer;

  function getTotal(b : batiments) : integer;
  function getNavireColonisation():Integer;
  function getNavireExploration():Integer;
  function getNavireTransport():Integer;

// Procedure permettant de définir le nombre de ressources/Batiments/navires que le joueur possède
  procedure setArgent(valeur : integer);

  procedure setNavireColonisation(valeur : integer);
  procedure setNavireExploration(valeur : integer);
  procedure setNavireTransport(valeur : integer);

  procedure setMaisonColon(valeur : integer; i : iles);
  procedure setMaisonCitoyen(valeur : integer; i : iles);
  procedure setEntrepots(valeur : integer; i : iles);
  procedure setCentreVilles(valeur : integer; i : iles);
  procedure setChapelle(valeur : integer; i : iles);
  procedure setCabanesDeBucheron(valeur : integer; i : iles);
  procedure setBergeries(valeur : integer; i : iles);
  procedure setCabaneDePecheur(valeur : integer; i : iles);
  procedure setAteliersDeTisserands(valeur : integer; i : iles);
  procedure setArmureries(valeur : integer; i : iles);
  procedure setChantierNaval(valeur : integer; i : iles);

  procedure setBois(valeur : integer);
  procedure setPoisson(valeur : integer);
  procedure setLaine(valeur : integer);
  procedure setTissu(valeur : integer);
  procedure setOutils(valeur : integer);
  procedure setArmes(valeur : integer);

  procedure SoustrairePoisson;

// Procédure qui initialise l'inventaire du joueur en fonction de la difficulté
  procedure Inventaire_Player();
  procedure initialisation_player_decouverte();
  procedure initialisation_player_easy();
  procedure initialisation_player_normal();
  procedure initialisation_player_hard();
  procedure initilisationLimite();

  //Partie Compteur du nombre d'embarcation
  function getEtatEmbarcation(): Boolean;
  procedure setEtatEmbarcation(valeur : Boolean);

  //Partie Bateau d'exploration
  function getEtatExploration1(): Boolean;
  function getEtatExploration2(): Boolean;
  function getEtatExploration3(): Boolean;
  function getEtatExploration4(): Boolean;

  procedure setEtatExploration1(valeur : boolean);
  procedure setEtatExploration2(valeur : boolean);
  procedure setEtatExploration3(valeur : boolean);
  procedure setEtatExploration4(valeur : boolean);

  //Etat de découverte des iles
  function getDecouverteIle1(): Boolean;
  function getDecouverteIle2(): Boolean;
  function getDecouverteIle3(): Boolean;
  function getDecouverteIle4(): Boolean;
  function getDecouverteIle5(): Boolean;
  function getDecouverteIle6(): Boolean;
  function getDecouverteIle7(): Boolean;
  function getDecouverteIle8(): Boolean;
  function getDecouverteIle9(): Boolean;

  procedure setDecouverteIle1(valeur : boolean);
  procedure setDecouverteIle2(valeur : boolean);
  procedure setDecouverteIle3(valeur : boolean);
  procedure setDecouverteIle4(valeur : boolean);
  procedure setDecouverteIle5(valeur : boolean);
  procedure setDecouverteIle6(valeur : boolean);
  procedure setDecouverteIle7(valeur : boolean);
  procedure setDecouverteIle8(valeur : boolean);
  procedure setDecouverteIle9(valeur : boolean);

  //Nombre d'Ile découverte
  function getNbrIle(): Integer;
  procedure setNbrIle(valeur : Integer);

  function getNiveauActuel() : Difficultes;


implementation

// Procédure qui va initialiser les limites du joueur en fonction de la difficulté choisie.
procedure initilisationLimite();
var
   Ressource : Ressources;
   Difficulte : Difficultes;

begin
   Difficulte:=modFacile;
   for Ressource:=Rbois to Rarme do
       LimitR[Difficulte,Ressource] := 50;

   Difficulte:=modNormal;
   for Ressource:=Rbois to Rarme do
       LimitR[Difficulte,Ressource] := 20;

   Difficulte:=modDifficile;
   for Ressource:=Rbois to Rarme do
       LimitR[Difficulte,Ressource] := 30;

   Difficulte:=modDecouverte;
   for Ressource:=Rbois to Rarme do
       LimitR[Difficulte,Ressource] := 10000000;

end;


// Procédure qui initialise les ressources du joueur lorsqu'il choisit le mode découverte
procedure initialisation_player_decouverte();
var
  ileItt : iles;
  batItt : batiments;

begin
      Inv.argent := 50000000;
      Inv.bois := 40000;
      Inv.poisson := 40000;
      Inv.laine := 40000;
      Inv.tissu := 40000;
      Inv.outils := 40000;
      Inv.navire_colonisation := 0;
      Inv.navire_exploration := 0;
      Inv.navire_transport := 0;

      for ileItt:= DayfellCay to VolcanoIsland do
      begin
          ile[ileItt,maison_colon] := 10000;
          ile[ileItt,maison_citoyen] := 10000;
          ile[ileItt,chantier_naval] :=1;
          for batItt := entrepots to armureries do
             begin
                  ile[ileItt,batItt] := 40000;
          end;
      end;

end;


// Procédure qui initialise les ressources du joueur lorsqu'il choisit le mode facile.
procedure initialisation_player_easy();
var
  ileItt : iles;
  batItt : batiments;
begin
      Inv.argent := 100000;
      Inv.bois := 40;
      Inv.poisson := 40;
      Inv.laine := 40;
      Inv.tissu := 40;
      Inv.outils := 40;
      Inv.navire_colonisation := 0;
      Inv.navire_exploration := 0;
      Inv.navire_transport := 0;

      for ileItt:= DayfellCay to VolcanoIsland do
      begin
          for batItt := maison_colon to chantier_naval do
             begin
                  ile[ileItt,batItt] := 0;
          end;
      end;

end;


// Procédure qui initialise les ressources du joueur lorsqu'il choisit le mode normal.
procedure initialisation_player_normal();
var
  ileItt : iles;
  batItt : batiments;
begin
      Inv.argent := 25000;
      Inv.bois := 20;
      Inv.poisson := 20;
      Inv.laine := 0;
      Inv.tissu := 0;
      Inv.outils := 20;
      Inv.navire_colonisation := 0;
      Inv.navire_exploration := 0;
      Inv.navire_transport := 0;

      for ileItt:= DayfellCay to VolcanoIsland do
      begin
          for batItt := maison_colon to chantier_naval do
             begin
                  ile[ileItt,batItt] := 0;
          end;
      end;
end;


// Procédure qui initialise les ressources du joueur lorsqu'il choisit le mode difficile.
procedure initialisation_player_hard();
var
  ileItt : iles;
  batItt : batiments;
begin
      Inv.argent := 10000;
      Inv.bois := 10;
      Inv.poisson := 10;
      Inv.laine := 0;
      Inv.tissu := 0;
      Inv.outils := 10;
      Inv.navire_colonisation := 0;
      Inv.navire_exploration := 0;
      Inv.navire_transport := 0;

      for ileItt:= DayfellCay to VolcanoIsland do
      begin
          for batItt := maison_colon to chantier_naval do
             begin
                  ile[ileItt,batItt] := 0;
          end;
      end;
end;
procedure Inventaire_Player();
begin
      Inv.argent := getArgent();
      Inv.bois := getBois();
      Inv.poisson := getPoisson();
      Inv.laine := getLaine();
      Inv.tissu := getTissu();
      Inv.outils := getOutils();
      Inv.Armes := getArmes();

end;



{RETOURNE LE NOMBRE RESSOURCE}

function getArgent() : Integer;
begin
     getArgent := Inv.argent;
end;

function getBois() : Integer;
begin
     getBois := Inv.bois;
end;

function getPoisson() : Integer;
begin
     getPoisson := Inv.poisson;
end;

function getLaine() : Integer;
begin
     getLaine := Inv.laine;
end;

function getTissu() : Integer;
begin
     getTissu := Inv.tissu;
end;

function getOutils() : Integer;
begin
     getOutils := Inv.outils;
end;

function getArmes() : Integer;
begin
     getArmes := Inv.armes;
end;



{RETOURNE LE NOMBRE DE BATIMENTS}

function getmaisonColon(i : iles) : Integer;
begin
     getmaisonColon := ile[i,maison_colon];
end;

function getmaisonCitoyen(i : iles) : Integer;
begin
     getmaisonCitoyen := ile[i,maison_citoyen];
end;

function getEntrepots(i : iles) : Integer;
begin
     getEntrepots := ile[i,entrepots];
end;

function getCentre_Villes(i : iles) : Integer;
begin
     getCentre_Villes := ile[i,centres_villes];
end;

function getChapelle(i : iles) : Integer;
begin
     getChapelle := ile[i,chapelle];
end;

function getCabanesDeBucheron(i : iles) : Integer;
begin
     getCabanesDeBucheron := ile[i,cabanes_de_bucheron];
end;

function getCabanesDePecheur(i : iles) : Integer;
begin
     getCabanesDePecheur := ile[i,cabanes_de_pecheur];
end;

function getBergeries(i : iles) : Integer;
begin
     getBergeries := ile[i,bergeries];
end;

function getAtelierDeTisserands(i : iles) : Integer;
begin
     getAtelierDeTisserands := ile[i,ateliers_de_tisserands];
end;

function getArmureries(i : iles) : Integer;
begin
     getArmureries := ile[i,armureries];
end;

function getChantierNaval(i : iles) : Integer;
begin
     getChantierNaval := ile[i,chantier_naval];
end;



{PERMET DE DEFINIR UN NOMBRE DE BATIMENTS}

procedure setMaisonColon(valeur : integer; i : iles);
begin
     ile[i,maison_colon] := valeur;
end;

procedure setMaisonCitoyen(valeur : integer; i : iles);
begin
     ile[i,maison_citoyen] := valeur;
end;

procedure setEntrepots(valeur : integer; i : iles);
begin
     ile[i,entrepots] := valeur;
end;

procedure setCentreVilles(valeur : integer; i : iles);
begin
     ile[i,centres_villes] := valeur;
end;

procedure setChapelle(valeur : integer; i : iles);
begin
     ile[i,chapelle] := valeur;
end;

procedure setCabanesDeBucheron(valeur : integer; i : iles);
begin
     ile[i,cabanes_de_bucheron] := valeur;
end;

procedure setCabaneDePecheur(valeur : integer; i : iles);
begin
     ile[i,cabanes_de_pecheur] := valeur;
end;

procedure setBergeries(valeur : integer; i : iles);
begin
     ile[i,bergeries] := valeur;
end;

procedure setAteliersDeTisserands(valeur : integer; i : iles);
begin
     ile[i,ateliers_de_tisserands] := valeur;
end;

procedure setArmureries(valeur : integer; i : iles);
begin
     ile[i,armureries] := valeur;
end;

procedure setChantierNaval(valeur : integer; i : iles);
begin
     ile[i,chantier_naval] := valeur;
end;



{PERMET DE DEFINIR UN NOMBRE DE RESSOURCE}

procedure setArgent(valeur : integer);
begin
     inv.argent := valeur;
end;


procedure setBois(valeur : integer);
begin
     inv.bois := valeur;
end;

procedure setPoisson(valeur : integer);
begin
     inv.poisson := valeur;
end;

procedure setLaine(valeur : integer);
begin
     inv.laine := valeur;
end;

procedure setTissu(valeur : integer);
begin
     inv.tissu := valeur;
end;

procedure setOutils(valeur : integer);
begin
     inv.outils := valeur;
end;

procedure setArmes(valeur : integer);
begin
     inv.armes := valeur;
end;



{RETOURNE LE NOMBRE DE NAVIRE}

function getNavireColonisation(): Integer;
begin
     getNavireColonisation := Inv.navire_colonisation;
end;

function getNavireTransport():Integer;
begin
     getNavireTransport := Inv.navire_transport;
end;

function getNavireExploration():Integer;
begin
     getNavireExploration := Inv.navire_exploration;
end;



{PERMET DE DEFINIR UN NOMBRE DE NAVIRE}

procedure setNavireColonisation(valeur : integer);
begin
     Inv.navire_colonisation := valeur;
end;

procedure setNavireExploration(valeur : integer);
begin
     Inv.navire_exploration := valeur;
end;

procedure setNavireTransport(valeur : integer);
begin
     Inv.navire_transport := valeur;
end;


{Partie Etat Embarcation}

//Fonction qui retourne l'Etat pour l'Etat d'embarquation (True = Embarquation effectué, False = Embarquation pas effectué
function getEtatEmbarcation(): Boolean;
begin
     getEtatEmbarcation := E.Embarcation;
end;

//Procedure qui met un Etat sur l'embarquation
procedure setEtatEmbarcation(valeur : boolean);
begin
     E.Embarcation := valeur;
end;



{Partie Etat des Bateaux (Acheté ou non)}

//Fonction qui retourne l'Etat pour l'achat du bateau d'exploration n°1
function getEtatExploration1() : boolean ;
begin
     getEtatExploration1 := E.BateauExploration1;
end;

//Fonction qui retourne l'Etat pour l'achat du bateau d'exploration n°2
function getEtatExploration2() : boolean ;
begin
     getEtatExploration2 := E.BateauExploration2;
end;

//Fonction qui retourne l'Etat pour l'achat du bateau d'exploration n°3
function getEtatExploration3() : boolean ;
begin
     getEtatExploration3 := E.BateauExploration3;
end;

//Fonction qui retourne l'Etat pour l'achat du bateau d'exploration n°4
function getEtatExploration4() : boolean ;
begin
     getEtatExploration4 := E.BateauExploration4;
end;

//Procedure qui met un Etat pour l'achat du bateau d'exploration n°1
procedure setEtatExploration1(valeur : boolean);
begin
     E.BateauExploration1 := valeur;
end;

//Procedure qui met un Etat pour l'achat du bateau d'exploration n°2
procedure setEtatExploration2(valeur : boolean);
begin
     E.BateauExploration2 := valeur;
end;

//Procedure qui met un Etat pour l'achat du bateau d'exploration n°3
procedure setEtatExploration3(valeur : boolean);
begin
     E.BateauExploration3 := valeur;
end;

//Procedure qui met un Etat pour l'achat du bateau d'exploration n°4
procedure setEtatExploration4(valeur : boolean);
begin
     E.BateauExploration4 := valeur;
end;



{Partie Etat de Découverte des Iles}

//Fonction qui retourne le Boolean de l'Etat sur la découverte de l'île n°1
function getDecouverteIle1(): Boolean;
begin
     getDecouverteIle1 := Dec.Ile1;
end;

//Fonction qui retourne le Boolean de l'Etat sur la découverte de l'île n°2
function getDecouverteIle2(): Boolean;
begin
     getDecouverteIle2 := Dec.Ile2;
end;

//Fonction qui retourne le Boolean de l'Etat sur la découverte de l'île n°3
function getDecouverteIle3(): Boolean;
begin
     getDecouverteIle3 := Dec.Ile3;
end;

//Fonction qui retourne le Boolean de l'Etat sur la découverte de l'île n°4
function getDecouverteIle4(): Boolean;
begin
     getDecouverteIle4 := Dec.Ile4;
end;

//Fonction qui retourne le Boolean de l'Etat sur la découverte de l'île n°5
function getDecouverteIle5(): Boolean;
begin
     getDecouverteIle5 := Dec.Ile5;
end;

//Fonction qui retourne le Boolean de l'Etat sur la découverte de l'île n°6
function getDecouverteIle6(): Boolean;
begin
     getDecouverteIle6 := Dec.Ile6;
end;

//Fonction qui retourne le Boolean de l'Etat sur la découverte de l'île n°7
function getDecouverteIle7(): Boolean;
begin
     getDecouverteIle7 := Dec.Ile7;
end;

//Fonction qui retourne le Boolean de l'Etat sur la découverte de l'île n°8
function getDecouverteIle8(): Boolean;
begin
     getDecouverteIle8 := Dec.Ile8;
end;

//Fonction qui retourne le Boolean de l'Etat sur la découverte de l'île n°9
function getDecouverteIle9(): Boolean;
begin
     getDecouverteIle9 := Dec.Ile9;
end;

//Procedure qui met un Etat sur la découverte de l'île n°1
procedure setDecouverteIle1(valeur : boolean);
begin
     Dec.Ile1 := valeur;
end;

//Procedure qui met un Etat sur la découverte de l'île n°2
procedure setDecouverteIle2(valeur : boolean);
begin
     Dec.Ile2 := valeur;
end;

//Procedure qui met un Etat sur la découverte de l'île n°3
procedure setDecouverteIle3(valeur : boolean);
begin
     Dec.Ile3 := valeur;
end;

//Procedure qui met un Etat sur la découverte de l'île n°4
procedure setDecouverteIle4(valeur : boolean);
begin
     Dec.Ile4 := valeur;
end;

//Procedure qui met un Etat sur la découverte de l'île n°5
procedure setDecouverteIle5(valeur : boolean);
begin
     Dec.Ile5 := valeur;
end;

//Procedure qui met un Etat sur la découverte de l'île n°6
procedure setDecouverteIle6(valeur : boolean);
begin
     Dec.Ile6 := valeur;
end;

//Procedure qui met un Etat sur la découverte de l'île n°7
procedure setDecouverteIle7(valeur : boolean);
begin
     Dec.Ile7 := valeur;
end;

//Procedure qui met un Etat sur la découverte de l'île n°8
procedure setDecouverteIle8(valeur : boolean);
begin
     Dec.Ile8 := valeur;
end;

//Procedure qui met un Etat sur la découverte de l'île n°9
procedure setDecouverteIle9(valeur : boolean);
begin
     Dec.Ile9 := valeur;
end;

//Fonction pour appeler le nombre d'île découverte
function getNbrIle(): Integer;
begin
     getNbrIle := Dec.NbrIle;
end;

//Procédure pour appeler le nombre d'île découverte
procedure setNbrIle(valeur : Integer);
begin
     Dec.NbrIle := valeur;
end;

//Fonction pour appeler le niveau de difficulté choisi
function getNiveauActuel() : Difficultes;
begin
     getNiveauActuel := Inv.NivActuel;
end;


//Procedure qui va gérer les poissons mangés par la population
procedure SoustrairePoisson;
var
  Somme:Integer;

begin
     Somme:=getColon+(2*getCitoyen)+(2*getConscrit)+(2*getSoldat)+(2*getFusilier);   //Somme des poissons qui vont être mangé

     if Somme>getPoisson then                                                        //Si le nbr de poisson demandé est plus grande que le nbr de poisson possédé
        begin
             repeat
               if (getFusilier<>0) then                                              //Si on a des Fusiliers
                 setFusilier(getFusilier-1)                                          //Enlever un Fusilier
               else if (getSoldat<>0) then                                           //Si on a des Soldats
                 setSoldat(getSoldat-1)                                              //Enlever un Soldat
               else if (getConscrit<>0) then                                         //Si on a des Conscrits
                 setConscrit(getConscrit-1)                                          //Enlever un Conscrit
               else if (getCitoyen<>0) then                                          //Si on a des Citoyens
                 setCitoyen(getCitoyen-1)                                            //Enlever un Citoyen
               else if (getColon<>0) then                                            //Si on a des Colons
                 setColon(getColon-1)                                                //Enlever un Colon
               else if (getColon=0) AND (getCitoyen=0) AND (getConscrit=0) AND (getSoldat=0) AND (getFusilier=0) then    //Si on a plus de population
                 setPoisson(getPoisson-getPoisson);                                                                      //Alors mettre le nbr de poisson à 0
               Somme:=getColon+(2*getCitoyen)+(2*getConscrit)+(2*getSoldat)+(2*getFusilier);
             until (Somme=getPoisson);
             setPoisson(getPoisson-Somme);
        end
     else
         setPoisson(getPoisson-Somme);

end;


//Fonction qui retourne le nombre de batiments demandé sur l'ensemble des 9 îles
function getTotal(b : batiments) : integer;
var
  ileItt : iles;

begin
   getTotal := 0;
   for ileItt := DayfellCay to VolcanoIsland do
   begin
     getTotal := getTotal + ile[ileItt,b];
   end;
end;

end.



