with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure iteratif_au_recursif is
    -- Déclaration de types
    

    -- Déclaration de procédures et fonctions
    procedure affiche(m : in integer; n : in integer) is -- Fonction itérative donnée en énoncé 
    begin
        for a in 0..m loop
        -- afficher une ligne de nombres
            for b in 0.. n loop
            -- afficher un nombre
                put(10*a + b);
            end loop;
            new_line;
        end loop;
    end affiche;

    procedure affiche_rec(ligne, colone : in integer) is -- Meme fonction mais écrite de manière récursive
    begin
        if ligne >= 0 then
            affiche_rec(ligne - 1, colone);
            for b in 0..colone loop
            -- afficher un nombre
                put(10*ligne + b);
            end loop;
            new_line;
        end if;

    end affiche_rec;
    
    
    -- Déclaration de variables
begin
    Put_line("Itératif :");
    affiche(3,5);

    new_line;

    Put_line("Récursif :");
    affiche_rec(3,5);

end iteratif_au_recursif; 
