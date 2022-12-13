with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with AB; use AB;
procedure test_AB is
    -- Déclaration de types
    

    -- Déclaration de procédures et fonctions

    procedure aff_vide(abr : in T_AB) is
    begin

        if est_vide(abr) then
            put_line("C'est vide");
        else 
            put_line("Ce n'est pas vide");
        end if;
    
    end aff_vide;
    
    
    -- Déclaration de variables

    mon_abr : T_AB;
begin
    initialiser(mon_abr);
    aff_vide(mon_abr);

    inserer(mon_abr, 8);

    aff_vide(mon_abr);

end test_AB; 
