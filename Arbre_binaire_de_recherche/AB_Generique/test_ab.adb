with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with AB;
PROCEDURE test_AB IS

    package P_AB_entier is new AB(T_Donnee => integer); use P_AB_entier;
    -- Déclaration de types

    

    -- Déclaration de procédures et fonctions
    Function est_inf_entier(elem1, elem2 : in Integer) return boolean is
    begin
        return elem1 < elem2;
    end est_inf_entier;

    Function est_sup_entier(elem1, elem2 : in Integer) return boolean is
    begin
        return elem1 > elem2;
    end est_sup_entier;

    Procedure afficher_entier(donnee: in Integer) is
    begin
        put(donnee);
    end afficher_entier;

    procedure inserer_entier is new P_ab_entier.inserer(est_inf => est_inf_entier, est_sup => est_sup_entier);
    procedure afficher_entier is new P_ab_entier.afficher(afficher_type => afficher_entier);
    function recherche_entier is new P_ab_entier.recherche(est_inf => est_inf_entier, est_sup => est_sup_entier);
    procedure supprimer_entier is new P_ab_entier.supprimer(est_inf => est_inf_entier, est_sup => est_sup_entier);
    
    
    -- Déclaration de variables

    mon_abr : P_AB_entier.T_AB;
BEGIN
    initialiser(mon_abr);

    IF est_vide(mon_abr) THEN
        put_line("OK");
    ELSE 
        put_line("KO");
    END IF;

    inserer_entier(mon_abr, 8);

    IF est_vide(mon_abr) THEN
        put_line("KO");
    ELSE 
        put_line("OK");
    END IF;

    inserer_entier(mon_abr, 5);
    inserer_entier(mon_abr, 2);
    inserer_entier(mon_abr, 9);
    inserer_entier(mon_abr, 73);

    afficher_entier(mon_abr);
    new_line;

    put_line("Nombre d'élément de l'arbre : " & Integer'Image(taille(mon_abr)));

    if recherche_entier(mon_abr, 2) then
        Put_line("OK");
    ELSE 
        put_line("KO");
    END IF;

    if not recherche_entier(mon_abr, 262) then
        Put_line("OK");
    ELSE 
        put_line("KO");
    END IF;

    supprimer_entier(mon_abr, 73);
    if not recherche_entier(mon_abr, 73) then
        Put_line("OK");
    ELSE 
        put_line("KO");
    END IF;


        

END test_AB; 
