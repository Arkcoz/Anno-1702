unit AchatBatiments;

{$codepage utf8}
{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils, Ressource, GestionEcran,Population;

type
  maisons = record
  maison_colon : string;
  maison_citoyen : string;
end;

type
  social_militaire = record
  entrepots : string;
  centres_villes : string;
  chapelle: string;
end;

var
   maison:maisons;
   socialetMili: social_militaire;

procedure achat_maison_colon();
procedure achat_maison_citoyen();

procedure cabane_de_bucheron();
procedure cabane_de_pecheur();
procedure bergeries();
procedure atelier_de_tisserands();




implementation

procedure achat_maison_colon();

var
   rep:string;
   wood:integer;
   diff:integer;

begin
   if (Inv.bois >= 2) then
     begin
          wood:=getbois();
          setbois(wood);
          diff := (getbois()-2);
          Inv.bois:=diff;
          Inv.maison_colon:= (Inv.maison_colon+1);

          Pop.Colon:= (Pop.Colon+1);

          effacerecran;
          dessinerCadreXY(10,3,190,25,Simple,11,0);
          dessinerCadreXY(80,1,125,5,Simple,11,0);
          deplacerCurseurXY(99,3);
          CouleurTexte(10);
          write(' MAISON ');
          deplacerCurseurXY(15,11);
          write('Achat réussi');
          deplacerCurseurXY(27,11);

     end
   else
       begin
         effacerecran;
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,5,Simple,11,0);
         deplacerCurseurXY(99,3);
         CouleurTexte(11);
         write(' MAISON ');
         deplacerCurseurXY(15,12);
         write('Vous ne pouvez pas acheter cette structure');
         deplacerCurseurXY(57,11);
       end;



end;

//------------------------------------------

procedure achat_maison_citoyen();

var
   rep:string;
   wood:integer;
   outils:integer;
   maisoncolons:integer;
   diffbois:integer;
   diffoutils:integer;
   diffmaisoncolon:integer;

begin
   if (Inv.bois >= 1) AND (Inv.outils >= 1) AND (getmaisoncolon >= 1) then
     begin
          // Différence bois
          wood:=getbois();
          setbois(wood);
          diffbois := (getbois()-1);
          Inv.bois:=diffbois;

          // Différence outils
          outils:=getoutils();
          setoutils(outils);
          diffoutils := (getoutils()-1);
          Inv.outils:=diffoutils;

          // Différence maison colons
          maisoncolons:=getmaisonColon();
          setMaisonColon(maisoncolons);

          diffmaisoncolon := (getmaisonColon()-1);
          Inv.maison_colon:=(Inv.maison_colon-1);
          Inv.maison_citoyen:=(Inv.maison_citoyen+1);

          Pop.Colon := (Pop.Colon-1);
          Pop.Citoyen:=(Pop.Citoyen+1);

          effacerecran;
          dessinerCadreXY(10,3,190,25,Simple,11,0);
          dessinerCadreXY(80,1,125,5,Simple,11,0);
          deplacerCurseurXY(99,3);
          CouleurTexte(10);
          write(' MAISON ');
          deplacerCurseurXY(15,11);
          write('Achat réussi');
          deplacerCurseurXY(27,11);
     end

   else
       begin
         effacerecran;
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,5,Simple,11,0);
         deplacerCurseurXY(99,3);
         CouleurTexte(12);
         write(' MAISON ');
         deplacerCurseurXY(15,11);
         write('Vous ne pouvez pas acheter cette structure');
         deplacerCurseurXY(57,11);
       end;

end;

// ---------------------------
procedure cabane_de_bucheron();

var
   rep:string;
   outils:integer;
   argent:integer;
   diffoutils:integer;
   diffargent:integer;

begin
   if (Inv.outils >= 3) AND (Inv.argent >= 50) then
     begin
       // Différence outils
       outils:=getoutils();
       setoutils(outils);
       diffoutils := (getoutils()-3);
       Inv.outils:=diffoutils;

       // Différence maison colons
       argent:=getargent();
       setargent(argent);
       diffargent := (getargent()-50);
       Inv.argent := diffargent;
       writeln('Cabane de bucheron acheté, il vous reste ',Inv.outils,' outils, ', Inv.argent,  ' de pièce d''or');

       Inv.cabanes_de_bucheron:= (Inv.cabanes_de_bucheron +1);

       effacerecran;
       dessinerCadreXY(10,3,190,25,Simple,11,0);
       dessinerCadreXY(80,1,125,5,Simple,11,0);
       deplacerCurseurXY(99,3);
       CouleurTexte(10);
       write(' CABANE ');
       deplacerCurseurXY(15,11);
       write('Achat réussi');
       deplacerCurseurXY(27,11);

     end

     else
       begin
           effacerecran;
           dessinerCadreXY(10,3,190,25,Simple,12,0);
           dessinerCadreXY(80,1,125,5,Simple,12,0);
           deplacerCurseurXY(99,3);
           CouleurTexte(11);
           write(' CABANE ');
           deplacerCurseurXY(15,11);
           write('Vous ne pouvez pas acheter cette structure');
           deplacerCurseurXY(57,11);
       end;
end;

// ---------------------------------
procedure cabane_de_pecheur();

var
   rep:string;
   outils:integer;
   argent:integer;
   diffoutils:integer;
   diffargent:integer;
   wood:integer;
   diffbois:integer;

begin
   if (Inv.bois >= 5) AND (Inv.outils >= 3) AND (Inv.argent >= 100) then
     begin

       // Différence outils
       outils:=getoutils();
       setoutils(outils);
       diffoutils := (getoutils()-3);
       Inv.outils:=diffoutils;

       // Différence maison colons
       argent:=getargent();
       setargent(argent);
       diffargent := (getargent()-100);
       Inv.argent := diffargent;

       // Différence bois
       wood:=getbois();
       setbois(wood);
       diffbois := (getbois()-5);
       Inv.bois:=diffbois;

       Inv.cabanes_de_pecheur:= (Inv.cabanes_de_pecheur + 1);

       effacerecran;
       dessinerCadreXY(10,3,190,25,Simple,11,0);
       dessinerCadreXY(80,1,125,5,Simple,11,0);
       deplacerCurseurXY(99,3);
       CouleurTexte(10);
       write(' CABANE ');
       deplacerCurseurXY(15,11);
       write('Achat réussi');
       deplacerCurseurXY(27,11);

     end

   else
     begin
         effacerecran;
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,5,Simple,11,0);
         deplacerCurseurXY(99,3);
         CouleurTexte(12);
         write(' CABANE ');
         deplacerCurseurXY(15,11);
         write('Vous ne pouvez pas acheter cette structure');
         deplacerCurseurXY(57,11);
     end;
end;

// ---------------------------------
procedure bergeries();

var
   rep:string;
   outils:integer;
   argent:integer;
   diffoutils:integer;
   diffargent:integer;
   wood:integer;
   diffbois:integer;

begin
   if (Inv.bois >= 4) AND (Inv.outils >= 2) AND (Inv.argent >= 200) then
     begin
       // Différence outils
       outils:=getoutils();
       setoutils(outils);
       diffoutils := (getoutils()-2);
       Inv.outils:=diffoutils;

       // Différence maison colons
       argent:=getargent();
       setargent(argent);
       diffargent := (getargent()-200);
       Inv.argent := diffargent;

       // Différence bois
       wood:=getbois();
       setbois(wood);
       diffbois := (getbois()-4);
       Inv.bois:=diffbois;

       Inv.bergeries:= (Inv.bergeries+1);

       effacerecran;
       dessinerCadreXY(10,3,190,25,Simple,11,0);
       dessinerCadreXY(80,1,125,5,Simple,11,0);
       deplacerCurseurXY(99,3);
       CouleurTexte(10);
       write(' BERGERIE ');
       deplacerCurseurXY(15,11);
       write('Achat réussi');
       deplacerCurseurXY(27,11);
     end

   else
     begin
         effacerecran;
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,5,Simple,11,0);
         deplacerCurseurXY(99,3);
         CouleurTexte(12);
         write(' BERGERIE ');
         deplacerCurseurXY(15,11);
         write('Vous ne pouvez pas acheter cette structure');
         deplacerCurseurXY(57,11);
     end;
end;

// ---------------------------------
procedure atelier_de_tisserands();

var
   rep:string;
   outils:integer;
   argent:integer;
   diffoutils:integer;
   diffargent:integer;
   wood:integer;
   diffbois:integer;

begin
   if (Inv.bois >= 3) AND (Inv.outils >= 2) AND (Inv.argent >= 300) then
   begin
     // Différence outils
     outils:=getoutils();
     setoutils(outils);
     diffoutils := (getoutils()-2);
     Inv.outils:=diffoutils;

     // Différence maison colons
     argent:=getargent();
     setargent(argent);
     diffargent := (getargent()-300);
     Inv.argent := diffargent;

     // Différence bois
     wood:=getbois();
     setbois(wood);
     diffbois := (getbois()-3);
     Inv.bois:=diffbois;

     Inv.ateliers_de_tisserands:= (Inv.ateliers_de_tisserands+1);

     effacerecran;
     dessinerCadreXY(10,3,190,25,Simple,11,0);
     dessinerCadreXY(80,1,125,5,Simple,11,0);
     deplacerCurseurXY(99,3);
     CouleurTexte(10);
     write(' ATELIER ');
     deplacerCurseurXY(15,11);
     write('Achat réussi');
     deplacerCurseurXY(27,11);
   end

   else
     begin
       effacerecran;
       dessinerCadreXY(10,3,190,25,Simple,11,0);
       dessinerCadreXY(80,1,125,5,Simple,11,0);
       deplacerCurseurXY(99,3);
       CouleurTexte(12);
       write(' ATELIER ');
       deplacerCurseurXY(15,11);
       write('Vous ne pouvez pas acheter cette structure');
       deplacerCurseurXY(57,11);
     end;

end;
end.

