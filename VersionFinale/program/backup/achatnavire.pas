unit achatNavire;
{$codepage utf8}

interface

uses
  Classes, SysUtils, Ressource, Gestionecran;

type Navire = record
  nav_colonisation : Integer;
  nav_exploration : Integer;
  nav_transport : Integer;
end;

var
  Nav, NavJ1, NavJ2 : Navire;

// Procédure correspondante à l'achat d'un navire, chaque procédure fonctionne de la même manière. Il faut changer les valeurs/variables en fonction du navire
procedure achat_nav_colonisation();
procedure achat_nav_exploration();
procedure achat_nav_transport();

implementation

procedure achat_nav_colonisation();
var
   diffbois   : Integer; // Variable de type entière stockant la différence en bois
   difftissus : Integer; // Variable de type entière stockant la différence en tissu
   diffoutils : Integer; // Variable de type entière stockant la différence en outils

begin
      if (Inv.bois >= 32) AND (Inv.outils >= 20) AND (Inv.tissu >= 16) then  // On vérifie que l'utilisateur possède les ressources nécessaire à l'achat du navire
          begin
               // Différence bois
               diffbois := (getBois()-20);
               setBois(diffbois);

               // Différence outils
               diffoutils := (getOutils()-20);
               setOutils(diffoutils);

               // Différence tissus
               difftissus := (getTissu()-16);
               setTissu(difftissus);

               SetNavireColonisation(getNavireColonisation()+1); // Ajout du navire dans son inventaire

               // Message de validation
               effacerecran;
               dessinerCadreXY(10,3,190,25,Simple,11,0);
               dessinerCadreXY(80,1,125,4,Simple,11,0);
               deplacerCurseurXY(99,2);
               CouleurTexte(10);
               write(' NAVIRE ');
               deplacerCurseurXY(15,11);
               write('Achat réussi');
          end

      else
          begin
          // Affichage du message d'erreur
          effacerecran;
          dessinerCadreXY(10,3,190,25,Simple,11,0);
          dessinerCadreXY(80,1,125,4,Simple,11,0);
          deplacerCurseurXY(99,2);
          CouleurTexte(12);
          write(' NAVIRE ');
          deplacerCurseurXY(15,11);
          writeln('Vous ne pouvez pas acheter ce navire');
          end;

end;


procedure achat_nav_exploration();

var
   diffbois   : Integer;
   difftissus : Integer;
   diffoutils : Integer;

begin
      if (Inv.bois >= 40) AND (Inv.outils >= 20) AND (Inv.tissu >= 8) AND (getTotal(chantier_naval)<>0) AND (getNavireExploration<4) then
          begin
                // Différence bois
               diffbois := (getBois()-40);
               setBois(diffbois);

               // Différence outils
               diffoutils := (getOutils()-20);
               setOutils(diffoutils);

               // Différence tissus
               difftissus := (getTissu()-8);
               setTissu(difftissus);

               Inv.navire_exploration:= (Inv.navire_exploration +1);

               if (getEtatExploration1 = true) then
                   begin
                        if (getEtatExploration2 = true) then
                           begin
                                if (getEtatExploration3 = true) then
                                   begin
                                        if (getEtatExploration4 = true) then
                                           {Ne rien faire}
                                        else
                                           setEtatExploration4(true);
                                   end
                                else
                                    setEtatExploration3(true)
                           end
                        else
                            setEtatExploration2(true)
                   end
               else
                   setEtatExploration1(true);


               effacerecran;
               dessinerCadreXY(10,3,190,25,Simple,11,0);
               dessinerCadreXY(80,1,125,4,Simple,11,0);
               deplacerCurseurXY(99,2);
               CouleurTexte(10);
               write(' NAVIRE ');
               deplacerCurseurXY(15,11);
               write('Achat réussi');
          end

      else
          begin
          effacerecran;
          dessinerCadreXY(10,3,190,25,Simple,11,0);
          dessinerCadreXY(80,1,125,4,Simple,11,0);
          deplacerCurseurXY(99,2);
          CouleurTexte(12);
          write(' NAVIRE ');
          deplacerCurseurXY(15,11);
          write('Vous ne pouvez pas acheter ce navire');
          if (getTotal(chantier_naval)=0) then
              begin
                 deplacerCurseurXY(15,12);
                 write('Vous devez construire un Chantier Naval');
              end;
          if (getNavireExploration=4) then
              begin
                 deplacerCurseurXY(15,12);
                 write('Vous avez atteint votre maximum de Bateau d',chr(39),'Exploration actif simultanément!');
              end;
          end;

end;

procedure achat_nav_transport();

var
   diffbois   : Integer;
   difftissus : Integer;

begin
      if (Inv.bois >= 24) AND (Inv.tissu >= 16) then
          begin
                // Différence bois
               diffbois := (getBois()-24);
               setBois(diffbois);

               // Différence tissus
               difftissus := (getTissu()-16);
               setTissu(difftissus);

               SetNavireTransport(getNavireTransport()+1);

               effacerecran;
               dessinerCadreXY(10,3,190,25,Simple,11,0);
               dessinerCadreXY(80,1,125,4,Simple,11,0);
               deplacerCurseurXY(99,2);
               CouleurTexte(10);
               write(' NAVIRE ');
               deplacerCurseurXY(15,11);
               write('Achat réussi');
          end

      else
          begin
          effacerecran;
          dessinerCadreXY(10,3,190,25,Simple,11,0);
          dessinerCadreXY(80,1,125,4,Simple,11,0);
          deplacerCurseurXY(99,2);
          CouleurTexte(12);
          write(' NAVIRE ');
          deplacerCurseurXY(15,11);
          writeln('Vous ne pouvez pas acheter ce navire');
          end;

end;

end.

