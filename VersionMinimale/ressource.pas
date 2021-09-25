unit Ressource;
{$codepage utf8}

interface


uses
  Classes, SysUtils,Population;

type Inventairee = record
  bois : Integer;
  laine : Integer;
  argent : Integer;
  poisson : Integer;
  tissu : Integer;
  outils : Integer;
  maison_colon: Integer;
  maison_citoyen: Integer;
  entrepots: Integer;
  centres_villes:Integer;
  chapelle:Integer;
  cabanes_de_bucheron:Integer;
  cabanes_de_pecheur:Integer;
  bergeries:Integer;
  ateliers_de_tisserands:Integer;
end;

var
  Inv : Inventairee;

  function getArgent() : Integer;
  function getTissu() : Integer;
  function getBois() : Integer;
  function getPoisson() : Integer;
  function getLaine() : Integer;
  function getOutils() : Integer;
  procedure Inventaire_Player();
  procedure setArgent(valeur : integer);
  function getmaisonColon() : Integer;
  function getmaisonCitoyen() : Integer;
  function getEntrepots() : Integer;
  function getCentre_Villes() : Integer;
  function getChapelle() : Integer;
  function getCabanesDeBucheron() : Integer;
  function getCabanesDePecheur() : Integer;
  function getBergeries() : Integer;
  function getAtelierDeTisserands() : Integer;
  procedure setMaisonColon(valeur : integer);
  procedure setMaisonCitoyen(valeur : integer);
  procedure setEntrepots(valeur : integer);
  procedure setCentreVilles(valeur : integer);
  procedure setChapelle(valeur : integer);
  procedure setCabanesDeBucheron(valeur : integer);
  procedure setBergeries(valeur : integer);
  procedure setCabaneDePecheur(valeur : integer);
  procedure setAteliersDeTisserands(valeur : integer);
  procedure setBois(valeur : integer);
  procedure setPoisson(valeur : integer);
  procedure setLaine(valeur : integer);
  procedure setTissu(valeur : integer);
  procedure setOutils(valeur : integer);
  procedure SoustrairePoisson;
  procedure initialisation_player();

implementation

procedure initialisation_player();
begin
      Inv.argent := 50000;
      Inv.bois := 40;
      Inv.poisson := 40;
      Inv.laine := 0;
      Inv.tissu := 0;
      Inv.outils := 40;
      Inv.maison_colon := 0;
      Inv.maison_citoyen := 0;
      Inv.entrepots := 0;
      Inv.centres_villes := 0;
      Inv.chapelle := 0;
      Inv.cabanes_de_bucheron := 0;
      Inv.cabanes_de_pecheur := 0;
      Inv.bergeries := 0;
      Inv.ateliers_de_tisserands := 0;
end;

procedure Inventaire_Player();
begin
      Inv.argent := getArgent();
      Inv.bois := getBois();
      Inv.poisson := getPoisson();
      Inv.laine := getLaine();
      Inv.tissu := getTissu();
      Inv.outils := getOutils();

end;

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

// BATIMENT

function getmaisonColon() : Integer;
begin
     getmaisonColon := Inv.maison_colon;
end;

function getmaisonCitoyen() : Integer;
begin
     getmaisonCitoyen := Inv.maison_citoyen;
end;

function getEntrepots() : Integer;
begin
     getEntrepots := Inv.entrepots;
end;

function getCentre_Villes() : Integer;
begin
     getCentre_Villes := Inv.centres_villes;
end;

function getChapelle() : Integer;
begin
     getChapelle := Inv.chapelle;
end;

function getCabanesDeBucheron() : Integer;
begin
     getCabanesDeBucheron := Inv.cabanes_de_bucheron;
end;

function getCabanesDePecheur() : Integer;
begin
     getCabanesDePecheur := Inv.cabanes_de_pecheur;
end;

function getBergeries() : Integer;
begin
     getBergeries := Inv.bergeries;
end;

function getAtelierDeTisserands() : Integer;
begin
     getAtelierDeTisserands := Inv.ateliers_de_tisserands;
end;


// BATIMENTS

procedure setMaisonColon(valeur : integer);
begin
     inv.maison_colon := valeur;
end;

procedure setMaisonCitoyen(valeur : integer);
begin
     inv.maison_citoyen := valeur;
end;

procedure setEntrepots(valeur : integer);
begin
     inv.entrepots := valeur;
end;

procedure setCentreVilles(valeur : integer);
begin
     inv.centres_villes := valeur;
end;

procedure setChapelle(valeur : integer);
begin
     inv.chapelle := valeur;
end;

procedure setCabanesDeBucheron(valeur : integer);
begin
     inv.cabanes_de_bucheron := valeur;
end;


procedure setCabaneDePecheur(valeur : integer);
begin
     inv.cabanes_de_pecheur := valeur;
end;

procedure setBergeries(valeur : integer);
begin
     inv.bergeries := valeur;
end;

procedure setAteliersDeTisserands(valeur : integer);
begin
     inv.ateliers_de_tisserands := valeur;
end;

///
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

procedure SoustrairePoisson;
var
  Somme:Integer;

begin
     Somme:=getColon+(2*getCitoyen);
     if Somme>getPoisson then
        begin
             repeat
               if (getCitoyen<>0) then
                 setCitoyen(getCitoyen-1)
               else if (getColon<>0) then
                 setColon(getColon-1)
               else if (getColon=0) AND (getCitoyen=0) then
                 setPoisson(getPoisson-getPoisson);
               Somme:=getColon+(2*getCitoyen);
             until (Somme=getPoisson);
             setPoisson(getPoisson-Somme);
        end
     else
         setPoisson(getPoisson-Somme);

end;

end.



