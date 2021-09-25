{$codepage utf8}
program ProgrammePrincipal;
uses
    gestionecran, menuconnexion, MenuNouvellePartie, MenuIle, Ressource,
    GestionBatiments, GestionNavires, GestionArmees, Marchant, Population,
    Production, ResumeFinDePartie, Temps, Difficulte, unitModesMulti,
    CombatPirate, IleSuivante, AmeliorationBateau, CombatNaval;


var
  Tour:integer;
  choix:integer;
  ileAct : iles;



begin
  changertailleconsole(200,60);
  LogoBDV;                                            //Affichage du Logo de L'équipe
  PressEnter;                                         //Cadre indication "Appuyer sur Entre"
  readln;
  effacerEcran;
  dessinerCadreXY(0,0,198,58, double, 15, 0);         //Cadre Globale (Toute la fenêtre)
  Logo;                                               //Logo ANNO 1702

  //Interface graphique de choix
  deplacerCurseurXY(80,38);
  write('1) Nouvelle partie ');
  deplacerCurseurXY(80,39);
  write('2) Quitter');
  deplacerCurseurXY(80,40);
  write('3) Nouvelle partie Multi');
  deplacerCurseurXY(80,41);
  write('4) Rejoindre partie Multi');
  deplacerCurseurXY(80,43);
  write('Quel est votre choix ?');
  write('                    ');
  ileAct :=DayfellCay;                               //Initialisation de l'île du début à Dayfell Cay
  setNbrIle(1);
  repeat
    choix:=0;                                        //Initialisation de choix à 0
    deplacerCurseurXY(103,43);
    write('                    ');                   //Permet d'enlever le choix écrit avant
    deplacerCurseurXY(103,43);
    readln(choix);                                   //Lire choix
    if choix=1 then
        begin
          NouvellePartie;                            //Demande du pseudo pour la partie
          choixNiveau();                             //Choix de la difficulté (Facile,Normal,Difficile,Découverte)
          initialisation_population;                 //initialisation de la population en fonction de la difficulté
          initialisation_date();                     //initialisation de la date au "Lundi 1 Janvier 1702"
          initialisation_tour();                     //initialisation du Tour à 1
          initialisationExploration();               //initialisation des découvertes des Iles à FALSE pour toutes les îles sauf la 1ere (Dayfell Cay)
          initialisationIle(ileAct);                 //initialisation de l'île du début à Dayfell Cay
          initialisationAmeliorationBateaux();       //initialisation de toute les améliorations des bateaux
          initialisationPV_BateauExploration();      //initialisation des PV pour les bateaux d'Exploration
          initilisationLimite();                     //iniatialisation des Limites de Ressources
          while (Tour<10000) do                       //Nombre de tour limité à 10000
            begin
              ShowMenuIle(ileAct);                   //Afficher le Menu Ile
              AfficherDate;                          //Afficher la Date
              deplacerCurseurXY(10,4);
              CouleurTexte(15);
              write('Jour n°',getTour);              //Afficher le nombre de tour actuel
              repeat
                deplacerCurseurXY(17,52);
                couleurTexte(15);
                write('Quel est votre choix ?');
                deplacerCurseurXY(41,52);
                write('                   ');
                deplacerCurseurXY(41,52);
                readln(choix);

                if (choix<=0) or (choix>=6) then
                   begin
                      deplacerCurseurXY(17,57);
                      couleurTexte(12);
                      write('/!\');
                      couleurTexte(15);
                      write('Veuillez écrire un choix valide!');

                   end;
                if choix=1 then
                   begin
                        TourSuivant;                          //Avance de +1 Tour
                        DateSuivante;                         //Avance la date de +1 jour
                        AttaqueNaval();                       //Potentielle Attaque Naval sur vos Bateaux d'Exploration
                        ProgressionPlusUN;                    //Avance tous les bateaux d'exploration à +1 Tour

                        setGainA0;                            //Mettre les variables de gains (de production) à 0
                        Prod_Globale;                         //Additionner la prod. des industries
                        SoustrairePoisson;                    //Soustraire la quantité de poisson mangé par la population
                        ConditionPirate;                      //Combat aléatoire contre des Pirates
                        ShowMenuMarchant;                     //Rencontre aléatoire avec le marchant
                        ShowMenuFinDeTour;                    //Afficher Résumé de la partie (prod. + consommation de poisson)
                        TestVieBateau;
                        setEtatEmbarcation(false) ;           //Remettre l'Etat de l'embarcation à false
                   end;
                if choix=2 then
                   begin
                        ProchaineIle(ileAct);                 //Afficher le Menu Ile de l'ile suivante
                   end;
                if choix=3 then
                   begin
                        if (getNbrIle=1) then                 //Si le nombre d'île découverte est égale à 1
                          ShowMenuBatiments(DayfellCay)       //Afficher le Menu de Dayfell Cay car c'est la seule ile découverte  (ile de base)
                        else                                  //Sinon
                            ChoixGestionIle_RUSTINE;          //Afficher le Menu de Gestion des Batiments en fonction de l'île selectionnée
                   end;
                if choix=4 then
                   begin
                        ShowMenuNavires();                    //Afficher le Menu de Gestion des Navires
                   end;
                if choix=5 then
                   begin
                        ShowMenuArmees;                       //Afficher le Menu de Gestion de l'Armée
                   end;


              until ((choix>0) AND (choix<6));
            end;
        end;

    if (choix=2)  then               //Choix MenuConnexion
       begin
         Quitter;
       end;

    if choix=3 then                     //Choix MenuConnexion
    begin
         modePartie2J(TRUE);
    end;

    if choix=4 then                     //Choix MenuConnexion
    begin
         rejoindrePartie2J();
    end;


    if ((choix<1) AND (choix>4)) then
       begin
            deplacerCurseurXY(80,45);
            couleurTexte(12);
            write('/!\');
            couleurTexte(15);
            write('Veuillez écrire un choix valide!');
       end;


  until ((choix>=1) AND (choix<=4)) ;           //Repéter si le choix est <> de 1,2,3 ou 4
end.

