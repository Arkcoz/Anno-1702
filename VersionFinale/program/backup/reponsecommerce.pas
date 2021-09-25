{$codepage utf8}
unit reponseCommerce;                                                            //unité qui s'occupe de la réponse d'un joueur de la proposition d'échange de l'autre


interface

uses
  SysUtils, GestionEcran, ProposerCommerce,commerceBackEnd, Ressource, MenuNouvellePartie;

procedure popUpCommerce(IP,Partie, moi : string);                                //Affiche le menu de résolution de l'échange (accepter/refuser, récapitulatifs)
procedure Ra0Commerce(IP, Partie: string);                                       //Remise à zéro des fichiers contenant les données de échanges

implementation
const
  milieu =70 ;

procedure afficherEchange(IP, Partie, joueur : String);                          //Affiche la proposition d'échange
var
  echange : string;
begin
  echange := resumeEchange(IP,Partie,joueur);

  dessinerCadreXY(50,10,150,57,Simple,15,0);
  dessinerCadreXY(91,9,113,11,Simple,15,0);
  deplacerCurseurXY(99,10);
  write('Commerce');

  deplacerCurseurXY(70,20);
  couleurTexte(14);
  write('Vous avez reçu une proposition d''échange !');
  deplacerCurseurXY(70,23);
  couleurTexte(9);
  write(echange);

  couleurTexte(14);
  afficherSesRessources(115, 40);

  couleurTexte(15);
  deplacerCurseurXY(80,32);


end;

procedure afficherRefus(joueur : string);                                        //affiche que l'autre joueur a refuser l'échange
var
  nom : string;
begin
     case joueur of
     'J1' : nom := PersoJ1.nom;
     'J2' : nom := PersoJ2.nom;
     end;
     effacerEcran;
     dessinerCadreXY(1,1,199,59,double,4,0);
     deplacerCurseurXY(milieu,19);
     couleurTexte(12);
     write(nom, ' a refusé votre offre. Vous marchandises vous ont été renvoyées.');
     deplacerCurseurXY(milieu,21);
     couleurTexte(8);
     write('Appuyez sur Entrer pour continuer');
     readln;

end;

procedure afficherRecapRefuser;                                                  //affiche la confirmation que le joueur (utilisateur) a bien refuser l'échange
begin
  sleep(1000);
  effacerEcran;
  dessinerCadreXY(1,1,199,59,double,4,0);
  deplacerCurseurXY(milieu,19);
  couleurTexte(12);
  write('Vous avez refusé l''offre.');
  deplacerCurseurXY(milieu,21);
  couleurTexte(8);
  write('Appuyez sur Entrer pour continuer');
  readln;

end;

procedure afficherRecapAccepter(IP,Partie,Joueur : string; client : boolean);    //affiche le recapitulatif ressources échangées et résoud l'échange
var
 RessourceDonnee, RessourceVoulue, QteDonnee, QteCaution, QteVoulue, yD, yV,  temp, nvRecu, nvPerdu : integer;
begin
     effacerEcran;
     dessinerCadreXY(1,1,199,59,double,2,0);
     deplacerCurseurXY(milieu,3);
     couleurTexte(10);
     write('Offre acceptée.');
     nvRecu := -1;
     nvPerdu := -1;
     RessourceDonnee := getRessourceDonnee_S(IP, Partie, Joueur);
     QteDonnee :=  getQteDonnee_S(IP, Partie, Joueur);
     RessourceVoulue := getRessourceVoulue_S(IP, Partie, Joueur);
     QteVoulue := getQteVoulue_S(IP, Partie, Joueur);

     couleurTexte(15);
     deplacerCurseurXY(55,13);
     write('Poissons :');
     deplacerCurseurXY(70,13);
     write(getPoisson);


     deplacerCurseurXY(55,14);
     write('Bois :');
     deplacerCurseurXY(70,14);
     write(getBois);


     deplacerCurseurXY(55,15);
     write('Outils :');
     deplacerCurseurXY(70,15);
     write(getOutils);


     deplacerCurseurXY(55,16);
     write('Laine :');
     deplacerCurseurXY(70,16);
     write(getLaine);


     deplacerCurseurXY(55,17);
     write('Tissu :');
     deplacerCurseurXY(70,17);
     write(getTissu);

     deplacerCurseurXY(55,18);
     write('Argent :');
     deplacerCurseurXY(70,18);
     write(getArgent);

  if (not client) then
  begin
    temp := RessourceDonnee;
    RessourceDonnee := RessourceVoulue;
    RessourceVoulue := temp;

    QteCaution := QteDonnee;
    QteDonnee := QteVoulue;
    QteVoulue := 0;
  end;


  case RessourceDonnee of
  1 : begin
      nvRecu := (getPoisson + QteDonnee);
      if (nvRecu > LimitR[getNiveauActuel,Rpoisson]) then
         nvRecu :=(LimitR[getNiveauActuel,Rpoisson]);
      SetPoisson(nvRecu);
      yD := 13
      end;
  2:  begin
      nvRecu := (getBois + QteDonnee);
      if (nvRecu > LimitR[getNiveauActuel,Rbois]) then
         nvRecu :=(LimitR[getNiveauActuel,Rbois]);
      SetBois(nvRecu);
      yD := 14
      end;
  3:  begin
      nvRecu := (getOutils + QteDonnee);
      if (nvRecu > LimitR[getNiveauActuel,Routil]) then
         nvRecu :=(LimitR[getNiveauActuel,Routil]);
      SetOutils(nvRecu);
      yD := 15
      end;
  4:  begin
      nvRecu := (getLaine + QteDonnee);
      if (nvRecu > LimitR[getNiveauActuel,Rlaine]) then
         nvRecu :=(LimitR[getNiveauActuel,Rlaine]);
      SetLaine(nvRecu);
      yD := 16
      end;
  5:  begin
      nvRecu := (getTissu + QteDonnee);
      if (nvRecu > LimitR[getNiveauActuel,Rtissu]) then
         nvRecu :=(LimitR[getNiveauActuel,Rtissu]);
      SetTissu(nvRecu);
      yD := 17
      end;
  6:  begin
      nvRecu := (getArgent + QteDonnee);
      SetArgent(nvRecu);
      yD := 18
      end;
  end;

  case RessourceVoulue of
  1:  begin
      nvPerdu := (getPoisson - QteVoulue);
      SetPoisson(nvPerdu);
      yV := 13
      end;
  2:  begin
      nvPerdu := (getBois - QteVoulue);
      SetBois(nvPerdu);
      yV := 14
      end;
  3:  begin
      nvPerdu := (getOutils - QteVoulue);
      SetOutils(nvPerdu);
      yV := 15
      end;
  4:  begin
      nvPerdu := (getLaine - QteVoulue);
      SetLaine(nvPerdu);
      yV := 16
      end;
  5:  begin
      nvPerdu := (getTissu - QteVoulue);
      SetTissu(nvPerdu);
      yV := 17
      end;
  6:  begin
      nvPerdu := (getArgent - QteVoulue);
      SetArgent(nvPerdu);
      yV := 18
      end;
  end;


  deplacerCurseurXY(85, yD);
  couleurTexte(2);
  write('+ ', QteDonnee);

  deplacerCurseurXY(85, yV);
  couleurTexte(4);

  if client then write('- ', QteVoulue)
  else write('(- ', QteCaution,')');

  couleurTexte(14);
  deplacerCurseurXY(100,yD);
  write(nvRecu);
  deplacerCurseurXY(100,yV);
  write(nvPerdu);

  deplacerCurseurXY(milieu,45);
  couleurTexte(8);
  write('Appuyez sur Entrer pour continuer');
  readln;

  if ((joueur = 'J2')  AND client) then sleep(1000);

end;


procedure afficherAttenteReponse(joueur : string);                               //affiche un message prévenant le joueur qu'il attend la réponse de l'autre joueur
var
  nom : string;
begin
     case joueur of
         'J1' : nom := PersoJ1.nom;
         'J2' : nom := PersoJ2.nom;
     end;
     effacerEcran;
     dessinerCadreXY(1,1,199,59,double,1,0);
     deplacerCurseurXY(milieu,19);
     couleurTexte(9);
     write(nom, ' est en train de consulter votre offre.');

end;

function accepterOuRefuser(IP, Partie, Joueur : string):integer;                 //Affiche un menu permettant au joueur d'accepter ou refuser ou lui informant qu'il ne peut pas accepter l'échange
var
  reponse, RessourceVoulue, QteVoulue, RessourceDonnee, QteDonnee, nvRecu : integer;
  surcharge : boolean;
  ressource : string;
begin

     RessourceVoulue := getRessourceVoulue_S(IP, Partie, Joueur);
     QteVoulue := getQteVoulue_S(IP, Partie, Joueur);
     RessourceDonnee := getRessourceDonnee_S(IP,Partie,Joueur);
     QteDonnee := getQteDonnee_S(IP, Partie, Joueur);
     surcharge := FALSE;

       case RessourceDonnee of
  1 : begin
      nvRecu := (getPoisson + QteDonnee);
      if (nvRecu > LimitR[getNiveauActuel,Rpoisson]) then
         begin
           surcharge := TRUE;
           nvRecu :=(nvRecu-LimitR[getNiveauActuel,Rpoisson]);
           ressource := 'poissons';
         end;
      end;
  2:  begin
      nvRecu := (getBois + QteDonnee);
      if (nvRecu > LimitR[getNiveauActuel,Rbois]) then
         begin
           surcharge := TRUE;
           nvRecu :=(nvRecu-LimitR[getNiveauActuel,Rbois]);
           ressource := 'bois';
         end;
      end;
  3:  begin
      nvRecu := (getOutils + QteDonnee);
      if (nvRecu > LimitR[getNiveauActuel,Routil]) then
         begin
           surcharge := TRUE;
           nvRecu :=(nvRecu-LimitR[getNiveauActuel,Routil]);
           ressource := 'outils';
         end;
      end;
  4:  begin
      nvRecu := (getLaine + QteDonnee);
      if (nvRecu > LimitR[getNiveauActuel,Rlaine]) then
         begin
           surcharge := TRUE;
           nvRecu :=(nvRecu-LimitR[getNiveauActuel,Rlaine]);
           ressource := 'laines';
         end;
      end;
  5:  begin
      nvRecu := (getTissu + QteDonnee);
      if (nvRecu > LimitR[getNiveauActuel,Rtissu]) then
         begin
           surcharge := TRUE;
           nvRecu :=(nvRecu-LimitR[getNiveauActuel,Rtissu]);
           ressource := 'tissus';
         end;
      end;
  6:  //rien
  end;


     if(checkRessource(RessourceVoulue, QteVoulue) = FALSE) then
     begin
          deplacerCurseurXY(milieu,22);
          couleurTexte(12);
          write('Vous n''avez plus assez de ressource pour accepter l''offre.');
          accepterOuRefuser := 2;
          deplacerCurseurXY(milieu,23);
          couleurTexte(8);
          write('Appuyez sur Entrer pour continuer');
          readln;
     end
     else
     begin
       deplacerCurseurXY(70,30);
       couleurTexte(2);
       write('1 | Accepter');
       deplacerCurseurXY(100,30);
       couleurTexte(4);
       write('2 | Refuser');
       if surcharge then
       begin
         deplacerCurseurXY(milieu,24);
         couleurTexte(12);
         write('Vous n''avez plus assez de place dans vos entrepots, vous ne pourrez pas stocker ', nvRecu, ' ', ressource,'.');
       end;
          repeat
          readln(reponse);
          if ((reponse <1) OR (reponse >2)) then
          begin
               deplacerCurseurXY(17,57);
               couleurTexte(12);
               write('/!\');
               couleurTexte(15);
               write(' Veuillez écrire un choix valide!');
               readln;
          end;
          until ((reponse = 1) OR (reponse = 2));
     accepterOuRefuser := reponse;
     end;
end;
                                                                                 //Ajoute aux ressource du joueur ce qui lui avait été enlevé lors de sa proposition
procedure remiseCaution(IP,Partie,Joueur : string);
var
  RessourceDonnee, QteDonnee, nvRecu : integer;
begin
     RessourceDonnee := getRessourceDonnee_S(IP, Partie, Joueur);
     QteDonnee := getQteDonnee_S(IP, Partie, Joueur);


       case RessourceDonnee of
  1 : begin
      nvRecu := (getPoisson + QteDonnee);
      SetPoisson(nvRecu);
      end;
  2:  begin
      nvRecu := (getBois + QteDonnee);
      SetBois(nvRecu);
      end;
  3:  begin
      nvRecu := (getOutils + QteDonnee);
      SetOutils(nvRecu);
      end;
  4:  begin
      nvRecu := (getLaine + QteDonnee);
      SetLaine(nvRecu);
      end;
  5:  begin
      nvRecu := (getTissu + QteDonnee);
      SetTissu(nvRecu);
      end;
  6:  begin
      nvRecu := (getArgent + QteDonnee);
      SetArgent(nvRecu);
      end;
  end;


end;

procedure popUpCommerce(IP,Partie, moi : string);                                //Affiche le menu de résolution de l'échange (accepter/refuser, récapitulatifs
var
  acceptee, reponse: integer;

begin
  effacerEcran;
  if checkEchange(IP, Partie, 'J1') = true then //si J1 veut échanger
  begin
    if moi = 'J1' then
    begin
      afficherAttenteReponse('J2');
      acceptee := attendreAouR(IP, Partie, 'J2');
      case acceptee of
      1 : afficherRecapAccepter(IP, Partie, 'J1', FALSE);
      2 : begin
          afficherRefus('J2');
          remiseCaution(IP,Partie,'J1');
          end;
      end;
    end
    else //si moi = J2 et J1 veut échanger
    begin
      afficherEchange(IP, Partie, 'J1');
      reponse := accepterOuRefuser(IP,Partie,'J1');
      case reponse of
      1 : begin
          envoyerAccepter(IP,Partie,moi);
          afficherRecapAccepter(IP, Partie, 'J1', TRUE);
          end;
      2 : begin
          envoyerRefuser(IP, Partie, moi);
          afficherRecapRefuser;
          end;
      end;
    end;

  end;


  if ((checkEchange(IP, Partie, 'J2') = TRUE) AND (getRessourceDonnee_S(IP, Partie, 'J2')<>0)) then //si J2 veut échanger
  begin
    if moi = 'J2' then
    begin
      afficherAttenteReponse('J1');
      acceptee := attendreAouR(IP, Partie, 'J1');
      case acceptee of
      1 : afficherRecapAccepter(IP, Partie, 'J2', FALSE);
      2 : begin
          remiseCaution(IP,Partie,'J2');
          afficherRefus('J1');
          end;
      end;
    end
    else //si moi = J1 et J2 veut échanger
    begin
      afficherEchange(IP, Partie, 'J2');
      reponse := accepterOuRefuser(Ip, Partie, 'J2');
      case reponse of
      1 : begin
          envoyerAccepter(IP,Partie,moi);
          afficherRecapAccepter(IP, Partie, 'J2', TRUE);
          end;
      2 : begin
          envoyerRefuser(IP, Partie, moi);
          afficherRecapRefuser;
          end;
      end;
    end;
    end;
    //personne ne veut échanger = il ne se passe rien
  end;

procedure Ra0Commerce(IP, Partie: string);                                       //Remise à zéro des fichiers contenant les données de échanges
begin
  RAZCommerce(IP, Partie);
end;



end.

