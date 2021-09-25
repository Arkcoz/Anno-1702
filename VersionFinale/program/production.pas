unit Production;
{$codepage utf8}

interface

uses
  Classes, SysUtils,Ressource;

type Gain = record                       //Record des gains du Tour pour les afficher dans le Résumé de fin de partie
  GainPoisson : Integer;
  GainBois    : Integer;
  GainLaine   : Integer;
  GainTissu   : Integer;
  GainArme    : Integer;
end;

var
  Gains : Gain;


//Procédure qui calcul et ajoute la production de Poisson
procedure Prod_Pecheurs(i : iles);

//Procédure qui calcul et ajoute la production de Bois
procedure Prod_Bucherons(i : iles);

//Procédure qui calcul et ajoute la production de Laine
procedure Prod_Bergeries(i : iles);

//Procédure qui calcul et ajoute la production de Tissu
procedure Prod_Tisserands(i : iles);

//Procédure qui calcul et ajoute la production d'arme
procedure Prod_Armureries(i : iles);

//Remettre les gains à 0 après chaque fin de tour
procedure setGainA0;

//Procédure qui calcule et ajoute la production de chaques ressources grâce aux batiments de chaques iles
procedure Prod_Globale;

//Gain de Poisson
function getGainPoisson() : Integer;
procedure setGainPoisson(valeur : integer);

//Gain de Bois
function getGainBois() : Integer;
procedure setGainBois(valeur : integer);

//Gain de Laine
function getGainLaine() : Integer;
procedure setGainLaine(valeur : integer);

//Gain de Tissu
function getGainTissu() : Integer;
procedure setGainTissu(valeur : integer);

//Gain d'Arme
function getGainArme() : Integer;
procedure setGainArme(valeur : integer);

implementation

{//////////////GAIN//////////////}

//Gain du Poisson
function getGainPoisson() : Integer;
begin
     getGainPoisson := Gains.GainPoisson;
end;

procedure setGainPoisson(valeur : integer);
begin
     Gains.GainPoisson := valeur;
end;

//Gain du Bois
function getGainBois() : Integer;
begin
     getGainBois := Gains.GainBois;
end;

procedure setGainBois(valeur : integer);
begin
     Gains.GainBois := valeur;
end;

//Gain de la Laine
function getGainLaine() : Integer;
begin
     getGainLaine := Gains.GainLaine;
end;

procedure setGainLaine(valeur : integer);
begin
     Gains.GainLaine := valeur;
end;

//Gain du Tissus
function getGainTissu() : Integer;
begin
     getGainTissu := Gains.GainTissu;
end;

procedure setGainTissu(valeur : integer);
begin
     Gains.GainTissu := valeur;
end;

//Gain d'Arme
function getGainArme() : Integer;
begin
     getGainArme := Gains.GainArme;
end;

procedure setGainArme(valeur : integer);
begin
     Gains.GainArme := valeur;
end;

{///////////////PRODUCTION//////////}

//Production des cabanes de pêcheurs
procedure Prod_Pecheurs(i : iles);
var
  n : integer;
  v : integer;

begin
  for v:=1 to getCabanesDePecheur(i) do
  begin
    n:=random(100);
    if (n>=0) AND (n<25) then
       begin
         setPoisson(getPoisson+0);
         setGainPoisson(getGainPoisson+0);
       end;
    if (n>=25) AND (n<75) then
       begin
         setPoisson(getPoisson+1);
         setGainPoisson(getGainPoisson+1);
       end;
    if (n>=75) AND (n<=100)then
       begin
         setPoisson(getPoisson+2);
         setGainPoisson(getGainPoisson+2);
       end;

  end;

    if (getPoisson > LimitR[getNiveauActuel,Rpoisson]) then // Si la limite est atteinte on dit que le nombre de ressource est égale à la valeur de la limite
       setPoisson(LimitR[getNiveauActuel,Rpoisson]);

end;

//Production des cabanes de Bucherons
procedure Prod_Bucherons(i : iles);
var
  n : integer;
  v : integer;

begin
  for v:=1 to getCabanesDeBucheron(i) do
  begin
    n:=random(100);
    if (n>=0) AND (n<25) then
       begin
         setBois(getBois+1);
         setGainBois(getGainBois+1);
       end;
    if (n>=25) AND (n<75) then
       begin
         setBois(getBois+2);
         setGainBois(getGainBois+2);
       end;
    if (n>=75) AND (n<=100)then
       begin
         setBois(getBois+3);
         setGainBois(getGainBois+3);
       end;

  end;

    if (getBois > LimitR[getNiveauActuel,RBois]) then  // Si la limite est atteinte on dit que le nombre de ressource est égale à la valeur de la limite
       setBois(LimitR[getNiveauActuel,RBois]);
end;

//Production des Bergeries
procedure Prod_Bergeries(i : iles);
var
  n : integer;
  v : integer;

begin
  for v:=1 to getBergeries(i) do
  begin
    n:=random(100);
    if (n>=0) AND (n<25) then
       begin
         setLaine(getLaine+0);
         setGainLaine(getGainLaine+0);
       end;
    if (n>=25) AND (n<75) then
       begin
         setLaine(getLaine+1);
         setGainLaine(getGainLaine+1);
       end;
    if (n>=75) AND (n<=100)then
       begin
         setLaine(getLaine+2);
         setGainLaine(getGainLaine+2);
       end;

  end;

    if (getLaine > LimitR[getNiveauActuel,Rlaine]) then // Si la limite est atteinte on dit que le nombre de ressource est égale à la valeur de la limite
       setLaine(LimitR[getNiveauActuel,Rlaine]);

end;

//Production des ateliers de tisserands
procedure Prod_Tisserands(i : iles);
var
  n : integer;
  v : integer;

begin
  for v:=1 to getAtelierDeTisserands(i) do
  begin
    n:=random(100);
    if (n>=0) AND (n<25) then
       begin
         setTissu(getTissu+0);
         setGainTissu(getGainTissu+0);
       end;
    if (n>=25) AND (n<75) then
       begin
         setTissu(getTissu+1);
         setGainTissu(getGainTissu+1);
       end;
    if (n>=75) AND (n<=100)then
       begin
         setTissu(getTissu+2);
         setGainTissu(getGainTissu+2);
       end;

  end;

    if (getTissu > LimitR[getNiveauActuel,Rtissu]) then // Si la limite est atteinte on dit que le nombre de ressource est égale à la valeur de la limite
       setTissu(LimitR[getNiveauActuel,Rtissu]);

end;

//Production des Armureries
procedure Prod_Armureries(i : iles);
var
  n : integer;
  v : integer;

begin
  for v:=1 to getArmureries(i) do
  begin
    n:=random(100);
    if (n>=0) AND (n<25) then
       begin
         setArmes(getArmes+0);
         setGainArme(getGainArme+0);
       end;
    if (n>=25) AND (n<75) then
       begin
         setArmes(getArmes+1);
         setGainArme(getGainArme+1);
       end;
    if (n>=75) AND (n<=100)then
       begin
         setArmes(getArmes+2);
         setGainArme(getGainArme+2);
       end;

  end;

    if (getOutils > LimitR[getNiveauActuel,Rarme]) then // Si la limite est atteinte on dit que le nombre de ressource est égale à la valeur de la limite
       setOutils(LimitR[getNiveauActuel,Rarme]);

end;

//Remise à 0 des Gains de chaques ressources
procedure setGainA0;
begin
  setGainPoisson(0);
  setGainBois(0);
  setGainLaine(0);
  setGainTissu(0);
  setGainArme(0);
end;

//Production Globale de chaques ressources
procedure Prod_Globale;
var
  ileItt : iles;

begin
  for ileItt := DayfellCay to VolcanoIsland do
  begin
       Prod_Pecheurs(ileItt);
       Prod_Bucherons(ileItt);
       Prod_Bergeries(ileItt);
       Prod_Tisserands(ileItt);
       Prod_Armureries(ileItt);

  end;
end;

end.

