generic
    type Type_element is private;
    
PACKAGE P_liste_gen IS

    -- Déclaration des types :
    Type T_cellule is limited private;
    Type T_liste_chainee is limited private;

    -- Définiton des procédures et fonctions :

    procedure creer_liste_vide(list: in out T_liste_chainee); 

    function est_vide(list: in T_liste_chainee) return boolean;

    procedure inserer_en_tete(list : in out T_liste_chainee ; elem : in Type_element);

    procedure afficher(list : in T_liste_chainee);
    
    procedure rechercher(list : in T_liste_chainee ; elem : in Type_element ; retour : out T_liste_chainee);

    procedure inserer_apres(list : in T_liste_chainee; data, new_data : in Type_element);

    procedure inserer_avant(list : in out T_liste_chainee; data, new_data : in Type_element);

    procedure enlever(list : in out T_liste_chainee; a_enlever : in Type_element);

private
    -- Définition des types :
    Type T_liste_chainee is access T_cellule; -- Une liste chainée (pointeur sur cellule)

    Type T_cellule is
        Record
            Element : Type_element;
            Suivant : T_liste_chainee;
        End Record;


END P_liste_gen; 
