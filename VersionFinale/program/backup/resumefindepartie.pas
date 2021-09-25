unit ResumeFinDePartie;
{$codepage utf8}

interface

uses
  Classes, SysUtils,GestionEcran,Ressource,Production,Population,CombatNaval;

procedure CadreFinDeTour;
procedure ShowMenuFinDeTour;
procedure RessourcePerdue;
procedure RessourceGagnee; // Le fonctionnement est le même pour l'ensemble des ressources, il suffit de changer les variables
procedure ResumeNaval;

implementation

procedure CadreFinDeTour;
var
  i:integer;
begin
     effacerEcran;
     dessinerCadreXY(80,2,120,6,Double,15,0);
     deplacerCurseurXY(96,4);
     write('Fin de Tour');
     deplacerCurseurXY(0,10);
     for i:=1 to 200 do
         write('-');
     deplacerCurseurXY(0,28);
     for i:=1 to 200 do
         write('-');
     deplacerCurseurXY(0,37);
     for i:=1 to 200 do
         write('-');

end;

procedure ResumeNaval;
begin

     couleurTexte(5);
     deplacerCurseurXY(5,30);
     write('Résumé de l',chr(39),'Etat de vos Navires d',chr(39),'Exploration :');

     deplacerCurseurXY(20,32);
     if (E.BateauExploration1=False) AND (PF.FinExploration1=False) then
         begin
             couleurTexte(11);
             write('Vous n',chr(39),'avez pas encore de Navire d',chr(39),'Exploration n°1.')
         end
     else if (E.BateauExploration1=True) AND (DSubit.BateauE1=0) AND (PF.FinExploration1=False) then
         begin
             couleurTexte(10);
             write('Votre Navire d',chr(39),'Exploration n°1 ne s',chr(39),'est pas fait attaquer.');
         end
     else if (E.BateauExploration1=True) AND (DSubit.BateauE1<>0) AND (PF.FinExploration1=False) AND (VG[1] >0) then
         begin
             couleurTexte(12);
             write('Votre Navire d',chr(39),'Exploration n°1 s',chr(39),'est fait attaquer ! Il a perdu ',DSubit.BateauE1,' PV !');
         end
    else if (E.BateauExploration1=True) AND (PF.FinExploration1=True) then
         begin
             couleurTexte(11);
             write('Votre Navire d',chr(39),'Exploration n°1 est arrivé sur une île ! Vous pouvez la conquérir !');
         end
    else if (E.BateauExploration1=True) AND (DSubit.BateauE1<>0) AND (PF.FinExploration1=False) AND (VG[1]<=0) then
         begin
             couleurTexte(4);
             write('Votre Navire d',chr(39),'Exploration n°1 s',chr(39),'est fait attaquer ! Il a coulé.');
         end;



     deplacerCurseurXY(20,33);
     if (E.BateauExploration2=False) AND (PF.FinExploration2=False)  then
         begin
             couleurTexte(11);
             write('Vous n',chr(39),'avez pas encore de Navire d',chr(39),'Exploration n°2.')
         end
     else if (E.BateauExploration2=True) AND (DSubit.BateauE2=0) AND (PF.FinExploration2=False) then
         begin
             couleurTexte(10);
             write('Votre Navire d',chr(39),'Exploration n°2 ne s',chr(39),'est pas fait attaquer.');
         end
     else if (E.BateauExploration2=True) AND (DSubit.BateauE2<>0) AND (PF.FinExploration2=False) AND (VG[2] >0) then
         begin
             couleurTexte(12);
             write('Votre Navire d',chr(39),'Exploration n°2 s',chr(39),'est fait attaquer ! Il a perdu ',DSubit.BateauE2,' PV !');
         end
     else if (E.BateauExploration2=True) AND (PF.FinExploration2=True) then
         begin
             couleurTexte(11);
             write('Votre Navire d',chr(39),'Exploration n°2 est arrivé sur une île ! Vous pouvez la conquérir !');
         end
     else if (E.BateauExploration2=True) AND (DSubit.BateauE2<>0) AND (PF.FinExploration2=False) AND (VG[2]<=0) then
         begin
             couleurTexte(4);
             write('Votre Navire d',chr(39),'Exploration n°2 s',chr(39),'est fait attaquer ! Il a coulé.');
         end;



     deplacerCurseurXY(20,34);
     if (E.BateauExploration3=False) AND (PF.FinExploration3=False)  then
         begin
             couleurTexte(11);
             write('Vous n',chr(39),'avez pas encore de Navire d',chr(39),'Exploration n°3.')
         end
     else if (E.BateauExploration3=True) AND (DSubit.BateauE3=0) AND (PF.FinExploration3=False) then
         begin
             couleurTexte(10);
             write('Votre Navire d',chr(39),'Exploration n°3 ne s',chr(39),'est pas fait attaquer.');
         end
     else if (E.BateauExploration3=True) AND (DSubit.BateauE3<>0) AND (PF.FinExploration3=False) AND (VG[3]>0) then
         begin
             couleurTexte(12);
             write('Votre Navire d',chr(39),'Exploration n°3 s',chr(39),'est fait attaquer ! Il a perdu ',DSubit.BateauE3,' PV !');
         end
     else if (E.BateauExploration3=True) AND (PF.FinExploration3=True) then
         begin
             couleurTexte(11);
             write('Votre Navire d',chr(39),'Exploration n°3 est arrivé sur une île ! Vous pouvez la conquérir !');
         end
     else if (E.BateauExploration3=True) AND (DSubit.BateauE3<>0) AND (PF.FinExploration3=False) AND (VG[3]<=0) then
         begin
             couleurTexte(4);
             write('Votre Navire d',chr(39),'Exploration n°3 s',chr(39),'est fait attaquer ! Il a coulé.');
         end;



     deplacerCurseurXY(20,35);
     if (E.BateauExploration4=False) AND (PF.FinExploration4=False)  then
         begin
             couleurTexte(11);
             write('Vous n',chr(39),'avez pas encore de Navire d',chr(39),'Exploration n°4.')
         end
     else if (E.BateauExploration4=True) AND (DSubit.BateauE4=0) AND (PF.FinExploration4=False) then
         begin
             couleurTexte(10);
             write('Votre Navire d',chr(39),'Exploration n°4 ne s',chr(39),'est pas fait attaquer.');
         end
     else if (E.BateauExploration4=True) AND (DSubit.BateauE4<>0) AND (PF.FinExploration4=False) AND (VG[4]>0) then
         begin
             couleurTexte(12);
             write('Votre Navire d',chr(39),'Exploration n°4 s',chr(39),'est fait attaquer ! Il a perdu ',DSubit.BateauE4,' PV !');
         end
     else if (E.BateauExploration4=True) AND (PF.FinExploration4=True) then
         begin
             couleurTexte(11);
             write('Votre Navire d',chr(39),'Exploration n°4 est arrivé sur une île ! Vous pouvez la conquérir !');
         end
     else if (E.BateauExploration4=True) AND (DSubit.BateauE4<>0) AND (PF.FinExploration4=False) AND (VG[4]<=0) then
         begin
             couleurTexte(4);
             write('Votre Navire d',chr(39),'Exploration n°4 s',chr(39),'est fait attaquer ! Il a coulé.');
         end;





end;

procedure RessourceGagnee; // Affiche les ressources gagnées à la fin d'une journée
begin
     couleurTexte(2);
     deplacerCurseurXY(5,20);
     write('Résumé des Ressources Gagnées :');

     //Cabane de pêcheur
     deplacerCurseurXY(20,22);
     if ((getTotal(cabanes_de_pecheur))=0) AND (getPoisson <> LimitR[getNiveauActuel,Rpoisson]) then // Affichage d'un message indiquant que le joueur ne possède pas de cabane si une de ces condtions est remplie
       begin
            couleurTexte(11);
            write('- Vous n',char(39),'avez pas encore de cabane de pêcheur.');

       end
     else if((getTotal(cabanes_de_pecheur))=1) AND (getPoisson <> LimitR[getNiveauActuel,Rpoisson]) then // Sinon si le joueur possède une cabane et qu'il n'a pas atteint la limite on affiche ce qu'il a gagné
       begin
          couleurTexte(10);
          write('- Votre cabane de pêcheur a produit ',getGainPoisson);
          if (getGainPoisson<=1) then // Gestion du pluriel en fonction du nombre de poisson gagné
             write(' poisson.')
          else
             write(' poissons');
       end

     else if((getTotal(cabanes_de_pecheur))>1) AND (getPoisson <> LimitR[getNiveauActuel,Rpoisson]) then // Gestion du pluriel pour les cabanes
       begin
           couleurTexte(10);
           write('- Vos ',(getTotal(cabanes_de_pecheur)),' cabanes de pêcheur ont produit ',getGainPoisson);
           if (getGainPoisson<=1) then
             write(' poisson.')
           else
             write(' poissons');
       end

     else if(getPoisson = LimitR[getNiveauActuel,Rpoisson]) then // Si le nombre de poisson atteint sa limite
       begin
          couleurTexte(13);
          write('- Vous avez atteint la limite maximale de stockage de poisson !'); // On affiche un message pour indiquer au joueur qu'il n'a rien gagné
       end;

     //Cabane de bûcheron
     couleurTexte(10);
     deplacerCurseurXY(20,23);
     if ((getTotal(cabanes_de_bucheron))=0) AND (getBois <> LimitR[getNiveauActuel,Rbois]) then
       begin
           couleurTexte(11);
           write('- Vous n',char(39),'avez pas encore de cabane de bûcheron.')
       end
     else if ((getTotal(cabanes_de_bucheron))=1) AND (getBois <> LimitR[getNiveauActuel,Rbois]) then
       begin
           couleurTexte(10);
           write('- Votre cabane de bûcheron a produit ',getGainBois,' de bois.');
       end
     else if ((getTotal(cabanes_de_bucheron))>1) AND (getBois <> LimitR[getNiveauActuel,Rbois]) then
       begin
           couleurTexte(10);
           write('- Vos ',(getTotal(cabanes_de_bucheron)),' cabanes de bûcheron ont produit ',getGainBois,' de bois.');
       end

     else if(getBois = LimitR[getNiveauActuel,Rbois]) then
       begin
          couleurTexte(13);
          write('- Vous avez atteint la limite maximale de stockage de bois !');
       end;


     //Bergeries
     couleurTexte(10);
     deplacerCurseurXY(20,24);
     if ((getTotal(bergeries))=0) AND (getLaine <> LimitR[getNiveauActuel,Rlaine])  then
       begin
           couleurTexte(11);
           write('- Vous n',char(39),'avez pas encore de bergerie.')
       end
     else if ((getTotal(bergeries))=1) AND (getLaine <> LimitR[getNiveauActuel,Rlaine]) then
      begin
           couleurTexte(10);
           write('- Votre bergerie a produit ',getGainLaine);
           if (getGainLaine<=1) then
             write(' laine.')
           else
             write(' laines.');
      end
     else if ((getTotal(bergeries))>1) AND (getLaine <> LimitR[getNiveauActuel,Rlaine]) then
       begin
           couleurTexte(10);
           write('- Vos ',(getTotal(bergeries)),' bergeries ont produit ',getGainLaine);
           if (getGainLaine<=1) then
             write(' laine.')
           else
             write(' laines.');
       end

     else if(getLaine = LimitR[getNiveauActuel,Rlaine]) then
       begin
          couleurTexte(13);
          write('- Vous avez atteint la limite maximale de stockage de laine !');
       end;


     //Tisserands
     couleurTexte(10);
     deplacerCurseurXY(20,25);
     if ((getTotal(ateliers_de_tisserands))=0) AND (getTissu <> LimitR[getNiveauActuel,Rtissu]) then
       begin
            couleurTexte(11);
            write('- Vous n',char(39),'avez pas encore d',char(39),'atelier de tisserand.')
       end
     else if ((getTotal(ateliers_de_tisserands))=1) AND (getTissu <> LimitR[getNiveauActuel,Rtissu]) then
       begin
            couleurTexte(10);
            write('- Votre atelier de tisserand a produit ',getGainTissu);
            if (getGainTissu<=1) then
             write(' tissu.')
           else
             write(' tissus.');
       end
     else if ((getTotal(ateliers_de_tisserands))>1) AND (getTissu <> LimitR[getNiveauActuel,Rtissu]) then
       begin
            couleurTexte(10);
            write('- Vos ',(getTotal(ateliers_de_tisserands)),' gateliers de tisserand ont produit ',getGainTissu);
            if (getGainTissu<=1) then
             write(' tissu.')
           else
             write(' tissus.');
       end

     else if(getTissu = LimitR[getNiveauActuel,Rtissu]) then
       begin
          couleurTexte(13);
          write('- Vous avez atteint la limite maximale de stockage de tissu !');
       end;


       //Armureries
     couleurTexte(10);
     deplacerCurseurXY(20,26);
     if (getTotal(armureries) =0) AND (getArmes <> LimitR[getNiveauActuel,Rarme]) then
       begin
            couleurTexte(11);
            write('- Vous n',char(39),'avez pas encore d',char(39),'armurerie.')
       end
     else if ((getTotal(armureries))=1) AND (getArmes <> LimitR[getNiveauActuel,Rarme]) then
       begin
            couleurTexte(10);
            write('- Votre armurerie a produit ',getGainArme);
            if (getGainArme<=1) then
             write(' arme.')
           else
             write(' armes.');
       end
     else if ((getTotal(armureries))>1) AND (getArmes <> LimitR[getNiveauActuel,Rarme]) then
       begin
            couleurTexte(10);
            write('- Vos ',(getTotal(armureries)),' armureries ont produit ',getGainArme);
            if (getGainArme<=1) then
             write(' arme.')
           else
             write(' armes.');
       end

     else if(getArmes = LimitR[getNiveauActuel,Rarme]) then
       begin
          couleurTexte(13);
          write('- Vous avez atteint la limite maximale de stockage d',chr(39),'arme !');
       end;

end;

procedure RessourcePerdue;
begin
     couleurTexte(4);
     deplacerCurseurXY(5,12);
     write('Résumé des Ressources Perdues :');

     //Colon
     deplacerCurseurXY(20,14);
     if (getColon=0) then
       begin
            couleurTexte(11);
            write('- Vous n',char(39),'avez pas encore de colon.');
       end
     else if (getColon=1) then
       begin
           couleurTexte(12);
           write('- Votre colon a consommé ',getColon);
           if (getColon<=1) then
             write(' poisson.')
           else
             write(' poissons.');
       end
     else
         begin
           couleurTexte(12);
           write('- Vos ',getColon,' colons ont consommés ',getColon);
           if (getColon<=1) then
             write(' poisson.')
           else
             write(' poissons.');
         end;

     //Citoyen
     deplacerCurseurXY(20,15);
     if (getCitoyen=0) then
        begin
             couleurTexte(11);
             write('- Vous n',char(39),'avez pas encore de citoyen.');
        end
     else if (getCitoyen=1) then
        begin
            couleurTexte(12);
            write('- Votre citoyen a consommé ',getCitoyen*2,' poissons.');
        end
     else
       begin
            couleurTexte(12);
            write('- Vos ',getCitoyen,' citoyens ont consommés ',getCitoyen*2,' poissons.');
       end;

     //Conscrit
     deplacerCurseurXY(20,16);
     if (getConscrit=0) then
        begin
             couleurTexte(11);
             write('- Vous n',char(39),'avez pas encore de conscrit.');
        end
     else if (getConscrit=1) then
        begin
            couleurTexte(12);
            write('- Votre conscrit a consommé ',getConscrit*2,' poissons.');
        end
     else
       begin
            couleurTexte(12);
            write('- Vos ',getConscrit,' conscrits ont consommés ',getConscrit*2,' poissons.');
       end;

     //Soldat
     deplacerCurseurXY(20,17);
     if (getSoldat=0) then
        begin
             couleurTexte(11);
             write('- Vous n',char(39),'avez pas encore de soldat.');
        end
     else if (getSoldat=1) then
        begin
            couleurTexte(12);
            write('- Votre soldat a consommé ',getSoldat*2,' poissons.');
        end
     else
       begin
            couleurTexte(12);
            write('- Vos ',getSoldat,' soldats ont consommés ',getSoldat*2,' poissons.');
       end;

     //Fusilier
     deplacerCurseurXY(20,18);
     if (getFusilier=0) then
        begin
             couleurTexte(11);
             write('- Vous n',char(39),'avez pas encore de fusilier.');
        end
     else if (getFusilier=1) then
        begin
            couleurTexte(12);
            write('- Votre fusilier a consommé ',getFusilier*2,' poissons.');
        end
     else
       begin
            couleurTexte(12);
            write('- Vos ',getFusilier,' fusiliers ont consommés ',getFusilier*2,' poissons.');
       end;
end;

procedure ShowMenuFinDeTour;
begin
     Prod_Globale;
     CadreFinDeTour;
     RessourcePerdue;
     RessourceGagnee;
     ResumeNaval;
     readln;
end;

end.

