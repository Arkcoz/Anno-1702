unit Population;
{$codepage utf8}

interface

uses
  Classes, SysUtils;

type Populations = record
  Colon : Integer;
  Citoyen : Integer;
end;

var
  Pop : Populations;

procedure initialisation_population();
function getColon() : Integer;
function getCitoyen() : Integer;
procedure setColon(valeur : integer);
procedure setCitoyen(valeur : integer);


implementation

procedure initialisation_population();
begin
      Pop.Colon := 0;
      Pop.Citoyen := 0;
end;

function getColon() : Integer;
begin
     getColon := Pop.Colon;
end;

function getCitoyen() : Integer;
begin
     getCitoyen := Pop.Citoyen;
end;

procedure setColon(valeur : integer);
begin
     Pop.Colon := valeur;
end;

procedure setCitoyen(valeur : integer);
begin
     Pop.Citoyen := valeur;
end;

end.

