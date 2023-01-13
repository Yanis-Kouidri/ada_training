WITH Ada.Integer_Text_IO, Ada.Text_IO ;
USE Ada.Integer_Text_IO, Ada.Text_IO ;

PACKAGE BODY AB IS

    -- Initialiser un AB Abr. L'AB est vide.
    PROCEDURE Initialiser(Abr : OUT T_AB) IS
    BEGIN
        abr := NULL;

    END Initialiser;

    -- Est-ce qu'un AB Abr est vide ?
    FUNCTION Est_Vide (Abr : IN T_AB) return boolean IS
    BEGIN
        return abr = NULL;
    END Est_Vide;

    -- Obtenir le nombre d'éléments d'un AB
    FUNCTION Taille (Abr : IN T_AB) return Integer IS
    BEGIN
        IF Abr.all.Sous_Arbre_Gauche /= NULL THEN
            return 1 + Taille(Abr.all.Sous_Arbre_Gauche); 
        ELSIF Abr.all.Sous_Arbre_Droit /= NULL THEN
            return 1 + Taille(Abr.all.Sous_Arbre_Droit); 
        ELSE
            return 0;
        END if;

    END Taille;

    -- Insérer la donnée dans l'AB Abr.
    PROCEDURE Inserer(Abr : IN OUT T_AB ; Donnee : IN Integer) IS
        
    BEGIN

        -- Cas ou on atteint une feuille de l'arbre : c'est qu'on a trouvé l'endroit ou insérer la valeur
        IF Abr = NULL THEN
            Abr := new T_Noeud;
            Abr.all.Donnee := Donnee;
            Abr.sous_arbre_gauche := NULL;
            Abr.sous_arbre_droit := NULL;

        -- Dans le cas ou notre valeur a ajouter est plus petite que celle courante alors il faut aller à gauche 
        ELSIF Donnee < abr.all.donnee  THEN
            Inserer( abr.all.sous_arbre_gauche, Donnee);

        -- Dans le cas ou notre valeur a ajouter est plus grande que celle courante alors il faut aller à droite 
        ELSIF Donnee > abr.all.donnee THEN
            Inserer( abr.all.sous_arbre_droit, Donnee);
        ELSE 
            put_line("Donnée déjà présente");

        END IF;

    END Inserer;

    -- Recherche dans l'AB Abr.
    FUNCTION Recherche(Abr : IN T_AB ; Donnee : IN Integer) return boolean IS
    BEGIN

        IF abr = null then
            return false;
        ELSIF Donnee < abr.all.donnee then
            return recherche(abr.all.sous_arbre_gauche, donnee);
        elsif Donnee > abr.all.donnee then
            return recherche(abr.all.sous_arbre_droit, donnee);
        elsif Donnee = abr.all.donnee then
            return true;
        else
            return false;
        end if;


    END Recherche;

    -- Modifier la donnée dans l'AB Abr.
    -- tar_donnee = target donnee = donnée ciblée (donnée qui va être remplacer par src_donnée)
    -- src_donnee = donnée source (donnée qui va remplacer tar_donné)
    PROCEDURE Modifier (Abr : IN OUT T_AB ; src_donnee : IN Integer ; tar_donnee : IN Integer) IS
    BEGIN

        NULL;
    END Modifier;

    -- Supprimer la donnée dans l'AB Abr.
    PROCEDURE Supprimer (Abr : IN OUT T_AB; donnee : IN Integer) IS 
    BEGIN
        NULL;

    END Supprimer;

    -- Afficher un AB Abr
    PROCEDURE Afficher (Abr : IN T_AB) IS
    BEGIN
        NULL;

    END Afficher;



END AB ;
