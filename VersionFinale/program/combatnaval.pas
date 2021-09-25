unit CombatNaval;

{$codepage UTF8}

interface

uses
  Classes, SysUtils,Ressource;

type
  bateauExploration = (ExplorationI,ExplorationII,ExplorationIII,ExplorationIV);
  Partie = (MatI,VoileI,CoqueI);

  VieBateauExploration = array [bateauExploration,Partie] of integer;

  VieGlobal = array [1..5] of integer;

  type DegatSubit = record       //Record des dégats subits par les Navires d'Exploration en expédition
    BateauE1 : Integer;
    BateauE2 : Integer;
    BateauE3 : Integer;
    BateauE4 : Integer;
  end;

var
  VBE : VieBateauExploration;
  VG : VieGlobal;
  DSubit : DegatSubit;

procedure initialisationPV_BateauExploration();     //Initialisation des PV des Navires d'Exploration
procedure AttaqueNaval();                           //Procédure qui gére les potentielles attaques navales
procedure TestVieBateau;                            //Procédure qui va regarder si les navires d'exploration ont encore des PVs

implementation

procedure initialisationPV_BateauExploration();
var
  BE : bateauExploration;

begin
  for BE :=ExplorationI to ExplorationIV do
      begin
         VBE[BE,MatI]:= 4;
         VBE[BE,VoileI]:= 3;
         VBE[BE,CoqueI]:= 5;
      end;
  VG[1] := VBE[ExplorationI,MatI] +VBE[ExplorationI,VoileI]+VBE[ExplorationI,CoqueI];
  VG[2] := VBE[ExplorationII,MatI] +VBE[ExplorationII,VoileI]+VBE[ExplorationII,CoqueI];
  VG[3] := VBE[ExplorationIII,MatI] +VBE[ExplorationIII,VoileI]+VBE[ExplorationIII,CoqueI];
  VG[4] := VBE[ExplorationIV,MatI] +VBE[ExplorationIV,VoileI]+VBE[ExplorationIV,CoqueI];
  VG[5] := 12;
end;

procedure AttaqueNaval();
var
  n1,n2,n3,n4 : Integer;
  a1,a2,a3,a4 : Integer;

begin
  DSubit.BateauE1 := 0 ;
  DSubit.BateauE2 := 0;
  DSubit.BateauE3 := 0;
  DSubit.BateauE4 := 0;

  n1:=random(100);
  n2:=random(100);
  n3:=random(100);
  n4:=random(100);

  a1:=random(10);
  a2:=random(10);
  a3:=random(10);
  a4:=random(10);

  //Potentielle attaque naval sur le Navire d'Exploration N°1
  if (n1>0) AND (PF.FinExploration1 = False) AND (E.BateauExploration1 = True) then
     begin
          VG[1] := VG[1] - a1;
          DSubit.BateauE1 := a1;
     end;

  //Potentielle attaque naval sur le Navire d'Exploration N°2
  if (n2>85) AND (PF.FinExploration2 = False) AND (E.BateauExploration2 = True) then
     begin
          VG[2] := VG[2] - a2;
          DSubit.BateauE2 := a2;
     end;

  //Potentielle attaque naval sur le Navire d'Exploration N°3
  if (n3>85) AND (PF.FinExploration3 = False) AND (E.BateauExploration3 = True) then
     begin
          VG[3] := VG[3] - a3;
          DSubit.BateauE3 := a3;
     end;

  //Potentielle attaque naval sur le Navire d'Exploration N°4
  if (n4>85) AND (PF.FinExploration4 = False) AND (E.BateauExploration4 = True) then
     begin
          VG[4] := VG[4] - a4;
          DSubit.BateauE4 := a4;
     end;

end;

procedure TestVieBateau;
begin
  if VG[1]<=0 then
             begin
                  VG[1]:=VG[5];
                  E.BateauExploration1 := False;
                  setNavireExploration(getNavireExploration - 1);
                  Prog.Progression1 := 0;
             end;
  if VG[2]<=0 then
             begin
                  VG[2]:=VG[5];
                  E.BateauExploration2 := False;
                  setNavireExploration(getNavireExploration - 1);
                  Prog.Progression2 := 0;
             end;
  if VG[3]<=0 then
             begin
                  VG[3]:=VG[5];
                  E.BateauExploration3 := False;
                  setNavireExploration(getNavireExploration - 1);
                  Prog.Progression3 := 0;
             end;
  if VG[4]<=0 then
             begin
                  VG[4]:=VG[5];
                  E.BateauExploration4 := False;
                  setNavireExploration(getNavireExploration - 1);
                  Prog.Progression4 := 0;
             end;
end;

end.

