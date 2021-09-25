unit IleSuivante;
{$codepage utf8}

interface


uses
  Classes, SysUtils,GestionEcran,Ressource;


procedure initialisationIle(var ileAct : iles);          //Initialise l'île de départ à "DayfellCay"
procedure ProchaineIle(var ileAct : iles);               //Découvre l'île d'après

implementation

procedure initialisationIle(var ileAct : iles);
begin
  ileAct := DayfellCay;
end;

procedure ileSucc(var ileAct : iles);
begin
  if ileAct = VolcanoIsland then
     ileAct := DayfellCay
  else
    ileAct := succ(ileAct);
end;

procedure ProchaineIle(var ileAct : iles);

begin
  if (getEtatEmbarcation = false) then
  begin
    if (PF.FinExploration1=true) then
       begin
           effacerEcran;
           dessinerCadreXY(10,3,190,25,Simple,11,0);
           dessinerCadreXY(80,1,125,3,Simple,11,0);
           deplacerCurseurXY(96,2);
           CouleurTexte(10);
           write(' EMBARCATION ');
           deplacerCurseurXY(15,11);
           write('Votre Bateau d',chr(39),'Exploration n°1 a embarqué !');
           CouleurTexte(15);

           {changer d'ile}

           //Remise à 0
           Prog.Progression1 := 0;
           E.BateauExploration1 := False;
           PF.FinExploration1 := False;
           setNavireExploration(getNavireExploration-1);

           //Mettre l'Etat Embarcation à true pour ce tour
           setEtatEmbarcation(true) ;

           ileSucc(ileAct);
           if getNbrIle=9 then
              {Ne rien faire}
           else
              setNbrIle(getNbrIle+1);

       end

    else if (PF.FinExploration2=true) then
       begin
           effacerEcran;
           dessinerCadreXY(10,3,190,25,Simple,11,0);
           dessinerCadreXY(80,1,125,3,Simple,11,0);
           deplacerCurseurXY(96,2);
           CouleurTexte(10);
           write(' EMBARCATION ');
           deplacerCurseurXY(15,11);
           write('Votre Bateau d',chr(39),'Exploration n°2 a embarqué !');
           CouleurTexte(15);

           {changer d'ile}

           //Remise à 0
           Prog.Progression2 := 0;
           E.BateauExploration2 := False;
           PF.FinExploration2 := False;
           setNavireExploration(getNavireExploration-1);

           //Mettre l'Etat Embarcation à true pour ce tour
           setEtatEmbarcation(true) ;

           ileSucc(ileAct);
           if getNbrIle=9 then
              {Ne rien faire}
           else
              setNbrIle(getNbrIle+1);
       end

    else if (PF.FinExploration3=true) then
       begin
           effacerEcran;
           dessinerCadreXY(10,3,190,25,Simple,11,0);
           dessinerCadreXY(80,1,125,3,Simple,11,0);
           deplacerCurseurXY(96,2);
           CouleurTexte(10);
           write(' EMBARCATION ');
           deplacerCurseurXY(15,11);
           write('Votre Bateau d',chr(39),'Exploration n°3 a embarqué !');
           CouleurTexte(15);

           {changer d'ile}

           //Remise à 0
           Prog.Progression3 := 0;
           E.BateauExploration3 := False;
           PF.FinExploration3 := False;
           setNavireExploration(getNavireExploration-1);

           //Mettre l'Etat Embarcation à true pour ce tour
           setEtatEmbarcation(true) ;

           ileSucc(ileAct);
           if getNbrIle=9 then
              {Ne rien faire}
           else
              setNbrIle(getNbrIle+1);
       end

    else if (PF.FinExploration4=true) then
       begin
           effacerEcran;
           dessinerCadreXY(10,3,190,25,Simple,11,0);
           dessinerCadreXY(80,1,125,3,Simple,11,0);
           deplacerCurseurXY(96,2);
           CouleurTexte(10);
           write(' EMBARCATION ');
           deplacerCurseurXY(15,11);
           write('Votre Bateau d',chr(39),'Exploration n°4 a embarqué !');
           CouleurTexte(15);

           {changer d'ile}

           //Remise à 0
           Prog.Progression4 := 0;
           E.BateauExploration4 := False;
           PF.FinExploration4 := False;
           setNavireExploration(getNavireExploration-1);

           //Mettre l'Etat Embarcation à true pour ce tour
           setEtatEmbarcation(true) ;

           ileSucc(ileAct);
           if getNbrIle=9 then
              {Ne rien faire}
           else
              setNbrIle(getNbrIle+1);
       end
    else
        begin
           effacerEcran;
           dessinerCadreXY(10,3,190,25,Simple,11,0);
           dessinerCadreXY(80,1,125,3,Simple,11,0);
           deplacerCurseurXY(96,2);
           CouleurTexte(12);
           write(' EMBARCATION ');
           deplacerCurseurXY(15,11);
           write('Vous n',chr(39),'avez pas de bateau disponible');
           CouleurTexte(15);
        end;
  end
  else
     begin
           effacerEcran;
           dessinerCadreXY(10,3,190,25,Simple,11,0);
           dessinerCadreXY(80,1,125,3,Simple,11,0);
           deplacerCurseurXY(96,2);
           CouleurTexte(12);
           write(' EMBARCATION ');
           deplacerCurseurXY(15,11);
           write('Vous avez déjà embarqué pendant ce tour');
           CouleurTexte(15);
     end;

  //Mettre la découverte des iles en fonction du nombre d'ile découverte
  case getNbrIle of
      1 : setDecouverteIle1(true);
      2 : setDecouverteIle2(true);
      3 : setDecouverteIle3(true);
      4 : setDecouverteIle4(true);
      5 : setDecouverteIle5(true);
      6 : setDecouverteIle6(true);
      7 : setDecouverteIle7(true);
      8 : setDecouverteIle8(true);
      9 : setDecouverteIle9(true);
  end;

  readln();
end;

end.

