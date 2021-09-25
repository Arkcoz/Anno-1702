unit Temps;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,GestionEcran;

type
  LesJours=(Lundi,Mardi,Mercredi,Jeudi,Vendredi,Samedi,Dimanche);
  LesMois=(Janvier,Fevrier,Mars,Avril,Mai,Juin,Juillet,Aout,Septembre,Octobre,Novembre,Decembre);


  DateGlobal = record            //Record pour la date
    Jours : LesJours;
    Num : Integer;
    Mois : LesMois ;
    Annee : Integer;
  end;

  NombreDeTour = record          //Record du nombre de tour passé
    Tour:integer;
  end;

var
  //Variable pour les records
  DG: DateGlobal;
  NT: NombreDeTour;


procedure initialisation_date();     //Initialisation de la date
function getJours() : LesJours;      //fonction qui retourne le jour actuel
procedure JourSuivant();             //Ajoute +1 au jour
function getNum() : Integer;         //fonction qui retourne le numéro du jour actuel
procedure NumSuivant();              //Ajoute +1 au numéro du jour
function getMois() : LesMois;        //fonction qui retourne le mois actuel
procedure MoisSuivant;               //Ajoute +1 au mois
function getAnnee() : Integer;       //fonction qui retourne l'année actuelle
procedure AnneeSuivante();           //Ajoute +1 à l'année
procedure DateSuivante();            //Ajoute +1 Jour à la date actuelle
procedure AfficherDate();            //Affiche la date
procedure initialisation_tour();     //Initialisation du nombre de tour
function getTour() : Integer;        //fonction qui retourne le nombre de tour effectué
procedure TourSuivant();             //Procedure qui ajoute +1 au nombre de Tour effectué

implementation
//initialisation du tour à 1
procedure initialisation_tour();
begin
     NT.Tour:=1;
end;

//Fonction qui retourne le nombre de Tour
function getTour() : Integer;
begin
     getTour := NT.Tour;
end;

//Ajoute +1 au nombre de Tour actuel
procedure TourSuivant();

begin
     NT.Tour:=Succ(getTour);
end;

//initialise la date au Lundi 1 Janvier 1702
procedure initialisation_date();
begin
      DG.Jours := Lundi;
      DG.Num:=1;
      DG.Mois:=Janvier;
      DG.Annee:=1702;
end;

//Fonction qui retourne le Jour  (Lundi,Mardi,Mercredi,...,Dimanche)
function getJours() : LesJours;

begin
     getJours := DG.Jours;
end;

//Fait passer le jour actuel au jour suivant
procedure JourSuivant();
var
  demain,aujourdhui:LesJours;

begin
     aujourdhui:=DG.Jours;
     if aujourdhui=Dimanche then            //Si le jour actuel est Dimanche
         demain := Lundi                    //Alors le jour suivant est Lundi
     else                                   //Sinon
         demain := Succ(aujourdhui);        //Faire +1 dans l'énumération "LesJours"

     DG.Jours := demain;
end;

//Fonction qui retourne le mois actuel
function getMois() : LesMois;

begin
     getMois := DG.Mois;
end;


//Fait passer le mois actuel au mois suivant
procedure MoisSuivant();
var
  demain,aujourdhui:LesMois;

begin
     aujourdhui:=DG.Mois;
     if aujourdhui=Decembre then
         begin
              demain := Janvier;
              AnneeSuivante;
         end
     else
         demain := Succ(aujourdhui);

     DG.Mois := demain;
end;

//Fonction qui retourne le numéro de jour actuel
function getNum() : Integer;
begin
     getNum := DG.Num;
end;

//Fait passer le numéro du jour actuel au numéro du jour suivant en fonction du mois
procedure NumSuivant();
var
  demain,aujourdhui:Integer;
  MoisAuj:LesMois ;

begin
     MoisAuj:= getMois;
     aujourdhui:=DG.Num;
     if (MoisAuj=Avril) OR (MoisAuj=Juin) OR (MoisAuj=Septembre) OR (MoisAuj=Novembre) then
        begin
             if aujourdhui=30 then
                begin
                     demain := 1;
                     MoisSuivant;
                end
             else
                demain := Succ(aujourdhui);
        end
     else if (MoisAuj=Fevrier) then
        begin
             if aujourdhui=29 then
                begin
                     demain:=1;
                     MoisSuivant;
                end
             else
                demain := Succ(aujourdhui);
        end
     else
        begin
             if aujourdhui=31 then
                begin
                     demain := 1;
                     MoisSuivant;
                end
             else
                demain := Succ(aujourdhui);

        end;
     DG.Num := demain;
end;

//Fonction qui retourne l'année actuel
function getAnnee() : Integer;
begin
     getAnnee := DG.Annee;
end;

//Fait passer l'année actuelle à l'année suivante
procedure AnneeSuivante();
var
  demain,aujourdhui:Integer;

begin
     aujourdhui:=DG.Annee;
     demain := Succ(aujourdhui);

     DG.Annee := demain;
end;

//Procedure donne la date suivante
procedure DateSuivante();
begin
     JourSuivant;
     NumSuivant;
end;

procedure AfficherDate();
begin
     dessinerCadreXY(158,3,185,5,Double,9,0);
     deplacerCurseurXY(160,4);
     couleurTexte(15);
     write(getJours,' ',getNum,' ',getMois,' ',getAnnee);
end;

end.

