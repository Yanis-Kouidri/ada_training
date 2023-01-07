with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with liste_chainee; use liste_chainee;

procedure test_liste_entier is
    -- Déclaration de types
    

    -- Déclaration de procédures et fonctions
    
    
    -- Déclaration de variables
    ma_liste : T_liste_chainee;
begin
    put_line("Bienvenue dans le programme de test du paquetage list_chainee");
    put_line("list_chainee implémante une liste chainée d'entier avec diverses opérations définies dans le fichier source");


    put_line("Création d'une liste vide");
    ma_liste := creer_liste_vide;

    put_line("");
    put_line("Test de la fonction est_vide");
    if est_vide(ma_liste) then
        put_line("La liste est vide : Réussite");
    else
        put_line("Erreur");
    end if;

    put_line("Test de la procedure inserer_en_tete avec la valeur 111");
    inserer_en_tete(ma_liste, 111);
    put_line("Résultat :");
    afficher(ma_liste);

    put_line("Test des procedures inserer_avant et inserer_apres avec la valeur 17");
    inserer_avant(ma_liste, 111, 17);
    inserer_apres(ma_liste, 111, 17);
    put_line("Résultat :");
    afficher(ma_liste);





end test_liste_entier; 
