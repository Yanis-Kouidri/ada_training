WITH Ada.Integer_Text_IO, Ada.Text_IO ;
USE Ada.Integer_Text_IO, Ada.Text_IO ;

PACKAGE AB IS
    
    type T_AB is limited private;

    -- Initialiser un AB Abr. L'AB est vide.
    procedure Initialiser(Abr : out T_AB);

    -- Est-ce qu'un AB Abr est vide ?
    function Est_Vide (Abr : in T_AB) return boolean;

    -- Obtenir le nombre d'éléments d'un AB
    function Taille (Abr : in T_AB) return Integer;

    -- Insérer la donnée dans l'AB Abr.
    procedure Inserer(Abr : in out T_AB ; Donnee : in Integer);

    -- Recherche dans l'AB Abr.
    function Recherche(Abr : in T_AB ; Donnee : in Integer) return boolean;

    -- Modifier la donnée dans l'AB Abr.
    procedure Modifier (Abr : in out T_AB ; src_donnee : in Integer ; tar_donnee : in Integer);
    -- tar_donnee = target donnee = donnée ciblée (donnée qui va être remplacer par src_donnée)
    -- src_donnee = donnée source (donnée qui va remplacer tar_donné)

    -- Supprimer la donnée dans l'AB Abr.
    procedure Supprimer (Abr : in out T_AB; donnee : in Integer);

    -- Afficher un AB Abr
    procedure Afficher (Abr : in T_AB);

private
    type T_Noeud;
    type T_AB is access T_Noeud;
    type T_Noeud is
        record
            Donnee : Integer;
            Sous_Arbre_Gauche : T_AB;
            Sous_Arbre_Droit : T_AB;
        end record;
END AB;
