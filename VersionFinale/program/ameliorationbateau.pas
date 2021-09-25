unit AmeliorationBateau;
{$codepage utf8}
interface

uses
  Classes, SysUtils,GestionEcran,Ressource,CombatNaval;

type
  bateau = (Colonisation,Exploration,Transport);
  Amelioration = (Mat,Voile,Coque);

  AmeliorationBateaux = array [bateau, Amelioration] of integer;

 var
   ABateau : AmeliorationBateaux;

procedure AmeliorationNavireColonisation();                           //Menu des Amélioration pour les Navires de Colonisation
procedure AmeliorationNavireExploration();                            //Menu des Amélioration pour les Navires d'Exploration
procedure AmeliorationNavireTransport();                              //Menu des Amélioration pour les Navires de Transport

procedure achat_Amelioration(Bateau : bateau ; choix : integer);      //Achat d'Amélioration

procedure DessinBateau();                                             //Affichage du dessin de bateau
procedure Cadres_Ameliorations(Bateau : bateau);                      //Affichage des cadres d'améliorations

procedure EcrireAmeliorationBateauColonisation();                     //Ecriture pour savoir quel Navire on améliore
procedure EcrireAmeliorationBateauExploration();                      //Ecriture pour savoir quel Navire on améliore
procedure EcrireAmeliorationBateauTransport();                        //Ecriture pour savoir quel Navire on améliore

procedure CadreOptionAmelioration();                                  //Cadre Option disponible pour le Joueur
procedure initialisationAmeliorationBateaux();                        //Initialisation à 0 des améliorations des Navires

procedure refreshVieBateau();                                         //Recalcul de la vie des Navires d'Exploration en fonction de la vie de base et des améliorations effectués


Implementation

procedure AmeliorationNavireColonisation();
var
  choix :integer;
begin
  repeat
    effacerEcran;
    DessinBateau();
    Cadres_Ameliorations(Colonisation);
    EcrireAmeliorationBateauColonisation();
    CadreOptionAmelioration();
    deplacerCurseurXY(64,54);
    couleurTexte(15);
    write('Quel est votre choix ?');
    deplacerCurseurXY(87,54);
    readln(choix);
    case choix of
         1:achat_Amelioration(Colonisation,choix);
         2:achat_Amelioration(Colonisation,choix);
         3:achat_Amelioration(Colonisation,choix);
    end;
    if (choix<0)  OR (choix>3) then
        begin
          deplacerCurseurXY(17,55);
          couleurTexte(12);
          write('/!\');
          couleurTexte(15);
          write('Veuillez écrire un choix valide!');
        end
    else
        {Ne rien faire}
  until (choix=0);
end;

procedure AmeliorationNavireExploration();
var
  choix :integer;
begin
  repeat
    effacerEcran;
    DessinBateau();
    Cadres_Ameliorations(Exploration);
    EcrireAmeliorationBateauExploration();
    CadreOptionAmelioration();
    deplacerCurseurXY(64,54);
    couleurTexte(15);
    write('Quel est votre choix ?');
    deplacerCurseurXY(87,54);
    readln(choix);
    case choix of
         1:achat_Amelioration(Exploration,choix);
         2:achat_Amelioration(Exploration,choix);
         3:achat_Amelioration(Exploration,choix);
    end;
    if (choix<0)  OR (choix>3) then
        begin
          deplacerCurseurXY(17,55);
          couleurTexte(12);
          write('/!\');
          couleurTexte(15);
          write('Veuillez écrire un choix valide!');
        end
    else
        {Ne rien faire}
  until (choix=0);
end;

procedure AmeliorationNavireTransport();
var
  choix :integer;
begin
  repeat
    effacerEcran;
    DessinBateau();
    Cadres_Ameliorations(Transport);
    EcrireAmeliorationBateauTransport();
    CadreOptionAmelioration();
    deplacerCurseurXY(64,54);
    couleurTexte(15);
    write('Quel est votre choix ?');
    deplacerCurseurXY(87,54);
    readln(choix);
    case choix of
         1:achat_Amelioration(Transport,choix);
         2:achat_Amelioration(Transport,choix);
         3:achat_Amelioration(Transport,choix);
    end;
    if (choix<0)  OR (choix>3) then
        begin
          deplacerCurseurXY(17,55);
          couleurTexte(12);
          write('/!\');
          couleurTexte(15);
          write('Veuillez écrire un choix valide!');
        end
    else
        {Ne rien faire}
  until (choix=0);
end;



procedure achat_Amelioration(Bateau : bateau ; choix : integer);
var
  diffOutil, diffBois,diffArgent,diffTissu : Integer ;
  Outil,Bois,Argent,Tissu : Integer;

begin
    case choix of
         1 : begin
                case ABateau[Bateau, Mat] of
                  0 : begin
                          if (Inv.outils >= 10) AND (Inv.Bois >= 25) AND (Inv.Argent>=1000) then
                               begin
                                    //Différence Outils
                                    Outil:= getOutils();
                                    setOutils(Outil);
                                    diffOutil := (getOutils()-10);
                                    Inv.Outils := diffOutil;


                                    //Différence Bois
                                    Bois:=getBois();
                                    setBois(Bois);
                                    diffBois := (getBois()-25);
                                    Inv.Bois := diffBois;

                                    //Différence Argent
                                    Argent:=getArgent();
                                    setArgent(Argent);
                                    diffArgent := (getArgent()-1000);
                                    Inv.Argent := diffArgent;

                                    ABateau[Bateau,Mat] := ABateau[Bateau,Mat]+1;
                                    refreshVieBateau();

                                    effacerecran;
                                    dessinerCadreXY(10,3,190,25,Simple,11,0);
                                    dessinerCadreXY(80,1,125,5,Simple,11,0);
                                    deplacerCurseurXY(96,3);
                                    CouleurTexte(10);
                                    write(' AMÉLIORATION ');
                                    deplacerCurseurXY(15,11);
                                    write('Amélioration réussite');
                                    deplacerCurseurXY(37,11);


                               end
                             else
                                 begin
                                   effacerecran;
                                   dessinerCadreXY(10,3,190,25,Simple,11,0);
                                   dessinerCadreXY(80,1,125,5,Simple,11,0);
                                   deplacerCurseurXY(96,3);
                                   CouleurTexte(12);
                                   write(' AMÉLIORATION ');
                                   deplacerCurseurXY(15,12);
                                   write('Vous ne pouvez pas acheter cette amélioration');
                                   deplacerCurseurXY(61,12);
                                 end;
                      end;
                  1 : begin
                          if (Inv.outils >= 15) AND (Inv.Bois >= 40) AND (Inv.Argent>=2000) then
                               begin
                                    //Différence Outils
                                    Outil:= getOutils();
                                    setOutils(Outil);
                                    diffOutil := (getOutils()-15);
                                    Inv.Outils := diffOutil;


                                    //Différence Bois
                                    Bois:=getBois();
                                    setBois(Bois);
                                    diffBois := (getBois()-40);
                                    Inv.Bois := diffBois;

                                    //Différence Argent
                                    Argent:=getArgent();
                                    setArgent(Argent);
                                    diffArgent := (getArgent()-2000);
                                    Inv.Argent := diffArgent;

                                    ABateau[Bateau,Mat] := ABateau[Bateau,Mat]+1;
                                    refreshVieBateau();

                                    effacerecran;
                                    dessinerCadreXY(10,3,190,25,Simple,11,0);
                                    dessinerCadreXY(80,1,125,5,Simple,11,0);
                                    deplacerCurseurXY(96,3);
                                    CouleurTexte(10);
                                    write(' AMÉLIORATION ');
                                    deplacerCurseurXY(15,11);
                                    write('Amélioration réussite');
                                    deplacerCurseurXY(37,11);

                               end
                             else
                                 begin
                                   effacerecran;
                                   dessinerCadreXY(10,3,190,25,Simple,11,0);
                                   dessinerCadreXY(80,1,125,5,Simple,11,0);
                                   deplacerCurseurXY(96,3);
                                   CouleurTexte(12);
                                   write(' AMÉLIORATION ');
                                   deplacerCurseurXY(15,12);
                                   write('Vous ne pouvez pas acheter cette amélioration');
                                   deplacerCurseurXY(61,12);
                                 end;
                      end;
                  2 : begin
                          if (Inv.outils >= 20) AND (Inv.Bois >= 55) AND (Inv.Argent>=3000) then
                               begin
                                    //Différence Outils
                                    Outil:= getOutils();
                                    setOutils(Outil);
                                    diffOutil := (getOutils()-20);
                                    Inv.Outils := diffOutil;


                                    //Différence Bois
                                    Bois:=getBois();
                                    setBois(Bois);
                                    diffBois := (getBois()-55);
                                    Inv.Bois := diffBois;

                                    //Différence Argent
                                    Argent:=getArgent();
                                    setArgent(Argent);
                                    diffArgent := (getArgent()-3000);
                                    Inv.Argent := diffArgent;

                                    ABateau[Bateau,Mat] := ABateau[Bateau,Mat]+1;
                                    refreshVieBateau();

                                    effacerecran;
                                    dessinerCadreXY(10,3,190,25,Simple,11,0);
                                    dessinerCadreXY(80,1,125,5,Simple,11,0);
                                    deplacerCurseurXY(96,3);
                                    CouleurTexte(10);
                                    write(' AMÉLIORATION ');
                                    deplacerCurseurXY(15,11);
                                    write('Amélioration réussite');
                                    deplacerCurseurXY(37,11);

                               end
                             else
                                 begin
                                   effacerecran;
                                   dessinerCadreXY(10,3,190,25,Simple,11,0);
                                   dessinerCadreXY(80,1,125,5,Simple,11,0);
                                   deplacerCurseurXY(96,3);
                                   CouleurTexte(12);
                                   write(' AMÉLIORATION ');
                                   deplacerCurseurXY(15,12);
                                   write('Vous ne pouvez pas acheter cette amélioration');
                                   deplacerCurseurXY(61,12);
                                 end;

                      end;
                  3 : begin
                          effacerecran;
                          dessinerCadreXY(10,3,190,25,Simple,11,0);
                          dessinerCadreXY(80,1,125,5,Simple,11,0);
                          deplacerCurseurXY(96,3);
                          CouleurTexte(12);
                          write(' AMÉLIORATION ');
                          deplacerCurseurXY(15,12);
                          write('Vous avez le niveau maximum pour cette amélioration');
                          deplacerCurseurXY(69,12);
                  end;
                end;
             end;
         2 : begin
                case ABateau[Bateau, Voile] of
                  0 : begin
                          if (Inv.outils >= 15) AND (Inv.Tissu >= 50) AND (Inv.Argent>=1000) then
                               begin
                                    //Différence Outils
                                    Outil:= getOutils();
                                    setOutils(Outil);
                                    diffOutil := (getOutils()-15);
                                    Inv.Outils := diffOutil;


                                    //Différence Tissu
                                    Tissu:= getTissu();
                                    setTissu(Tissu);
                                    diffTissu := (getTissu()-50);
                                    Inv.Tissu := diffTissu;

                                    //Différence Argent
                                    Argent:=getArgent();
                                    setArgent(Argent);
                                    diffArgent := (getArgent()-1000);
                                    Inv.Argent := diffArgent;

                                    ABateau[Bateau,Voile] := ABateau[Bateau,Voile]+1;
                                    refreshVieBateau();

                                    effacerecran;
                                    dessinerCadreXY(10,3,190,25,Simple,11,0);
                                    dessinerCadreXY(80,1,125,5,Simple,11,0);
                                    deplacerCurseurXY(96,3);
                                    CouleurTexte(10);
                                    write(' AMÉLIORATION ');
                                    deplacerCurseurXY(15,11);
                                    write('Amélioration réussite');
                                    deplacerCurseurXY(37,11);

                               end
                             else
                                 begin
                                   effacerecran;
                                   dessinerCadreXY(10,3,190,25,Simple,11,0);
                                   dessinerCadreXY(80,1,125,5,Simple,11,0);
                                   deplacerCurseurXY(96,3);
                                   CouleurTexte(12);
                                   write(' AMÉLIORATION ');
                                   deplacerCurseurXY(15,12);
                                   write('Vous ne pouvez pas acheter cette amélioration');
                                   deplacerCurseurXY(61,12);
                                 end;
                      end;
                  1 : begin
                          if (Inv.outils >= 20) AND (Inv.Bois >= 60) AND (Inv.Argent>=2000) then
                               begin
                                    //Différence Outils
                                    Outil:= getOutils();
                                    setOutils(Outil);
                                    diffOutil := (getOutils()-20);
                                    Inv.Outils := diffOutil;


                                    //Différence Bois
                                    Bois:=getBois();
                                    setBois(Bois);
                                    diffBois := (getBois()-60);
                                    Inv.Bois := diffBois;

                                    //Différence Argent
                                    Argent:=getArgent();
                                    setArgent(Argent);
                                    diffArgent := (getArgent()-2000);
                                    Inv.Argent := diffArgent;

                                    ABateau[Bateau,Voile] := ABateau[Bateau,Voile]+1;
                                    refreshVieBateau();

                                    effacerecran;
                                    dessinerCadreXY(10,3,190,25,Simple,11,0);
                                    dessinerCadreXY(80,1,125,5,Simple,11,0);
                                    deplacerCurseurXY(96,3);
                                    CouleurTexte(10);
                                    write(' AMÉLIORATION ');
                                    deplacerCurseurXY(15,11);
                                    write('Amélioration réussite');
                                    deplacerCurseurXY(37,11);

                               end
                             else
                                 begin
                                   effacerecran;
                                   dessinerCadreXY(10,3,190,25,Simple,11,0);
                                   dessinerCadreXY(80,1,125,5,Simple,11,0);
                                   deplacerCurseurXY(96,3);
                                   CouleurTexte(12);
                                   write(' AMÉLIORATION ');
                                   deplacerCurseurXY(15,12);
                                   write('Vous ne pouvez pas acheter cette amélioration');
                                   deplacerCurseurXY(61,12);
                                 end;
                      end;
                  2 : begin
                          if (Inv.outils >= 25) AND (Inv.Bois >= 70) AND (Inv.Argent>=3000) then
                               begin
                                    //Différence Outils
                                    Outil:= getOutils();
                                    setOutils(Outil);
                                    diffOutil := (getOutils()-25);
                                    Inv.Outils := diffOutil;


                                    //Différence Bois
                                    Bois:=getBois();
                                    setBois(Bois);
                                    diffBois := (getBois()-70);
                                    Inv.Bois := diffBois;

                                    //Différence Argent
                                    Argent:=getArgent();
                                    setArgent(Argent);
                                    diffArgent := (getArgent()-3000);
                                    Inv.Argent := diffArgent;

                                    ABateau[Bateau,Voile] := ABateau[Bateau,Voile]+1;
                                    refreshVieBateau();

                                    effacerecran;
                                    dessinerCadreXY(10,3,190,25,Simple,11,0);
                                    dessinerCadreXY(80,1,125,5,Simple,11,0);
                                    deplacerCurseurXY(96,3);
                                    CouleurTexte(10);
                                    write(' AMÉLIORATION ');
                                    deplacerCurseurXY(15,11);
                                    write('Amélioration réussite');
                                    deplacerCurseurXY(37,11);

                               end
                             else
                                 begin
                                   effacerecran;
                                   dessinerCadreXY(10,3,190,25,Simple,11,0);
                                   dessinerCadreXY(80,1,125,5,Simple,11,0);
                                   deplacerCurseurXY(96,3);
                                   CouleurTexte(12);
                                   write(' AMÉLIORATION ');
                                   deplacerCurseurXY(15,12);
                                   write('Vous ne pouvez pas acheter cette amélioration');
                                   deplacerCurseurXY(61,12);
                                 end;

                      end;
                  3 : begin
                          effacerecran;
                          dessinerCadreXY(10,3,190,25,Simple,11,0);
                          dessinerCadreXY(80,1,125,5,Simple,11,0);
                          deplacerCurseurXY(96,3);
                          CouleurTexte(12);
                          write(' AMÉLIORATION ');
                          deplacerCurseurXY(15,12);
                          write('Vous avez le niveau maximum pour cette amélioration');
                          deplacerCurseurXY(69,12);
                  end;
                end;
             end;
         3 : begin
                case ABateau[Bateau, Coque] of
                  0 : begin
                          if (Inv.outils >= 10) AND (Inv.Bois >= 50) AND (Inv.Argent>=1000) then
                               begin
                                    //Différence Outils
                                    Outil:= getOutils();
                                    setOutils(Outil);
                                    diffOutil := (getOutils()-10);
                                    Inv.Outils := diffOutil;


                                    //Différence Bois
                                    Bois:=getBois();
                                    setBois(Bois);
                                    diffBois := (getBois()-50);
                                    Inv.Bois := diffBois;

                                    //Différence Argent
                                    Argent:=getArgent();
                                    setArgent(Argent);
                                    diffArgent := (getArgent()-1000);
                                    Inv.Argent := diffArgent;

                                    ABateau[Bateau,Coque] := ABateau[Bateau,Coque]+1;
                                    refreshVieBateau();

                                    effacerecran;
                                    dessinerCadreXY(10,3,190,25,Simple,11,0);
                                    dessinerCadreXY(80,1,125,5,Simple,11,0);
                                    deplacerCurseurXY(96,3);
                                    CouleurTexte(10);
                                    write(' AMÉLIORATION ');
                                    deplacerCurseurXY(15,11);
                                    write('Amélioration réussite');
                                    deplacerCurseurXY(37,11);

                               end
                             else
                                 begin
                                   effacerecran;
                                   dessinerCadreXY(10,3,190,25,Simple,11,0);
                                   dessinerCadreXY(80,1,125,5,Simple,11,0);
                                   deplacerCurseurXY(96,3);
                                   CouleurTexte(12);
                                   write(' AMÉLIORATION ');
                                   deplacerCurseurXY(15,12);
                                   write('Vous ne pouvez pas acheter cette amélioration');
                                   deplacerCurseurXY(61,12);
                                 end;
                      end;
                  1 : begin
                          if (Inv.outils >= 15) AND (Inv.Bois >= 100) AND (Inv.Argent>=2000) then
                               begin
                                    //Différence Outils
                                    Outil:= getOutils();
                                    setOutils(Outil);
                                    diffOutil := (getOutils()-15);
                                    Inv.Outils := diffOutil;


                                    //Différence Bois
                                    Bois:=getBois();
                                    setBois(Bois);
                                    diffBois := (getBois()-100);
                                    Inv.Bois := diffBois;

                                    //Différence Argent
                                    Argent:=getArgent();
                                    setArgent(Argent);
                                    diffArgent := (getArgent()-2000);
                                    Inv.Argent := diffArgent;

                                    ABateau[Bateau,Coque] := ABateau[Bateau,Coque]+1;
                                    refreshVieBateau();

                                    effacerecran;
                                    dessinerCadreXY(10,3,190,25,Simple,11,0);
                                    dessinerCadreXY(80,1,125,5,Simple,11,0);
                                    deplacerCurseurXY(96,3);
                                    CouleurTexte(10);
                                    write(' AMÉLIORATION ');
                                    deplacerCurseurXY(15,11);
                                    write('Amélioration réussite');
                                    deplacerCurseurXY(37,11);

                               end
                             else
                                 begin
                                   effacerecran;
                                   dessinerCadreXY(10,3,190,25,Simple,11,0);
                                   dessinerCadreXY(80,1,125,5,Simple,11,0);
                                   deplacerCurseurXY(96,3);
                                   CouleurTexte(12);
                                   write(' AMÉLIORATION ');
                                   deplacerCurseurXY(15,12);
                                   write('Vous ne pouvez pas acheter cette amélioration');
                                   deplacerCurseurXY(61,12);
                                 end;
                      end;
                  2 : begin
                          if (Inv.outils >= 20) AND (Inv.Bois >= 150) AND (Inv.Argent>=3000) then
                               begin
                                    //Différence Outils
                                    Outil:= getOutils();
                                    setOutils(Outil);
                                    diffOutil := (getOutils()-20);
                                    Inv.Outils := diffOutil;


                                    //Différence Bois
                                    Bois:=getBois();
                                    setBois(Bois);
                                    diffBois := (getBois()-150);
                                    Inv.Bois := diffBois;

                                    //Différence Argent
                                    Argent:=getArgent();
                                    setArgent(Argent);
                                    diffArgent := (getArgent()-3000);
                                    Inv.Argent := diffArgent;

                                    ABateau[Bateau,Coque] := ABateau[Bateau,Coque]+1;
                                    refreshVieBateau();

                                    effacerecran;
                                    dessinerCadreXY(10,3,190,25,Simple,11,0);
                                    dessinerCadreXY(80,1,125,5,Simple,11,0);
                                    deplacerCurseurXY(96,3);
                                    CouleurTexte(10);
                                    write(' AMÉLIORATION ');
                                    deplacerCurseurXY(15,11);
                                    write('Amélioration réussite');
                                    deplacerCurseurXY(37,11);

                               end
                             else
                                 begin
                                   effacerecran;
                                   dessinerCadreXY(10,3,190,25,Simple,11,0);
                                   dessinerCadreXY(80,1,125,5,Simple,11,0);
                                   deplacerCurseurXY(96,3);
                                   CouleurTexte(12);
                                   write(' AMÉLIORATION ');
                                   deplacerCurseurXY(15,12);
                                   write('Vous ne pouvez pas acheter cette amélioration');
                                   deplacerCurseurXY(61,12);
                                 end;

                      end;
                  3 : begin
                          effacerecran;
                          dessinerCadreXY(10,3,190,25,Simple,11,0);
                          dessinerCadreXY(80,1,125,5,Simple,11,0);
                          deplacerCurseurXY(96,3);
                          CouleurTexte(12);
                          write(' AMÉLIORATION ');
                          deplacerCurseurXY(15,12);
                          write('Vous avez le niveau maximum pour cette amélioration');
                          deplacerCurseurXY(69,12);
                  end;
                end;
             end;

    end;
    attendre(1000);

end;

procedure initialisationAmeliorationBateaux();
var
    Bat : bateau;
    Amelio : Amelioration;

begin
    for Bat:= Colonisation to Transport do
    begin
       for Amelio:= Mat to Coque do
       begin
           ABateau[Bat,Amelio] := 0;
       end;
    end;
end;



procedure DessinBateau();
var
  CurseurDessinBateau:coordonnees;

begin
    couleurTexte(15);
    deplacerCurseurXY(70,17);
    CurseurDessinBateau:=positionCurseur();
    write('                          <|');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('               __',Chr (39),'__     __',Chr (39),'__      __',Chr (39),'__');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('              /    /    /    /     /    /');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('             /\____\    \____\     \____\               ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('            / ___!___   ___!___    ___!___               ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('          // (      (  (      (   (      (');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('        / /   \______\  \______\   \______\');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('      /  /   ____!_____ ___!______ ____!_____  ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('    /   /   /         //         //         /  ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('  /    /   |         ||         ||         |   ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('/_____/    \         \\         \\         \ ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('    \       \_________\\_________\\_________\   ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('     \         |          |         |           ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('      \________!__________!_________!________/  ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('       \|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_/|   ');
    CurseurDessinBateau.y:=CurseurDessinBateau.y+1;
    deplacerCurseur(CurseurDessinBateau);
    write('        \___________________________________/     ');
end;

procedure EcrireAmeliorationBateauColonisation();

var
  CurseurEcriture:coordonnees;
begin
    deplacerCurseurXY(20,2);
    CurseurEcriture:=positionCurseur();
    write('     _                __ _ _                 _   _               ____        _                         _         ____      _             _           _   _            ');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write('    / \   _ __ ___   /_/| (_) ___  _ __ __ _| |_(_) ___  _ __   | __ )  __ _| |_ ___  __ _ _   _    __| | ___   / ___|___ | | ___  _ __ (_)___  __ _| |_(_) ___  _ __  ');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write('   / _ \ | ',chr(39),'_ ` _ \ / _ \ | |/ _ \| ',chr(39),'__/ _` | __| |/ _ \| ',chr(39),'_ \  |  _ \ / _` | __/ _ \/ _` | | | |  / _` |/ _ \ | |   / _ \| |/ _ \| ',chr(39),'_ \| / __|/ _` | __| |/ _ \| ',chr(39),'_ \ ');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write('  / ___ \| | | | | |  __/ | | (_) | | | (_| | |_| | (_) | | | | | |_) | (_| | ||  __/ (_| | |_| | | (_| |  __/ | |__| (_) | | (_) | | | | \__ \ (_| | |_| | (_) | | | |');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write(' /_/   \_\_| |_| |_|\___|_|_|\___/|_|  \__,_|\__|_|\___/|_| |_| |____/ \__,_|\__\___|\__,_|\__,_|  \__,_|\___|  \____\___/|_|\___/|_| |_|_|___/\__,_|\__|_|\___/|_| |_|');
end;

procedure EcrireAmeliorationBateauExploration();

var
  CurseurEcriture:coordonnees;
begin
    deplacerCurseurXY(20,2);
    CurseurEcriture:=positionCurseur();
    write('    _                __ _ _                 _   _                 ____        _                           _ _                 _                 _   _               ');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write('   / \   _ __ ___   /_/| (_) ___  _ __ __ _| |_(_) ___  _ __     | __ )  __ _| |_ ___  __ _ _   _      __| ( ) _____  ___ __ | | ___  _ __ __ _| |_(_) ___  _ __    ');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write('  / _ \ | ',chr(39),'_ ` _ \ / _ \ | |/ _ \| ',chr(39),'__/ _` | __| |/ _ \| ',chr(39),'_ \    |  _ \ / _` | __/ _ \/ _` | | | |    / _` |/ / _ \ \/ / ',chr(39),'_ \| |/ _ \| ',chr(39),'__/ _` | __| |/ _ \| ',chr(39),'_ \   ');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write(' / ___ \| | | | | |  __/ | | (_) | | | (_| | |_| | (_) | | | |   | |_) | (_| | ||  __/ (_| | |_| |   | (_| | |  __/>  <| |_) | | (_) | | | (_| | |_| | (_) | | | |  ');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write('/_/   \_\_| |_| |_|\___|_|_|\___/|_|  \__,_|\__|_|\___/|_| |_|   |____/ \__,_|\__\___|\__,_|\__,_|    \__,_|  \___/_/\_\ .__/|_|\___/|_|  \__,_|\__|_|\___/|_| |_|  ');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write('                                                                                                                       |_|                                          ');
end;

procedure EcrireAmeliorationBateauTransport();

var
  CurseurEcriture:coordonnees;
begin
    deplacerCurseurXY(20,2);
    CurseurEcriture:=positionCurseur();
    write('     _                __ _ _                 _   _               ____        _                         _        _____                                     _   ');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write('    / \   _ __ ___   /_/| (_) ___  _ __ __ _| |_(_) ___  _ __   | __ )  __ _| |_ ___  __ _ _   _    __| | ___  |_   _| __ __ _ _ __  ___ _ __   ___  _ __| |_ ');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write('   / _ \ | ',chr(39),'_ ` _ \ / _ \ | |/ _ \| ',chr(39),'__/ _` | __| |/ _ \| ',chr(39),'_ \  |  _ \ / _` | __/ _ \/ _` | | | |  / _` |/ _ \   | || ',chr(39),'__/ _` | ',chr(39),'_ \/ __| ',chr(39),'_ \ / _ \| ',chr(39),'__| __|');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write('  / ___ \| | | | | |  __/ | | (_) | | | (_| | |_| | (_) | | | | | |_) | (_| | ||  __/ (_| | |_| | | (_| |  __/   | || | | (_| | | | \__ \ |_) | (_) | |  | |_ ');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write(' /_/   \_\_| |_| |_|\___|_|_|\___/|_|  \__,_|\__|_|\___/|_| |_| |____/ \__,_|\__\___|\__,_|\__,_|  \__,_|\___|   |_||_|  \__,_|_| |_|___/ .__/ \___/|_|   \__|');
    CurseurEcriture.y:=CurseurEcriture.y+1;
    deplacerCurseur(CurseurEcriture);
    write('                                                                                                                                        |_|                   ');
end;

procedure Cadres_Ameliorations(Bateau : bateau);
begin
    deplacerCurseurXY(110,20);
    couleurTexte(5);
    write(#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196);
    dessinerCadreXY(130,17,180,24,simple,5,0);

    couleurTexte(15);
    deplacerCurseurXY(152,18);
    write('Voile');

    deplacerCurseurXY(134,20);
    if ABateau[Bateau, Voile] = 3 then
      begin
            couleurTexte(10);
            write('Niv 1 | 15 Outils, 50 Tissus, 1000 Or');
            deplacerCurseurXY(134,21);
            write('Niv 2 | 20 Outils, 60 Tissus, 2000 Or ');
            deplacerCurseurXY(134,22);
            write('Niv 3 | 25 Outils, 70 Tissus, 3000 Or ');

            deplacerCurseurXY(176,18);
            couleurTexte(5);
            write('MAX');

      end
    else if ABateau[Bateau, Voile] = 2 then
      begin
            couleurTexte(10);
            write('Niv 1 | 15 Outils, 50 Tissus, 1000 Or');
            deplacerCurseurXY(134,21);
            write('Niv 2 | 20 Outils, 60 Tissus, 2000 Or ');
            couleurTexte(4);
            deplacerCurseurXY(134,22);
            write('Niv 3 | 25 Outils, 70 Tissus, 3000 Or ');
      end
    else if ABateau[Bateau, Voile] = 1 then
      begin
            couleurTexte(10);
            write('Niv 1 | 15 Outils, 50 Tissus, 1000 Or');
            couleurTexte(4);
            deplacerCurseurXY(134,21);
            write('Niv 2 | 20 Outils, 60 Tissus, 2000 Or ');
            deplacerCurseurXY(134,22);
            write('Niv 3 | 25 Outils, 70 Tissus, 3000 Or ');
      end
    else if ABateau[Bateau, Voile] = 0 then
      begin
            couleurTexte(4);
            write('Niv 1 | 15 Outils, 50 Tissus, 1000 Or');
            deplacerCurseurXY(134,21);
            write('Niv 2 | 20 Outils, 60 Tissus, 2000 Or ');
            deplacerCurseurXY(134,22);
            write('Niv 3 | 25 Outils, 70 Tissus, 3000 Or ');
      end;
    couleurTexte(15);

    deplacerCurseurXY(113,32);
    couleurTexte(5);
    write(#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196);
    dessinerCadreXY(130,29,180,36,simple,5,0);

    couleurTexte(15);
    deplacerCurseurXY(152,30);
    write('Coque');

    deplacerCurseurXY(134,32);
    if ABateau[Bateau, Coque] = 3 then
      begin
            couleurTexte(10);
            write('Niv 1 | 20 Outils, 50 Bois, 1000 Or ');
            deplacerCurseurXY(134,33);
            write('Niv 2 | 30 Outils, 100 Bois, 2000 Or ');
            deplacerCurseurXY(134,34);
            write('Niv 3 | 40 Outils, 150 Bois, 3000 Or  ');

            deplacerCurseurXY(176,30);
            couleurTexte(5);
            write('MAX');
      end
    else if ABateau[Bateau, Coque] = 2 then
      begin
            couleurTexte(10);
            write('Niv 1 | 20 Outils, 50 Bois, 1000 Or ');
            deplacerCurseurXY(134,33);
            write('Niv 2 | 30 Outils, 100 Bois, 2000 Or ');
            couleurTexte(4);
            deplacerCurseurXY(134,34);
            write('Niv 3 | 40 Outils, 150 Bois, 3000 Or  ');
      end
    else if ABateau[Bateau, Coque] = 1 then
      begin
            couleurTexte(10);
            write('Niv 1 | 20 Outils, 50 Bois, 1000 Or ');
            couleurTexte(4);
            deplacerCurseurXY(134,33);
            write('Niv 2 | 30 Outils, 100 Bois, 2000 Or ');
            deplacerCurseurXY(134,34);
            write('Niv 3 | 40 Outils, 150 Bois, 3000 Or  ');
      end
    else if ABateau[Bateau, Coque] = 0 then
      begin
            couleurTexte(4);
            write('Niv 1 | 20 Outils, 50 Bois, 1000 Or ');
            deplacerCurseurXY(134,33);
            write('Niv 2 | 30 Outils, 100 Bois, 2000 Or ');
            deplacerCurseurXY(134,34);
            write('Niv 3 | 40 Outils, 150 Bois, 3000 Or  ');
      end;
    couleurTexte(15);



    deplacerCurseurXY(62,29);
    couleurTexte(5);
    write(#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196);
    dessinerCadreXY(11,26,65,33,simple,5,0);

    couleurTexte(15);
    deplacerCurseurXY(36,27);
    write('Mat');

    deplacerCurseurXY(15,29);
    if ABateau[Bateau, Mat] = 3 then
       begin
             couleurTexte(10);
             write('Niv 1 | 10 Outils, 25 Bois, 1000 Or ');
             deplacerCurseurXY(15,30);
             write('Niv 2 | 15 Outils, 40 Bois, 2000 Or ');
             deplacerCurseurXY(15,31);
             write('Niv 3 | 20 Outils, 55 Bois, 3000 Or ');

             deplacerCurseurXY(61,27);
             couleurTexte(5);
             write('MAX');
       end
    else if ABateau[Bateau, Mat] = 2 then
       begin
             couleurTexte(10);
             write('Niv 1 | 10 Outils, 25 Bois, 1000 Or ');
             deplacerCurseurXY(15,30);
             write('Niv 2 | 15 Outils, 40 Bois, 2000 Or ');
             couleurTexte(4);
             deplacerCurseurXY(15,31);
             write('Niv 3 | 20 Outils, 55 Bois, 3000 Or ');
       end
    else if ABateau[Bateau, Mat] = 1 then
       begin
             couleurTexte(10);
             write('Niv 1 | 10 Outils, 25 Bois, 1000 Or ');
             couleurTexte(4);
             deplacerCurseurXY(15,30);
             write('Niv 2 | 15 Outils, 40 Bois, 2000 Or ');
             deplacerCurseurXY(15,31);
             write('Niv 3 | 20 Outils, 55 Bois, 3000 Or ');
       end
    else if ABateau[Bateau, Mat] = 0 then
       begin
             couleurTexte(4);
             write('Niv 1 | 10 Outils, 25 Bois, 1000 Or ');
             deplacerCurseurXY(15,30);
             write('Niv 2 | 15 Outils, 40 Bois, 2000 Or ');
             deplacerCurseurXY(15,31);
             write('Niv 3 | 20 Outils, 55 Bois, 3000 Or ');
       end;
     couleurTexte(15);

end;

procedure refreshVieBateau();
begin

  VG[5] := 12 + ABateau[Exploration,Mat]+ABateau[Exploration,Voile]+ABateau[Exploration,Coque];

  if (E.BateauExploration1 = False) AND (PF.FinExploration1=False) then
     VG[1]:=VG[5];
  if (E.BateauExploration2 = False) AND (PF.FinExploration2=False) then
     VG[2]:=VG[5];
  if (E.BateauExploration3 = False) AND (PF.FinExploration3=False) then
     VG[3]:=VG[5];
  if (E.BateauExploration4 = False) AND (PF.FinExploration4=False) then
     VG[4]:=VG[5];
end;


procedure CadreOptionAmelioration();
begin
//Cadre
  dessinerCadreXY(64, 43, 136, 52, Simple, 11, 0);
  dessinerCadreXY(91, 42, 113, 44, Simple, 11, 0);
  deplacerCurseurXY(96, 43);
  CouleurTexte(11);
  Write(#200, #205, ' Options ', #205, #188);

  //Contenu
  deplacerCurseurXY(68, 45);
  CouleurTexte(5);
  Write('Améliorer :');
  CouleurTexte(11);

  deplacerCurseurXY(71, 46);
  Write('1| Mat');
  deplacerCurseurXY(101, 46);
  Write('');

  deplacerCurseurXY(71, 47);
  Write('2| Voile');
  deplacerCurseurXY(101, 47);
  Write('');

  deplacerCurseurXY(71, 48);
  Write('3| Coque');
  deplacerCurseurXY(101, 48);
  Write('');

  deplacerCurseurXY(71, 50);
  Write('0| Ne rien améliorer');

end;

end.
