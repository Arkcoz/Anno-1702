unit AchatBatiments;

{$codepage utf8}
{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils, Ressource, GestionEcran,Population;

type
  maisons = record                                   //record du nombre de maisons possédé
          maison_colon : string;
          maison_citoyen : string;
end;

type
  social_militaire = record                          //record du nombre de batiment social et militaire possédé
                   entrepots : string;
                   centres_villes : string;
                   chapelle: string;
end;

var
   maison:maisons;
   socialetMili: social_militaire;

// Procédure correspondante à l'achat de batiments, chaque procédure fonctionne de la même manière. Il faut changer les valeurs/variables en fonction du batiment
procedure achat_maison_colon(i : iles);         //Procédure d'achat de maison de colon
procedure achat_maison_citoyen(i : iles);       //Procédure d'achat de maison de citoyen
procedure achat_entrepot(i : iles);             //Procédure d'achat d'entrepot
procedure achat_centre_villes(i : iles);        //Procédure d'achat de centre-ville
procedure achat_chapelle(i : iles);             //Procédure d'achat de chapelle
procedure cabane_de_bucheron(i : iles);         //Procédure d'achat de cabane de bucheron
procedure cabane_de_pecheur(i : iles);          //Procédure d'achat de cabane de pêcheur
procedure achat_bergeries(i : iles);            //Procédure d'achat de bergeries
procedure atelier_de_tisserands(i : iles);      //Procédure d'achat d'atelier de tisserands
procedure achat_armureries(i : iles);           //Procédure d'achat d'armureries
procedure achat_chantier_naval(i : iles);       //Procédure d'achat de chantier naval


implementation

procedure achat_maison_colon(i : iles);

var
   wood:integer; // Variable de type entière stockant la quantité de bois du joueur
   diff:integer; // Variable de type entière stockant la différence de bois

begin
   if (Inv.bois >= 2) then // On vérifie que le joueur possède assez de ressource pour construire le batiment
     begin
          wood:=getbois();
          setbois(wood);
          diff := (getbois()-2);
          Inv.bois:=diff; // On calcule la différence entre son inventaire et la ressource nécessaire pour passer la différence dans son inventaire
          ile[i,maison_colon]:= ((ile[i,maison_colon])+1);

          Pop.Colon:= (Pop.Colon+1); // On augmente le nombre de colon de 1

          // Message de succès
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
   else // Dans le cas ou le joueur n'a pas assez de ressource
       begin
         // Affichage du message d'erreur
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

procedure achat_maison_citoyen(i : iles);

var
   wood:integer;
   outils:integer;
   maisoncolons:integer;
   diffbois:integer;
   diffoutils:integer;
   diffmaisoncolon : Integer;

begin
   if (Inv.bois >= 1) AND (Inv.outils >= 1) AND (getmaisoncolon(i) >= 1) then     //Vérification que le nombre de ressource néssaire est possédé
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
                                                                                                                  //Ajout d'une unité
          // Différence maison colons
          maisoncolons:=getmaisonColon(i);
          setMaisonColon(maisoncolons, i);

          //Ajout d'une unité de maison de citoyen et prélévement d'une unité de maison de colon
          diffmaisoncolon := (getmaisonColon(i)-1);
          ile[i,maison_colon]:=((ile[i,maison_colon])-1);
          ile[i,maison_citoyen]:=((ile[i,maison_citoyen])+1);

          //Ajout d'une unité de citoyen et prélévement d'une unité colon
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

   else  //Le nombre de ressource néssaire n'est pas détenu par le joueur
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



procedure achat_entrepot(i : iles);          //Vérification que le nombre de ressource néssaire est possédé

var
   argent:integer;
   outils:integer;
   bois:integer;
   diffbois:integer;
   diffoutils:integer;
   diffargent:integer;
   Res : Ressources;
   Difficulte : Difficultes;

begin
   if (Inv.bois >= 5) AND (Inv.outils >= 3) AND (Inv.argent >= 200)  then
      begin
        // Différence bois
        bois:=getbois();
        setbois(bois);
        diffbois := (getbois()-5);
        Inv.bois:=diffbois;



        // Différence outils
        outils:=getoutils();
        setoutils(outils);
        diffoutils := (getoutils()-3);
        Inv.outils := diffoutils;

        // Différence or
        argent:=getargent();
        setargent(argent);
        diffargent := (getargent()-200);
        Inv.argent := diffargent;

        //Ajout d'une unité
        ile[i,entrepots]:=(ile[i,entrepots] +1);

        for Difficulte:= modFacile to modDifficile do
        begin
          for Res:= Rbois to Rarme do
              LimitR[Difficulte,Res] := LimitR[Difficulte,Res]+10;
        end;

        effacerecran;
        dessinerCadreXY(10,3,190,25,Simple,11,0);
        dessinerCadreXY(80,1,125,5,Simple,11,0);
        deplacerCurseurXY(99,3);
        CouleurTexte(10);
        write(' ENTREPOT ');
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
         write(' ENTREPOT ');
         deplacerCurseurXY(15,11);
         write('Vous ne pouvez pas acheter cette structure');
         deplacerCurseurXY(57,11);
       end;

end;

// --------------------------------

procedure achat_centre_villes(i : iles);             //Vérification que le nombre de ressource néssaire est possédé

var
   wood:integer;
   outils:integer;
   argent:integer;
   diffbois:integer;
   diffoutils:integer;
   diffargent:integer;

begin
   if (Inv.bois >= 8) AND (Inv.outils >= 4) AND (Inv.argent >= 200) then
     begin
       // Différence bois
       wood:=getbois();
       setbois(wood);
       diffbois := (getbois()-8);
       Inv.bois:=diffbois;

       // Différence outils
       outils:=getoutils();
       setoutils(outils);
       diffoutils := (getoutils()-4);
       Inv.outils:=diffoutils;

       // Différence argent
       argent:=getargent();
       setargent(argent);
       diffargent := (getargent()-200);
       Inv.argent := diffargent;

       //Ajout d'une unité
       ile[i,centres_villes]:= ((ile[i,centres_villes]) +1);

       effacerecran;
       dessinerCadreXY(10,3,190,25,Simple,11,0);
       dessinerCadreXY(80,1,125,5,Simple,11,0);
       deplacerCurseurXY(96,3);
       CouleurTexte(10);
       write(' CENTRE VILLE ');
       deplacerCurseurXY(15,11);
       write('Achat réussi');
       deplacerCurseurXY(27,11);
     end
   else  //Le nombre de ressource néssaire n'est pas détenu par le joueur
     begin
         effacerecran;
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,5,Simple,11,0);
         deplacerCurseurXY(96,3);
         CouleurTexte(12);
         write(' CENTRE VILLE ');
         deplacerCurseurXY(15,11);
         write('Vous ne pouvez pas acheter cette structure');
         deplacerCurseurXY(57,11);
     end;
end;

// -----------------------------
procedure achat_chapelle(i : iles);

var
   wood:integer;
   outils:integer;
   argent:integer;
   diffbois:integer;
   diffoutils:integer;
   diffargent:integer;

begin
   if (Inv.bois >= 6) AND (Inv.outils >= 3) AND (Inv.argent >= 300) then     //Vérification que le nombre de ressource néssaire est possédé
     begin
         // Différence bois
         wood:=getbois();
         setbois(wood);
         diffbois := (getbois()-6);
         Inv.bois:=diffbois;

         // Différence outils
         outils:=getoutils();
         setoutils(outils);
         diffoutils := (getoutils()-3);
         Inv.outils:=diffoutils;

         // Différence argent
         argent:=getargent();
         setargent(argent);
         diffargent := (getargent()-300);
         Inv.argent := diffargent;

         //Ajout d'une unité
         ile[i,chapelle]:=((ile[i,chapelle]) +1);

         effacerecran;
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,5,Simple,11,0);
         deplacerCurseurXY(99,3);
         CouleurTexte(10);
         write(' CHAPELLE ');
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
         write(' CHAPELLE ');
         deplacerCurseurXY(15,11);
         write('Vous ne pouvez pas acheter cette structure');
         deplacerCurseurXY(57,11);
     end;

end;


// ---------------------------
procedure cabane_de_bucheron(i : iles);

var
   outils:integer;
   argent:integer;
   diffoutils:integer;
   diffargent:integer;

begin
   if (Inv.outils >= 3) AND (Inv.argent >= 50) then      //Vérification que le nombre de ressource néssaire est possédé
     begin
       // Différence outils
       outils:=getoutils();
       setoutils(outils);
       diffoutils := (getoutils()-3);
       Inv.outils:=diffoutils;

       // Différence argent
       argent:=getargent();
       setargent(argent);
       diffargent := (getargent()-50);
       Inv.argent := diffargent;
       writeln('Cabane de bucheron acheté, il vous reste ',Inv.outils,' outils, ', Inv.argent,  ' de pièce d''or');

       //Ajout d'une unité
       ile[i,cabanes_de_bucheron]:= ((ile[i,cabanes_de_bucheron]) +1);

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

     else  //Le nombre de ressource néssaire n'est pas détenu par le joueur
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
procedure cabane_de_pecheur(i : iles);

var
   outils:integer;
   argent:integer;
   diffoutils:integer;
   diffargent:integer;
   wood:integer;
   diffbois:integer;

begin
   if (Inv.bois >= 5) AND (Inv.outils >= 3) AND (Inv.argent >= 100) then      //Vérification que le nombre de ressource néssaire est possédé
     begin

       // Différence outils
       outils:=getoutils();
       setoutils(outils);
       diffoutils := (getoutils()-3);
       Inv.outils:=diffoutils;

       // Différence argent
       argent:=getargent();
       setargent(argent);
       diffargent := (getargent()-100);
       Inv.argent := diffargent;

       // Différence bois
       wood:=getbois();
       setbois(wood);
       diffbois := (getbois()-5);
       Inv.bois:=diffbois;

       //Ajout d'une unité
       ile[i,cabanes_de_pecheur]:= ((ile[i,cabanes_de_pecheur]) + 1);

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

   else //Le nombre de ressource néssaire n'est pas détenu par le joueur
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
procedure achat_bergeries(i : iles);

var
   outils:integer;
   argent:integer;
   diffoutils:integer;
   diffargent:integer;
   wood:integer;
   diffbois:integer;

begin
   if (Inv.bois >= 4) AND (Inv.outils >= 2) AND (Inv.argent >= 200) then    //Vérification que le nombre de ressource néssaire est possédé
     begin
       // Différence outils
       outils:=getoutils();
       setoutils(outils);
       diffoutils := (getoutils()-2);
       Inv.outils:=diffoutils;

       // Différence argent
       argent:=getargent();
       setargent(argent);
       diffargent := (getargent()-200);
       Inv.argent := diffargent;

       // Différence bois
       wood:=getbois();
       setbois(wood);
       diffbois := (getbois()-4);
       Inv.bois:=diffbois;

       //Ajout d'une unité
       ile[i,bergeries]:= ile[i,bergeries]+1;

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

   else //Le nombre de ressource néssaire n'est pas détenu par le joueur
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
procedure atelier_de_tisserands(i : iles);

var
   outils:integer;
   argent:integer;
   diffoutils:integer;
   diffargent:integer;
   wood:integer;
   diffbois:integer;

begin
   if (Inv.bois >= 3) AND (Inv.outils >= 2) AND (Inv.argent >= 300) then     //Vérification que le nombre de ressource néssaire est possédé
   begin
     // Différence outils
     outils:=getoutils();
     setoutils(outils);
     diffoutils := (getoutils()-2);
     Inv.outils:=diffoutils;

     // Différence argent
     argent:=getargent();
     setargent(argent);
     diffargent := (getargent()-300);
     Inv.argent := diffargent;

     // Différence bois
     wood:=getbois();
     setbois(wood);
     diffbois := (getbois()-3);
     Inv.bois:=diffbois;

     //Ajout d'une unité
     ile[i,ateliers_de_tisserands]:= ((ile[i,ateliers_de_tisserands])+1);

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

   else  //Le nombre de ressource néssaire n'est pas détenu par le joueur
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

procedure achat_armureries(i : iles);
var
   outils:integer;
   argent:integer;
   diffoutils:integer;
   diffargent:integer;
   wood:integer;
   diffbois:integer;

begin
   if (Inv.bois >= 10) AND (Inv.outils >= 5) AND (Inv.argent >= 500) then     //Vérification que le nombre de ressource néssaire est possédé
   begin
     // Différence outils
     outils:=getoutils();
     setoutils(outils);
     diffoutils := (getoutils()-5);
     Inv.outils:=diffoutils;

     // Différence argent
     argent:=getargent();
     setargent(argent);
     diffargent := (getargent()-500);
     Inv.argent := diffargent;

     // Différence bois
     wood:=getbois();
     setbois(wood);
     diffbois := (getbois()-10);
     Inv.bois:=diffbois;

     //Ajout d'une unité
     ile[i,armureries]:= ((ile[i,armureries])+1);

     effacerecran;
     dessinerCadreXY(10,3,190,25,Simple,11,0);
     dessinerCadreXY(80,1,125,5,Simple,11,0);
     deplacerCurseurXY(99,3);
     CouleurTexte(10);
     write(' ARMURERIE ');
     deplacerCurseurXY(15,11);
     write('Achat réussi');
     deplacerCurseurXY(27,11);
   end

   else //Le nombre de ressource néssaire n'est pas détenu par le joueur
     begin
       effacerecran;
       dessinerCadreXY(10,3,190,25,Simple,11,0);
       dessinerCadreXY(80,1,125,5,Simple,11,0);
       deplacerCurseurXY(99,3);
       CouleurTexte(12);
       write(' ARMURERIE ');
       deplacerCurseurXY(15,11);
       write('Vous ne pouvez pas acheter cette structure');
       deplacerCurseurXY(57,11);
     end;

end;

// ---------------------------------
procedure achat_chantier_naval(i : iles);
var
   outils:integer;
   argent:integer;
   diffoutils:integer;
   diffargent:integer;
   wood:integer;
   diffbois:integer;

begin
   if ((ile[i,chantier_naval])<>1) then
       begin
           if (Inv.bois >= 50) AND (Inv.outils >= 15) AND (Inv.argent >= 1000) then        //Vérification que le nombre de ressource néssaire est possédé
               begin
                 // Différence outils
                 outils:=getoutils();
                 setoutils(outils);
                 diffoutils := (getoutils()-15);
                 Inv.outils:=diffoutils;

                 // Différence argent
                 argent:=getargent();
                 setargent(argent);
                 diffargent := (getargent()-1000);
                 Inv.argent := diffargent;

                 // Différence bois
                 wood:=getbois();
                 setbois(wood);
                 diffbois := (getbois()-50);
                 Inv.bois:=diffbois;

                 ile[i,chantier_naval]:= ((ile[i,chantier_naval])+1);

                 effacerecran;
                 dessinerCadreXY(10,3,190,25,Simple,11,0);
                 dessinerCadreXY(80,1,125,5,Simple,11,0);
                 deplacerCurseurXY(94,3);
                 CouleurTexte(10);
                 write(' CHANTIER NAVAL ');
                 deplacerCurseurXY(15,11);
                 write('Achat réussi');
                 deplacerCurseurXY(27,11);
               end

           else  //Le nombre de ressource néssaire n'est pas détenu par le joueur
               begin
                 effacerecran;
                 dessinerCadreXY(10,3,190,25,Simple,11,0);
                 dessinerCadreXY(80,1,125,5,Simple,11,0);
                 deplacerCurseurXY(94,3);
                 CouleurTexte(12);
                 write(' CHANTIER NAVAL ');
                 deplacerCurseurXY(15,11);
                 write('Vous ne pouvez pas acheter cette structure');
                 deplacerCurseurXY(57,11);
               end;
       end
   else //Le nombre de chantier naval détenu maximum est déjà atteint
       begin
         effacerecran;
         dessinerCadreXY(10,3,190,25,Simple,11,0);
         dessinerCadreXY(80,1,125,5,Simple,11,0);
         deplacerCurseurXY(94,3);
         CouleurTexte(11);
         write(' CHANTIER NAVAL ');
         deplacerCurseurXY(15,11);
         write('Vous avez déjà cette structure !');
         deplacerCurseurXY(57,11);
       end;
end;
end.


