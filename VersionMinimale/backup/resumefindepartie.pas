unit ResumeFinDePartie;
{$codepage utf8}

interface

uses
  Classes, SysUtils,GestionEcran,Ressource,Production,Population;

procedure CadreFinDeTour;
procedure ShowMenuFinDeTour;
procedure RessourcePerdue;
procedure RessourceGagnee;

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
     deplacerCurseurXY(0,24);
     for i:=1 to 200 do
         write('-');

end;

procedure RessourceGagnee;
begin
     couleurTexte(2);
     deplacerCurseurXY(5,17);
     write('Résumé des Ressources Gagnées :');

     //Cabane de pêcheur
     deplacerCurseurXY(20,19);
     if (getCabanesDePecheur=0) then
       begin
            couleurTexte(11);
            write('- Vous n',char(39),'avez pas encore de cabane de pêcheur.');

       end
     else if(getCabanesDePecheur=1) then
       begin
          couleurTexte(10);
          write('- Votre cabane de pêcheur a produit ',getGainPoisson);
          if (getGainPoisson<=1) then
             write(' poisson.')
          else
             write(' poissons');
       end

     else
       begin
           couleurTexte(10);
           write('- Vos ',getCabanesDePecheur,' cabanes de pêcheur ont produit ',getGainPoisson);
           if (getGainPoisson<=1) then
             write(' poisson.')
           else
             write(' poissons');
       end;

     //Cabane de bûcheron
     couleurTexte(10);
     deplacerCurseurXY(20,20);
     if (getCabanesDeBucheron=0) then
       begin
           couleurTexte(11);
           write('- Vous n',char(39),'avez pas encore de cabane de bûcheron.')
       end
     else if (getCabanesDeBucheron=1) then
       begin
           couleurTexte(10);
           write('- Votre cabane de bûcheron a produit ',getGainBois,' de bois.');
       end
     else
       begin
           couleurTexte(10);
           write('- Vos ',getCabanesDeBucheron,' cabanes de bûcheron ont produit ',getGainBois,' de bois.');
       end;

     //Bergeries
     couleurTexte(10);
     deplacerCurseurXY(20,21);
     if (getBergeries=0) then
       begin
           couleurTexte(11);
           write('- Vous n',char(39),'avez pas encore de bergerie.')
       end
     else if (getBergeries=1) then
      begin
           couleurTexte(10);
           write('- Votre bergerie a produit ',getGainBois);
           if (getGainLaine<=1) then
             write(' laine.')
           else
             write(' laines.');
      end
     else
       begin
           couleurTexte(10);
           write('- Vos ',getBergeries,' bergeries ont produit ',getGainLaine);
           if (getGainLaine<=1) then
             write(' laine.')
           else
             write(' laines.');
       end;

     //Tisserand
     couleurTexte(10);
     deplacerCurseurXY(20,22);
     if (getAtelierDeTisserands=0) then
       begin
            couleurTexte(11);
            write('- Vous n',char(39),'avez pas encore d',char(39),'atelier de tisserand.')
       end
     else if (getAtelierDeTisserands=1)  then
       begin
            couleurTexte(10);
            write('- Votre atelier de tisserand a produit ',getGainTissu);
            if (getGainTissu<=1) then
             write(' tissu.')
           else
             write(' tissus.');
       end
     else
       begin
            couleurTexte(10);
            write('- Vos ',getAtelierDeTisserands,' gateliers de tisserand ont produit ',getGainTissu);
            if (getGainTissu<=1) then
             write(' tissu.')
           else
             write(' tissus.');
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
end;

procedure ShowMenuFinDeTour;
begin
     CadreFinDeTour;
     RessourcePerdue;
     RessourceGagnee;
     readln;
end;

end.

