with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with AB; use AB;
PROCEDURE test_AB IS
    -- Déclaration de types
    

    -- Déclaration de procédures et fonctions

    -- Procedure de test pour debug
    PROCEDURE aff_vide(abr : IN T_AB) IS
    BEGIN

        IF est_vide(abr) THEN
            put_line("C'est vide");
        ELSE 
            put_line("Ce n'est pas vide");
        END IF;
    
    END aff_vide;
    
    
    -- Déclaration de variables

    mon_abr : T_AB;
BEGIN
    initialiser(mon_abr);

    IF est_vide(mon_abr) THEN
        put_line("OK");
    ELSE 
        put_line("KO");
    END IF;

    inserer(mon_abr, 8);

    IF est_vide(mon_abr) THEN
        put_line("KO");
    ELSE 
        put_line("OK");
    END IF;

    inserer(mon_abr, 1);
    inserer(mon_abr, 4444);
    inserer(mon_abr, 5);
    inserer(mon_abr, 7);
    inserer(mon_abr, 9);
    inserer(mon_abr, 8);

    afficher(mon_abr);
    new_line;

    IF recherche(mon_abr, 5) then
        put_line("OK");
    ELSE 
        put_line("KO");
    END IF;
    IF not recherche(mon_abr, 85) then
        put_line("OK");
    ELSE 
        put_line("KO");
    END IF;

    supprimer(mon_abr, 7);
    afficher(mon_abr);
    new_line;

    supprimer(mon_abr, 4444);
    afficher(mon_abr);
    new_line;

    supprimer(mon_abr, 1);
    afficher(mon_abr);
    new_line;

    supprimer(mon_abr, 156);
    afficher(mon_abr);
    new_line;

    inserer(mon_abr, 54);
    inserer(mon_abr, 90);
    inserer(mon_abr, 3);
    inserer(mon_abr, 16);
    inserer(mon_abr, 81);

    supprimer(mon_abr, 8);
    afficher(mon_abr);
    new_line;

--    modifier(mon_abr, 55, 9);
        

END test_AB; 
