unit AchatArmee;
{$codepage utf8}

interface

uses
  Classes, SysUtils, Ressource, GestionEcran,Population;

type
  Troupe = record                        //Record contenant le nombre de chaques troupes
          Conscrit : integer;
          Soldat : integer;
          Fusillier : integer;
end;


procedure achat_conscrit();              //Procédure pour acheter un Conscrit
procedure achat_soldat();                //Procédure pour acheter un Soldat
procedure achat_fusilier();              //Procédure pour acheter un Fusilier


implementation

procedure achat_conscrit();

var
   Argent:integer;
   Tissu:integer;
   diffArgent:integer;
   diffTissu:integer;

begin
   if (Inv.argent >= 300) AND (Inv.tissu >= 3) then          //Vérification que le nombre de ressource néssaire est possédé
     begin
          //Différence Argent
          Argent:=getArgent();
          setArgent(Argent);
          diffArgent := (getArgent()-300);
          Inv.Argent := diffArgent;

          //Différence Tissu
          Tissu:=getTissu();
          setTissu(Tissu);
          diffTissu := (getTissu()-3);
          Inv.Tissu := diffTissu;

          //Ajout d'une unité
          Pop.Conscrit:= (Pop.Conscrit+1);

          effacerecran;
          dessinerCadreXY(10,3,190,25,Simple,11,0);
          dessinerCadreXY(80,1,125,5,Simple,11,0);
          deplacerCurseurXY(99,3);
          CouleurTexte(10);
          write(' TROUPE ');
          deplacerCurseurXY(15,11);
          write('Achat réussi');
          deplacerCurseurXY(27,11);

     end
   else  //Le nombre de ressource néssaire n'est pas détenu par le joueur
       begin
         effacerecran;
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,5,Simple,11,0);
         deplacerCurseurXY(99,3);
         CouleurTexte(12);
         write(' TROUPE ');
         deplacerCurseurXY(15,12);
         write('Vous ne pouvez pas acheter cette unité');
         deplacerCurseurXY(57,12);
       end;



end;

procedure achat_soldat();

var
   Argent:integer;
   Tissu:integer;
   diffArgent:integer;
   diffTissu:integer;

begin
   if (Inv.argent >= 500) AND (Inv.tissu >= 10) then         //Vérification que le nombre de ressource néssaire est possédé
     begin
          //Différence Argent
          Argent:=getArgent();
          setArgent(Argent);
          diffArgent := (getArgent()-500);
          Inv.Argent := diffArgent;

          //Différence Tissu
          Tissu:=getTissu();
          setTissu(Tissu);
          diffTissu := (getTissu()-10);
          Inv.Tissu := diffTissu;

          //Ajout d'une unité
          Pop.Soldat:= (Pop.Soldat+1);

          effacerecran;
          dessinerCadreXY(10,3,190,25,Simple,11,0);
          dessinerCadreXY(80,1,125,5,Simple,11,0);
          deplacerCurseurXY(99,3);
          CouleurTexte(10);
          write(' TROUPE ');
          deplacerCurseurXY(15,11);
          write('Achat réussi');
          deplacerCurseurXY(27,11);

     end
   else   //Le nombre de ressource néssaire n'est pas détenu par le joueur
       begin
         effacerecran;
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,5,Simple,11,0);
         deplacerCurseurXY(99,3);
         CouleurTexte(12);
         write(' TROUPE ');
         deplacerCurseurXY(15,12);
         write('Vous ne pouvez pas acheter cette unité');
         deplacerCurseurXY(57,12);
       end;



end;

procedure achat_fusilier();

var
   Argent : Integer;
   Tissu  : Integer;
   Armes   : Integer;

   diffArgent : Integer;
   diffTissu  : Integer;
   diffArmes   : Integer;

begin
   if (Inv.argent >= 700) AND (Inv.tissu >= 10) AND (Inv.armes>=2) then      //Vérification que le nombre de ressource néssaire est possédé
     begin
          //Différence Armes
          Armes:=getArmes();
          setArmes(Armes);
          diffArmes := (getArmes()-2);
          Inv.armes := diffArmes;

          //Différence Argent
          Argent:=getArgent();
          setArgent(Argent);
          diffArgent := (getArgent()-700);
          Inv.Argent := diffArgent;

          //Différence Tissu
          Tissu:=getTissu();
          setTissu(Tissu);
          diffTissu := (getTissu()-10);
          Inv.Tissu := diffTissu;

          //Ajout d'une unité
          Pop.Fusilier:= (Pop.Fusilier+1);

          effacerecran;
          dessinerCadreXY(10,3,190,25,Simple,11,0);
          dessinerCadreXY(80,1,125,5,Simple,11,0);
          deplacerCurseurXY(99,3);
          CouleurTexte(10);
          write(' TROUPE ');
          deplacerCurseurXY(15,11);
          write('Achat réussi');
          deplacerCurseurXY(27,11);

     end
   else   //Le nombre de ressource néssaire n'est pas détenu par le joueur
       begin
         effacerecran;
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,5,Simple,11,0);
         deplacerCurseurXY(99,3);
         CouleurTexte(12);
         write(' TROUPE ');
         deplacerCurseurXY(15,12);
         write('Vous ne pouvez pas acheter cette unité');
         deplacerCurseurXY(57,12);
       end;



end;
end.

