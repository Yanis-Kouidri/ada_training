with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with pile_entier; use pile_entier;
procedure test_pile is
    -- Déclaration de types
    

    -- Déclaration de procédures et fonctions
    
    
    -- Déclaration de variables

    ma_pile : T_pile;
begin
    initialiser(ma_pile);
    empiler(ma_pile, 5);
    empiler(ma_pile, 4);
    empiler(ma_pile, 3);
    empiler(ma_pile, 2);
    empiler(ma_pile, 1);

    put(sommet(ma_pile));
    depiler(ma_pile);

    put(sommet(ma_pile));
    depiler(ma_pile);

    put(sommet(ma_pile));
    depiler(ma_pile);

    put(sommet(ma_pile));
    depiler(ma_pile);
end test_pile; 
