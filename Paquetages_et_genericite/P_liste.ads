PACKAGE P_liste IS

    -- Déclaration des types :
    Type T_cellule;

    -- Définition des types :
    Type T_liste_chainee is access T_cellule; -- Une liste chainée (pointeur sur cellule)

    Type T_cellule is
        Record
            Element : Integer;
            Suivant : T_liste_chainee;
        End Record;

    -- Définiton des procédures et fonctions :

    function creer_liste_vide return T_liste_chainee; 

    function est_vide(list: in T_liste_chainee) return boolean;

    procedure inserer_en_tete(list : in out T_liste_chainee ; elem : in integer);

    procedure afficher(list : in T_liste_chainee);
    
    function rechercher(list : in T_liste_chainee ; elem : in Integer) return T_liste_chainee;

    procedure inserer_apres(list : in T_liste_chainee; data, new_data : in Integer);

    procedure inserer_avant(list : in out T_liste_chainee; data, new_data : in Integer);

    procedure enlever(list : in out T_liste_chainee; a_enlever : in Integer);


END P_liste; 
