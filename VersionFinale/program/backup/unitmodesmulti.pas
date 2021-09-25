unit unitModesMulti;                                                             //unite contenant les programmes principaux du mode multi
{$codepage utf8}

//Unité qui gère programmes principaux du mode multi

interface

uses
  classes, gestionecran, MenuNouvellePartie, MenuIle, Ressource,
  GestionBatiments, Marchant, AchatBatiments, Population, Production,
  ResumeFinDePartie, unitMultijoueur, menusMulti, Temps, Difficulte, GestionArmees,
  GestionNavires, CombatPirate, ileSuivante, reponseCommerce, AmeliorationBateau, CombatNaval;

procedure rejoindrePartie2J();                                                   //programme principal du joueur qui rejoint une partie multijoueur
procedure modePartie2J(nouvelle : boolean);                                      //programme principal du joueur qui commence une nouvelle partie en multijoueur

var
Jour :integer;
choix:integer;


implementation

const
    Joueur1 = 'J1';                                                              //Facilite la lecture de tout ce qui se rapporte aux joueurs dans la suite du programme
    Joueur2 = 'J2';
    PASSER_AU_TOUR_SUIVANT = 1;
    ALLER_SUR_L_ILE_SUIVANTE = 2;
    GERER_LES_BATIMENTS = 3;
    GERER_LES_NAVIRES = 4;
    GERER_LES_ARMEES = 5;
    ALLER_SUR_L_ILE_ADVERSE = 6;

procedure modePartie2J(nouvelle:boolean);                                                //Programme principale d'une nouvelle partie mode multijoueur du côté hébergeur
var
ileAct : iles;                                                                   //Variable indiquant l'ile sur laquelle se trouve le joueur
Partie : string;

begin
  //DemarrerHttpServeur();                                                       //Possibilité d'automatiser l'hegerbegement à l'aide d'un serveur apache portable (UwAmp)
  setQuitterlaPartie(False);                                                      //Initialisation indiquant que par défaut un joueur ne souhaite pas quitter la partie
  IP := 'localhost';
  Partie := '2';
  RemiseAZeroLocalPret(Partie, Joueur1);                                         //
  RemiseAZeroLocalPret(Partie, Joueur2);                                         //
  //if nouvelle then
  //begin
  NouvellePartie;                                                                //Permet d'entrer son pseudo                                                     //Remet à 0 les variables de population
  //end;
  nouvellePartie2J(IP, Partie);                                                  //Envoi du signal pret de la partie puis attend que l'autre joueur se connecte

  //if nouvelle then
  //begin
  Ra0Commerce(IP,Partie);                                                        //
  RemiseAZeroRessources(IP, Partie, Joueur1);                                    //Reset les données en prenant cette fois ci en compte le pseudo du joueur
  MiseAJourDonnees_verser(IP,Partie, Joueur1);                                   //Televerse la sauvegarde du joueur 1
  RemiseAZeroRessources(IP,Partie,Joueur1);                                      //Remises à zéro des fichier qui contenaient les données d'une précédente parti
  RemiseAZeroRessources(IP,Partie,Joueur2);                                      //
  choixNiveau();                                                                 //Affiche un menu permettant de choisir la difficultée
  initialisation_population;                                                     //Remet à 0 les variables de population
  initialisation_date();                                                         //Initialise la date au 1 janvier 1700
  initialisation_tour();                                                         //Initialise le premier tour
  initialisationIle(ileAct);                                                     //Défini "ileAct" comme la premiere ile "Dayfell Cay"
  initialisationAmeliorationBateaux();                                           //initialisation de toute les améliorations des bateaux
  initialisationPV_BateauExploration();                                          //initialisation des PV pour les bateaux d'Exploration

  //end;


  While (getQuitterlaPartie)=False do                                               //Tant qu'aucun joueur n'a décidé de quitter
        begin
             MiseAJourDonnees_verser(IP,Partie,Joueur1);                         //Televerse la sauvegarde du joueur 1
             if (getNvTour)=TRUE then                                                 //Si c'est un nouveau tour de jeu alors
                begin
                     DebutNouveauTour2J_S(IP,Partie);                                 //Telecharge les sauvegardes des joueurs
                     popUpCommerce(IP,Partie, Joueur1);                               //gestion du commerce (si un joueur a proposé un échange, c'est à ce moment que l'autre pourra décider d'accepter ou non)
                     Ra0Commerce(IP,Partie);                                          //Remise à 0 des données concernant le commerce
                     MiseAJourDonnees_verser(IP,Partie,Joueur1);                      //Téléverse la sauvegarde du joueur 1
                     setNvTour(FALSE);                                                   //Toutes les actions qui ne doivent être faites qu'au début d'un nouveau tour ont été faites donc : ce n'est plus un nouveau tour
                     ResetEchangePropose;                                             //remet à 0 une variable permettant de savoir si un joueur a déjà proposé un échange durant ce tour
                end;
             RemiseAZeroPret_S(IP,Partie);                                       //Indique que le joueur hébergeur n'est plus prêt à passer au tour suivant
             ShowMenuIleMulti(ileAct);                                           //Affiche le menu de l'ile (avec les options multijoueur)
              AfficherDate;                                                      //Affiche la date
              deplacerCurseurXY(10,4);
              CouleurTexte(15);                                                  //Affiche ne numéro du tour
              write('Jour n°',getTour);
                    repeat                                                        //Repeter en boucle tant que le choix ne correspond pas à un choix possible
                          deplacerCurseurXY(17,52);                               //Gestion de l'entrée choix du joueur
                          couleurTexte(15);                                                //
                          write('Quel est votre choix ?');                                 //
                          deplacerCurseurXY(41,52);                                        //
                          write('                   ');                                    //
                          deplacerCurseurXY(41,52);                                        //
                          readln(choix);                                                   //
                                                                                           //
                          if (choix<=0) or (choix>=6) then                                 //Vérifie qu'il correspond à une valeur possible
                             begin                                                                        //
                                  deplacerCurseurXY(17,57);                                               //
                                  couleurTexte(12);                                                       //Affiche un message d'erreur s'il ne correspond pas
                                  write('/!\');                                                           //
                                  couleurTexte(15);                                                       //
                                  write('Veuillez écrire un choix valide!');                              //

                             end;

                          case choix of
                              PASSER_AU_TOUR_SUIVANT : begin
                                                       TourSuivant;                                        //Incrémente le tour
                                                       DateSuivante;                                       //Incrémente la date
                                                       AttaqueNaval();                                     //Potentielle Attaque Naval sur vos Bateaux d'Exploration
                                                       ProgressionPlusUN;                                  //Avance tous les bateaux d'exploration à +1 Tour

                                                       setGainA0;                                          //Mettre les variables de gains (de production) à 0
                                                       Prod_Globale;                                       //Calcule la production de tous les batiments du joueur
                                                       SoustrairePoisson;                                  //calcul la consommation de poisson de la population
                                                       ConditionPirate;                                    //Gère l'évènement pirate
                                                       ShowMenuMarchant;                                   //Gère l'évènement marchand
                                                       ShowMenuFinDeTour;                                  //Affiche le réumé des ressources aquises et perdues durant ce tour
                                                       TestVieBateau;
                                                       setEtatEmbarcation(false) ;                          //Remettre l'Etat de l'embarcation à false
                                                       ContinuerOUQuitter_S(IP, Partie);                   //Propose au joueur de continuer ou quitter
                                                       end;

                              ALLER_SUR_L_ILE_SUIVANTE : ProchaineIle(ileAct);                 //Afficher le Menu Ile de l'ile suivante

                              GERER_LES_BATIMENTS : begin
                                                    if (getNbrIle=1) then                             //Si le nombre d'île découverte est égale à 1
                                                    ShowMenuBatiments(DayfellCay)                     //Afficher le Menu de Dayfell Cay car c'est la seule ile découverte  (ile de base)
                                                    else                                              //Sinon
                                                    ChoixGestionIle_RUSTINE;                          //Afficher le Menu de Gestion des Batiments en fonction de l'île selectionnée
                                                    end;

                              GERER_LES_NAVIRES : ShowMenuNavires;                                    //Afficher le menu de gestion de navires

                              GERER_LES_ARMEES : ShowMenuArmees;                                     //Affiche le menu de gestion des armées

                              ALLER_SUR_L_ILE_ADVERSE : begin
                                                        MiseAJourDonnees_charger(IP,Partie,Joueur2);        //Télécharge la sauvegarde du joueur 2
                                                        ShowMenuIleJ2(Partie, Joueur1);                             //Affiche le menu de l'ile du joueur 2 (vu du joueur 1)
                                                        end;
                          end;

                    until ((choix>0) AND (choix<7));                             //Repeter en boucle tant que le choix ne correspond pas à un choix possible
        end;
end;

procedure rejoindrePartie2J();                                                   //Programme principal du joueur rejoigant une partie multijoueur
var
ileAct : iles;                                                                   //Variable indiquant l'ile sur laquelle se trouve le joueur
Partie : string;
begin
     setQuitterlaPartie(False);                                                   //Initialisation indiquant que par défaut un joueur ne souhaite pas quitter la partie
     MenuNouvellePartieMulti_C;                                                  //Permet à l'utilisateur d'entrer son pseudo et l'IP à laquelle il souhaite se connecter
     Partie := '2';
     RemiseAZeroLocalPret(Partie, Joueur1);                                      //Reset des fichier locaux concernant le signal de départ du joueur 1
     RemiseAZeroLocalPret(Partie, Joueur2);                                      //Reset des fichier locaux concernant le signal de départ du joueur 2
     rejoindreServeur(IP, Partie, Joueur2);                                      //Envoi au serveur un signal de départ de l'utilisateur (joueur 2)
     choixNiveau();                                                              //Affiche un menu permettant de choisir la difficultée
     initialisation_population;                                                  //Remet à 0 les variables de population
     initialisation_date();                                                      //Initialise la date au 1 janvier 1700
     initialisation_tour();                                                      //Initialise le premier tour
     initialisationIle(ileAct);                                                  //Défini "ileAct" comme la premiere ile "Dayfell Cay"
     initialisationAmeliorationBateaux();                                        //initialisation de toute les améliorations des bateaux
     initialisationPV_BateauExploration();                                       //initialisation des PV pour les bateaux d'Exploration
     While getQuitterlaPartie=False do                                            //Tant qu'aucun joueur n'a décidé de quitter
           begin                                                                     //Televerse la sauvegarde du joueur 1
                MiseAJourDonnees_verser(IP,Partie,Joueur2);                          //Si c'est un nouveau tour de jeu alors
                if (getNvTour=TRUE) then
                   begin                                                                  //Telecharge les sauvegardes des joueurs
                        DebutNouveauTour2J_C(IP, Partie);                                 //Toutes les actions qui ne doivent être faites qu'au début d'un nouveau tour ont été faites donc : ce n'est plus un nouveau tour
                        setNvTour(FALSE);                                                    //gestion du commerce (si un joueur a proposé un échange, c'est à ce moment que l'autre pourra décider d'accepter ou non)
                        popUpCommerce(IP,Partie, Joueur2);                                   //Televerse la sauvegarde du joueur 2
                        MiseAJourDonnees_verser(IP,Partie,Joueur2);
                        ResetEchangePropose;
                   end;
                ShowMenuIleMulti(ileAct);                                            //Affiche le menu de l'ile (avec les options multijoueur)
                AfficherDate;                                                        //Affiche la date
                deplacerCurseurXY(10,4);                                             //Affiche ne numéro du tour
                CouleurTexte(15);
                write('Jour n°',getTour);
                repeat                                                               //Repeter en boucle tant que le choix ne correspond pas à un choix possible
                      deplacerCurseurXY(17,52);                                         //Gestion de l'entrée choix du joueur
                      couleurTexte(15);
                      write('Quel est votre choix ?');
                      deplacerCurseurXY(41,52);
                      write('                   ');
                      deplacerCurseurXY(41,52);
                      readln(choix);

                      if (choix<=0) or (choix>=6) then                                            //Vérifie qu'il correspond à une valeur possible
                         begin
                              deplacerCurseurXY(17,57);
                              couleurTexte(12);
                              write('/!\');
                              couleurTexte(15);
                              write('Veuillez écrire un choix valide!');                                    //Affiche un message d'erreur s'il ne correspond pas

                         end;
                      case choix of
                          PASSER_AU_TOUR_SUIVANT : begin
                                                   TourSuivant;                                        //Incrémente le tour
                                                   DateSuivante;                                       //Incrémente la date
                                                   AttaqueNaval();                                     //Potentielle Attaque Naval sur vos Bateaux d'Exploration
                                                   ProgressionPlusUN;                                  //Avance tous les bateaux d'exploration à +1 Tour

                                                   setGainA0;                                          //Mettre les variables de gains (de production) à 0
                                                   Prod_Globale;                                       //Calcule la production de tous les batiments du joueur
                                                   SoustrairePoisson;                                  //calcul la consommation de poisson de la population
                                                   ConditionPirate;                                    //Gère l'évènement pirate
                                                   ShowMenuMarchant;                                   //Gère l'évènement marchand
                                                   ShowMenuFinDeTour;                                  //Affiche le réumé des ressources aquises et perdues durant ce tour
                                                   TestVieBateau;
                                                   setEtatEmbarcation(false) ;                          //Remettre l'Etat de l'embarcation à false
                                                   ContinuerOUQuitter_J2(IP, Partie);                   //Propose au joueur de continuer ou quitter
                                                   end;

                          ALLER_SUR_L_ILE_SUIVANTE : ProchaineIle(ileAct);                                    //METTRE A JOUR AVEC LE PROGRAMME DE LUCAS

                          GERER_LES_BATIMENTS : begin
                                                    if (getNbrIle=1) then                             //Si le nombre d'île découverte est égale à 1
                                                    ShowMenuBatiments(DayfellCay)                     //Afficher le Menu de Dayfell Cay car c'est la seule ile découverte  (ile de base)
                                                    else                                              //Sinon
                                                    ChoixGestionIle_RUSTINE;                          //Afficher le Menu de Gestion des Batiments en fonction de l'île selectionnée
                                                end;

                          GERER_LES_NAVIRES : ShowMenuNavires;                            //METTRE A JOUR AVEC LE PROGRAMME DE LUCAS

                          GERER_LES_ARMEES : ShowMenuArmees;                                     //Affiche le menu de gestion des armées

                          ALLER_SUR_L_ILE_ADVERSE : begin
                                                    MiseAJourDonnees_charger(IP,Partie,Joueur1);        //Télécharge la sauvegarde du joueur 2
                                                    ShowMenuIleJ1(Partie, Joueur2);                             //Affiche le menu de l'ile du joueur 2 (vu du joueur 1)
                                                    end;
                      end;

                until ((choix>0) AND (choix<7));                                    //Repeter en boucle tant que le choix ne correspond pas à un choix possible
     end;

end;

end.

