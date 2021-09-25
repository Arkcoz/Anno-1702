{$codepage utf8}
unit unitTraitementDonnees;                                                      //unité qui gère le traitement des données des fichiers de sauvegarde pour enregistrer les variables dans le fichier ou enregistrer les données du fichier dans les variables du programme


interface
uses
   Classes, SysUtils, StrUtils, unitHTTP, Ressource, Population, AchatNavire, MenuNouvellePartie;

procedure ExtraireDonneesRessourceJ1(Partie : String);                           //assigne les valeurs contenurs dans le fichier de sauvergarde dans les variables correspondantes au Joueur 1
procedure CompresserDonneesRessource(Partie, Joueur : String);                   //enregistre les valeurs de toutes les variables utilisées par le programme principal dans un fichier texte
procedure ExtraireDonneesRessourceJ2(Partie : String);                           //assigne les valeurs contenurs dans le fichier de sauvergarde dans les variables correspondantes au Joueur 2
procedure ExtraireSesDonneesRessource(Partie, Joueur : String);                  //assigne les valeurs contenurs dans le fichier de sauvergarde dans les variables correspondantes utilisées par le programme principal


implementation

const
    pnom = 1;                                                                    //position de cette variable dans le fichier texte (ex : nom;argent;tissu)

    pargent = 2;
    ptissu = 3;
    pbois = 4;
    ppoisson = 5;
    plaine  = 6;
    poutils  = 7;

    pcolon = 8;
    pcitoyen = 9;
    pConscrit = 10;
    pSoldat = 11;
    pFusilier = 12;


procedure ExtraireSesDonneesRessource(Partie, Joueur : String);                  //assigne les valeurs contenurs dans le fichier de sauvergarde dans les variables correspondantes utilisées par le programme principal
var
   temp, strSave, adresseTxt : string;
   txtSaveFile : textFile;
   ileItt : iles;
   batItt : batiments;
   pos : integer;

begin
     pos := 13;
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/save.txt';                 //lecture du fichier de sauvegarde
     AssignFile(txtSaveFile, adresseTxt);
     reset(txtSaveFile);
     readln(txtSaveFile, strSave);
     CloseFile(txtSaveFile);
     Perso.nom := (ExtractDelimited(pnom,strSave,StdWordDelims));                //exctraction mot position pnom vers variable nom
     //argent
     Setargent(StrToInt(ExtractDelimited(pargent,strSave,StdWordDelims)));
     //tissu
     SetTissu(StrToInt(ExtractDelimited(ptissu,strSave,StdWordDelims)));

     //bois
     Setbois(StrToInt(ExtractDelimited(pbois,strSave,StdWordDelims)));

     //poisson
     Setpoisson(StrToInt(ExtractDelimited(ppoisson,strSave,StdWordDelims)));

     //laine
     Setlaine(StrToInt(ExtractDelimited(plaine,strSave,StdWordDelims)));

     //outils
     Setoutils(StrToInt(ExtractDelimited(poutils,strSave,StdWordDelims)));

     //Colon
     Setcolon(StrToInt(ExtractDelimited(pcolon,strSave,StdWordDelims)));

     //Citoyen
     Setcitoyen(StrToInt(ExtractDelimited(pcitoyen,strSave,StdWordDelims)));

     //Conscrit
     Setconscrit(StrToInt(ExtractDelimited(pconscrit,strSave,StdWordDelims)));

     //Soldat
     Setsoldat(StrToInt(ExtractDelimited(psoldat,strSave,StdWordDelims)));

     //Fusilier
     Setfusilier(StrToInt(ExtractDelimited(pfusilier,strSave,StdWordDelims)));

     for ileItt := DayfellCay to VolcanoIsland do                                //extraction des batiments sur chaque iles vers le tableau ile
     begin
          for batItt := maison_colon to chantier_naval do
          begin
          //maison_colon
          ile[ileItt, batItt] := StrToInt(ExtractDelimited(pos,strSave,StdWordDelims));
          pos := pos + 1
          end;
     end;

end;

procedure ExtraireDonneesRessourceJ1(Partie : String);                           //assigne les valeurs contenurs dans le fichier de sauvergarde dans les variables correspondantes au Joueur 1
var
   temp, strSave, adresseTxt : string;
   txtSaveFile : textFile;
   ileItt : iles;
   batItt : batiments;
   pos : integer;

begin
     pos := 13;
     adresseTxt := 'saves/multi/'+Partie+'/J1/save.txt';                         //lecture du fichier de sauvegarde
     AssignFile(txtSaveFile, adresseTxt);
     reset(txtSaveFile);
     readln(txtSaveFile, strSave);
     CloseFile(txtSaveFile);
     PersoJ1.nom := ExtractDelimited(pnom,strSave,StdWordDelims);                //exctraction mot position 1 vers variable nom
     //argent
     InvJ1.argent := StrToInt(ExtractDelimited(pargent,strSave,StdWordDelims));

     //tissu
     InvJ1.tissu := StrToInt(ExtractDelimited(ptissu,strSave,StdWordDelims));

     //bois
     InvJ1.bois := StrToInt(ExtractDelimited(pbois,strSave,StdWordDelims));

     //poisson
     InvJ1.poisson := StrToInt(ExtractDelimited(ppoisson,strSave,StdWordDelims));

     //laine
     InvJ1.laine := StrToInt(ExtractDelimited(plaine,strSave,StdWordDelims));

     //outils
     InvJ1.outils := StrToInt(ExtractDelimited(poutils,strSave,StdWordDelims));

     //Colon
     PopJ1.colon := StrToInt(ExtractDelimited(pcolon,strSave,StdWordDelims));

     //Citoyen
     PopJ1.citoyen := StrToInt(ExtractDelimited(pcitoyen,strSave,StdWordDelims));

     //Conscrit
     PopJ1.conscrit := StrToInt(ExtractDelimited(pconscrit,strSave,StdWordDelims));

     //Soldat
     PopJ1.soldat := StrToInt(ExtractDelimited(psoldat,strSave,StdWordDelims));

     //Fusilier
     PopJ1.fusilier := StrToInt(ExtractDelimited(pfusilier,strSave,StdWordDelims));

     for ileItt := DayfellCay to VolcanoIsland do                                //extraction des batiments sur chaque iles vers le tableau ileJ1
     begin
          for batItt := maison_colon to chantier_naval do
          begin
          //batiments
          ileJ1[ileItt, batItt] := StrToInt(ExtractDelimited(pos,strSave,StdWordDelims));
          pos := pos + 1
          end;
     end;

end;

procedure CompresserDonneesRessource(Partie,Joueur : String);                    //enregistre les valeurs de toutes les variables utilisées par le programme principal dans un fichier texte
var
   save, adresseTxt : String;
   txtSaveFile : textFile;
   ileItt : iles;
   batItt : batiments;
   pos : integer;
begin

     save :=  Concat(
     Perso.nom+';'
     +(IntToStr(getargent))+';'
     +(IntToStr(gettissu))+';'
     +(IntToStr(getbois))+';'
     +(IntToStr(getpoisson))+';'
     +(IntToStr(getlaine))+';'
     +(IntToStr(getoutils))+';'
     +(IntToStr(Pop.colon))+';'
     +(InttoStr(Pop.citoyen))+';'
     +(InttoStr(Pop.conscrit))+';'
     +(InttoStr(Pop.soldat))+';'
     +(InttoStr(Pop.fusilier))+';'
     );
     adresseTxt := 'saves/multi/'+Partie+'/'+Joueur+'/save.txt';                 //écriture du fichier de sauvegarde
     AssignFile(txtSaveFile, adresseTxt);
     rewrite(txtSaveFile);
     writeln(txtSaveFile, save);
     CloseFile(txtSaveFile);

     for ileItt := DayfellCay to VolcanoIsland do                                //écriture de chaque valeur du tableau ile
     begin
          for batItt := maison_colon to chantier_naval do
          begin
               save := concat(save+IntToStr(ile[ileItt, batItt])+';');
               AssignFile(txtSaveFile, adresseTxt);
               rewrite(txtSaveFile);
               writeln(txtSaveFile, save);
               CloseFile(txtSaveFile);
          end;
     end;

end;

procedure ExtraireDonneesRessourceJ2(Partie : String);                           //assigne les valeurs contenurs dans le fichier de sauvergarde dans les variables correspondantes au Joueur 2

var
   temp, strSave, adresseTxt : string;
   txtSaveFile : textFile;
   ileItt : iles;
   batItt : batiments;
   pos : integer;

begin
     pos := 13;
     adresseTxt := 'saves/multi/'+Partie+'/J2/save.txt';                         //lecture du fichier de sauvegarde
     AssignFile(txtSaveFile, adresseTxt);
     reset(txtSaveFile);
     readln(txtSaveFile, strSave);
     CloseFile(txtSaveFile);
     PersoJ2.nom := (ExtractDelimited(pnom,strSave,StdWordDelims));              //exctraction mot position 'pnom' vers variable nom
     //argent
     InvJ2.argent := StrToInt(ExtractDelimited(pargent,strSave,StdWordDelims));
     //tissu
     InvJ2.tissu := StrToInt(ExtractDelimited(ptissu,strSave,StdWordDelims));

     //bois
     InvJ2.bois := StrToInt(ExtractDelimited(pbois,strSave,StdWordDelims));

     //poisson
     InvJ2.poisson := StrToInt(ExtractDelimited(ppoisson,strSave,StdWordDelims));

     //laine
     InvJ2.laine := StrToInt(ExtractDelimited(plaine,strSave,StdWordDelims));

     //outils
     InvJ2.outils := StrToInt(ExtractDelimited(poutils,strSave,StdWordDelims));

     //Colon
     PopJ2.colon := StrToInt(ExtractDelimited(pcolon,strSave,StdWordDelims));

     //Citoyen
     PopJ2.citoyen := StrToInt(ExtractDelimited(pcitoyen,strSave,StdWordDelims));

     //Conscrit
     PopJ2.conscrit := StrToInt(ExtractDelimited(pconscrit,strSave,StdWordDelims));

     //Soldat
     PopJ2.soldat := StrToInt(ExtractDelimited(psoldat,strSave,StdWordDelims));

     //Fusilier
     PopJ2.fusilier := StrToInt(ExtractDelimited(pfusilier,strSave,StdWordDelims));

     for ileItt := DayfellCay to VolcanoIsland do                                //extraction des batiments sur chaque iles vers le tableau ileJ2
     begin
          for batItt := maison_colon to navire_transport do
          begin
          //batiments
          ileJ2[ileItt, batItt]  := StrToInt(ExtractDelimited(pos,strSave,StdWordDelims));

          pos := pos + 1
          end;
     end;

end;


end.

