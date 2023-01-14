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

    afficher(mon_abr);
    new_line;

    put_line("Suppression de 7");
    supprimer(mon_abr, 7);
    afficher(mon_abr);
    new_line;

    put_line("Suppression de 4444");
    supprimer(mon_abr, 4444);
    afficher(mon_abr);
    new_line;

    put_line("Suppression de 1");
    supprimer(mon_abr, 1);
    afficher(mon_abr);
    new_line;

    put_line("Suppression de 156");
    supprimer(mon_abr, 156);
    afficher(mon_abr);
    new_line;

    new_line;
    put_line("Ajout de valeurs dans l'arbre");
    inserer(mon_abr, 54);
    inserer(mon_abr, 90);
    inserer(mon_abr, 3);
    inserer(mon_abr, 16);
    inserer(mon_abr, 81);

    new_line;
    put_line("Suppression de 8");
    supprimer(mon_abr, 8);
    afficher(mon_abr);
    new_line;

    
    put_line("Modification de la valeur 9 par la valeur 55");
    modifier(mon_abr, 55, 9);

    afficher(mon_abr);
    new_line;

    modifier(mon_abr, 93, 777);
    
    new_line;
    afficher(mon_abr);
    new_line;

    put_line("Nombre d'éléments dans l'abre :");
    put(taille(mon_abr));
    new_line;

    supprimer(mon_abr, 54);
    supprimer(mon_abr, 55);

    new_line;
    afficher(mon_abr);
    new_line;

    put_line("Nombre d'éléments dans l'abre :");
    put(taille(mon_abr));
    new_line;

        

END test_AB; 
