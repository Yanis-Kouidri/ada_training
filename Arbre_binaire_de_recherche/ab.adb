WITH Ada.Integer_Text_IO, Ada.Text_IO ;
USE Ada.Integer_Text_IO, Ada.Text_IO ;

PACKAGE BODY AB IS

    -- Initialiser un AB Abr. L'AB est vide.
    procedure Initialiser(Abr : out T_AB) is
    begin
        abr := null;

    end Initialiser;

    -- Est-ce qu'un AB Abr est vide ?
    function Est_Vide (Abr : in T_AB) return boolean is
    begin
        return abr = null;
    end Est_Vide;

    -- Obtenir le nombre d'éléments d'un AB
    function Taille (Abr : in T_AB) return Integer is
    begin
        if Abr.all.Sous_Arbre_Gauche /= null then
            return 1 + Taille(Abr.all.Sous_Arbre_Gauche); 
        elsif Abr.all.Sous_Arbre_Droit /= null then
            return 1 + Taille(Abr.all.Sous_Arbre_Droit); 
        else
            return 0;
        end if;

    end Taille;

    -- Insérer la donnée dans l'AB Abr.
    procedure Inserer(Abr : in out T_AB ; Donnee : in Integer) is
        
    begin

        if Abr = null then
            Abr := new T_Noeud;
            Abr.all.Donnee := Donnee;
            Abr.sous_arbre_gauche := null;
            Abr.sous_arbre_droit := null;
        elsif abr.all.donnee > Donnee then

        end if;

    end Inserer;

    -- Recherche dans l'AB Abr.
    function Recherche(Abr : in T_AB ; Donnee : in Integer) return boolean is
    begin
        return false;

    end Recherche;

    -- Modifier la donnée dans l'AB Abr.
    -- tar_donnee = target donnee = donnée ciblée (donnée qui va être remplacer par src_donnée)
    -- src_donnee = donnée source (donnée qui va remplacer tar_donné)
    procedure Modifier (Abr : in out T_AB ; src_donnee : in Integer ; tar_donnee : in Integer) is
    begin

        null;
    end Modifier;

    -- Supprimer la donnée dans l'AB Abr.
    procedure Supprimer (Abr : in out T_AB; donnee : in Integer) is 
    begin
        null;

    end Supprimer;

    -- Afficher un AB Abr
    procedure Afficher (Abr : in T_AB) is
    begin
        null;

    end Afficher;



END AB ;
