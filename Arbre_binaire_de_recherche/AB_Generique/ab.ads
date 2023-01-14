GENERIC
    TYPE T_donnee is private;
PACKAGE AB IS
    
    TYPE T_AB IS LIMITED PRIVATE;
    TYPE T_Noeud IS LIMITED PRIVATE;

    -- Initialiser un AB Abr. L'AB est vide.
    PROCEDURE Initialiser(Abr : OUT T_AB);

    -- Est-ce qu'un AB Abr est vide ?
    FUNCTION Est_Vide (Abr : IN T_AB) RETURN boolean;

    -- Obtenir le nombre d'éléments d'un AB
    FUNCTION Taille (Abr : IN T_AB) RETURN integer;


    generic
        with function est_inf (elem1, elem2 : in T_donnee) return boolean;
        with function est_sup (elem1, elem2 : in T_donnee) return boolean;
    procedure Inserer (abr : in out T_AB ; Donnee : IN T_donnee);

    Generic
        with procedure afficher_type (donnee : in T_donnee);
    procedure Afficher (abr : IN T_AB);

    Generic
        with function est_inf (elem1, elem2 : in T_donnee) return boolean;
        with function est_sup (elem1, elem2 : in T_donnee) return boolean;
    FUNCTION Recherche(Abr : IN T_AB ; Donnee : IN T_donnee) return boolean;

    --PROCEDURE Modifier (Abr : IN OUT T_AB ; src_donnee, tar_donnee : IN T_donnee);

    Generic
        with function est_inf (elem1, elem2 : in T_donnee) return boolean;
        with function est_sup (elem1, elem2 : in T_donnee) return boolean;
    PROCEDURE Supprimer (Abr : IN OUT T_AB; donnee : IN T_donnee);

PRIVATE
    TYPE T_AB IS ACCESS T_Noeud;
    TYPE T_Noeud IS
        RECORD
            Donnee : T_donnee;
            Sous_Arbre_Gauche : T_AB;
            Sous_Arbre_Droit : T_AB;
        END RECORD;
END AB;
