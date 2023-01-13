WITH Ada.Integer_Text_IO, Ada.Text_IO ;
USE Ada.Integer_Text_IO, Ada.Text_IO ;

PACKAGE AB IS
    
    TYPE T_AB IS LIMITED PRIVATE;

    -- Initialiser un AB Abr. L'AB est vide.
    PROCEDURE Initialiser(Abr : OUT T_AB);

    -- Est-ce qu'un AB Abr est vide ?
    FUNCTION Est_Vide (Abr : IN T_AB) RETURN boolean;

    -- Obtenir le nombre d'éléments d'un AB
    FUNCTION Taille (Abr : IN T_AB) RETURN Integer;

    -- Insérer la donnée dans l'AB Abr.
    PROCEDURE Inserer(Abr : IN OUT T_AB ; Donnee : IN Integer);

    -- Recherche dans l'AB Abr.
    FUNCTION Recherche(Abr : IN T_AB ; Donnee : IN Integer) RETURN boolean;

    -- Modifier la donnée dans l'AB Abr.
    PROCEDURE Modifier (Abr : IN OUT T_AB ; src_donnee : IN Integer ; tar_donnee : IN Integer);
    -- tar_donnee = target donnee = donnée ciblée (donnée qui va être remplacer par src_donnée)
    -- src_donnee = donnée source (donnée qui va remplacer tar_donné)

    -- Supprimer la donnée dans l'AB Abr.
    PROCEDURE Supprimer (Abr : IN OUT T_AB; donnee : IN Integer);

    -- Afficher un AB Abr
    PROCEDURE Afficher (Abr : IN T_AB);

PRIVATE
    TYPE T_Noeud;
    TYPE T_AB IS ACCESS T_Noeud;
    TYPE T_Noeud IS
        RECORD
            Donnee : Integer;
            Sous_Arbre_Gauche : T_AB;
            Sous_Arbre_Droit : T_AB;
        END RECORD;
END AB;
