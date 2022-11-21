-- Raffinage :
-- R0 : Jouer au jeu du devin avec l'utilisateur
--
-- R1 : Comment R0 ?
--      A11 Générer un nombre aléatoire entre 1 et 100 (nb_tire : out)
--      A12 Faire deviner le nombre tiré
--      A13 Afficher le nombre de tentative de l'utilisateur 

-- R2 : Comment A11 ?
--      nb_tire = alea_1_100 

-- R2 : Comment A12 ?
--      Répéter
--          A21 Demander à l'utilisateur de faire une tentative
--          A22 Compter le nombre de tentative
--          A23 Indiquer à l'utilisateur s'il a bon, ou s'il est au dessus ou en dessous  
--      JusquA tentative = nb_tire
--
-- R2 : Comment A13 ?
--      Afficher(" Vous avez trouvé en : " nb_tentative) (nb_tentative : in)
--
-- R3 : Comment A21 ?
--      Afficher("A quel nombre je pense ?")
--      Lire(tentative) (tentative : out)
--
-- R3 : Comment A22 ?
--      nb_tentative = nb_tentative + 1
--
-- R3 : Comment A23 ?
--      Si tentative != nbtire alors
--          Si tentative > nbtire alors
--              Afficher("c'est moins")
--          Sinon 
--              Afficher("c'est plus")
--          Fin Si
--      Sinon
--          Rien
--      Fin Si
--
--
--          
--      

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Alea; use Alea;
procedure devin1 is
    nb_tire: Integer;
    nb_tentative: Integer;
    tentative: Integer;
begin
    nb_tentative := 0;
    nb_tire := Alea_1_100;
    
    loop

        Put_line("A quel nombre je pense ? Votre tentative : ");
        Get(tentative);
        nb_tentative := nb_tentative + 1; 
        if tentative /= nb_tire then
            if tentative > nb_tire then
                Put_line("C'est moins");
            else
                Put_line("C'est plus");
            end if;
        else
            put_line("Trouvé !");
        end if;

    exit when tentative = nb_tire;
    end loop;

    put_line("Vous avez fait : " & Integer'Image(nb_tentative) & " tentatives !");

end devin1; 
