unit Population;
{$codepage utf8}

interface

uses
  Classes, SysUtils;

type Populations = record             //record de la population (Troupe + Habitant)
  Colon : Integer;
  Citoyen : Integer;
  Conscrit : Integer;
  Soldat : Integer;
  Fusilier : Integer;
end;

var
  Pop, PopJ1, PopJ2 : Populations;

//Initialisation de la population
procedure initialisation_population();

//Colons
function getColon() : Integer;
procedure setColon(valeur : integer);

//Citoyens
function getCitoyen() : Integer;
procedure setCitoyen(valeur : integer);

//Conscrits
function getConscrit() : Integer;
procedure setConscrit(valeur : integer);

//Soldats
function getSoldat() : Integer;
procedure setSoldat(valeur : integer);

//Fusiliers
function getFusilier() : Integer;
procedure setFusilier(valeur : integer);


implementation
//Initialisation de la population à 0, peu importe la difficulté choisi
procedure initialisation_population();
begin
      Pop.Colon := 0;
      Pop.Citoyen := 0;
      Pop.Conscrit := 0;
      Pop.Soldat := 0;
      Pop.Fusilier :=0;
end;

//Colon
function getColon() : Integer;
begin
     getColon := Pop.Colon;
end;

procedure setColon(valeur : integer);
begin
     Pop.Colon := valeur;
end;


//Citoyen
function getCitoyen() : Integer;
begin
     getCitoyen := Pop.Citoyen;
end;

procedure setCitoyen(valeur : integer);
begin
     Pop.Citoyen := valeur;
end;


//Conscrit
function getConscrit() : Integer;
begin
     getConscrit := Pop.Conscrit;
end;

procedure setConscrit(valeur : integer);
begin
     Pop.Conscrit := valeur;
end;


//Soldat
function getSoldat() : Integer;
begin
     getSoldat := Pop.Soldat;
end;

procedure setSoldat(valeur : integer);
begin
     Pop.Soldat := valeur;
end;


//Fusillier
function getFusilier() : Integer;
begin
     getFusilier := Pop.Fusilier;
end;

procedure setFusilier(valeur : integer);
begin
     Pop.Fusilier := valeur;
end;
end.

