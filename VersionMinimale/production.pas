unit Production;
{$codepage utf8}

interface

uses
  Classes, SysUtils,Ressource,GestionEcran;

type Gain = record
  GainPoisson:integer;
  GainBois:integer;
  GainLaine:integer;
  GainTissu:integer;
end;

var
  Gains : Gain;


procedure Prod_Pecheurs;
procedure Prod_Bucherons;
procedure Prod_Bergeries;
procedure Prod_Tisserands;
procedure Prod_Globale;
function getGainPoisson() : Integer;
procedure setGainPoisson(valeur : integer);
function getGainBois() : Integer;
procedure setGainBois(valeur : integer);
function getGainLaine() : Integer;
procedure setGainLaine(valeur : integer);
function getGainTissu() : Integer;
procedure setGainTissu(valeur : integer);

implementation

function getGainPoisson() : Integer;
begin
     getGainPoisson := Gains.GainPoisson;
end;

procedure setGainPoisson(valeur : integer);
begin
     Gains.GainPoisson := valeur;
end;

function getGainBois() : Integer;
begin
     getGainBois := Gains.GainBois;
end;

procedure setGainBois(valeur : integer);
begin
     Gains.GainBois := valeur;
end;
function getGainLaine() : Integer;
begin
     getGainLaine := Gains.GainLaine;
end;

procedure setGainLaine(valeur : integer);
begin
     Gains.GainLaine := valeur;
end;
function getGainTissu() : Integer;
begin
     getGainTissu := Gains.GainTissu;
end;

procedure setGainTissu(valeur : integer);
begin
     Gains.GainTissu := valeur;
end;

procedure Prod_Pecheurs;
var
  n : integer;

begin
  n:=random(100);
  if (n>=0) AND (n<25) then
     begin
       setPoisson(getPoisson+(0*getCabanesDePecheur));
       setGainPoisson(0*getCabanesDePecheur);
     end;
  if (n>=25) AND (n<75) then
     begin
       setPoisson(getPoisson+(1*getCabanesDePecheur));
       setGainPoisson(1*getCabanesDePecheur);
     end;
  if (n>=75) AND (n<=100)then
     begin
       setPoisson(getPoisson+(2*getCabanesDePecheur));
       setGainPoisson(2*getCabanesDePecheur);
     end;

end;

procedure Prod_Bucherons;
var
  n : integer;

begin
  n:=random(100);
  if (n>=0) AND (n<25) then
     begin
       setBois(getBois+(1*getCabanesDeBucheron));
       setGainBois(1*getCabanesDeBucheron);
     end;
  if (n>=25) AND (n<75) then
     begin
       setBois(getBois+(2*getCabanesDeBucheron));
       setGainBois(2*getCabanesDeBucheron);
     end;
  if (n>=75) AND (n<=100)then
     begin
       setBois(getBois+(3*getCabanesDeBucheron));
       setGainBois(3*getCabanesDeBucheron);
     end;

end;

procedure Prod_Bergeries;
var
  n : integer;

begin
  n:=random(100);
  if (n>=0) AND (n<25) then
     begin
       setLaine(getLaine+(0*getBergeries));
       setGainLaine(0*getBergeries);
     end;
  if (n>=25) AND (n<75) then
     begin
       setLaine(getLaine+(1*getBergeries));
       setGainLaine(1*getBergeries);
     end;
  if (n>=75) AND (n<=100)then
     begin
       setLaine(getLaine+(2*getBergeries));
       setGainLaine(2*getBergeries);
     end;

end;

procedure Prod_Tisserands;
var
  n : integer;

begin
  n:=random(100);
  if (n>=0) AND (n<25) then
     begin
       setTissu(getTissu+(0*getAtelierDeTisserands));
       setGainTissu(0*getAtelierDeTisserands);
     end;
  if (n>=25) AND (n<75) then
     begin
       setTissu(getTissu+(1*getAtelierDeTisserands));
       setGainTissu(1*getAtelierDeTisserands);
     end;
  if (n>=75) AND (n<=100)then
     begin
       setTissu(getTissu+(2*getAtelierDeTisserands));
       setGainTissu(2*getAtelierDeTisserands);
     end;

end;

procedure Prod_Globale;

begin
  Prod_Pecheurs;
  Prod_Bucherons;
  Prod_Bergeries;
  Prod_Tisserands;
end;

end.

