PACKAGE liste_doublement_chainee IS
    
    TYPE T_noeud;

    TYPE T_liste is ACCESS T_noeud; -- Pointeur sur noeud
    TYPE T_noeud is 
        RECORD
            precedent: T_liste;
            element: Integer;
            suivant: T_liste;
        END RECORD;

    Function creation return T_liste;
    -- Sémantique: Créer une liste vide
    -- Paramètres : aucun
    -- type-retour : T_liste
    -- pré-condition : aucune
    -- post-condtion : liste créée vide
    -- exception : aucune

    Procedure ajout( liste : in out T_liste ; elem : in Integer); 
    -- Sémantique : Ajouter un noeud dans la liste chainée et faire pointer le liste vers ce nouveau noeud.
    -- Paramètres : liste : in out type T_liste
    -- Pré-condition : aucune
    -- Post-condition : liste pointe sur le nouveau noeud
    -- exception : aucune

    Procedure suppression(liste : in out T_liste);
    -- Sémantique : Suppression de le noeud courant dans la liste chainée et faire pointer le liste vers le noeud précédent ou suivant ou null si aucun des deux.
    -- Paramètres : liste : in out type T_liste
    -- Pré-condition : aucune
    -- Post-condition : noeud courant supprimé
    -- liste pointe vers le noeud précédent ou suivant ou null
    -- exception : aucune

    Procedure recherche(liste : in out T_liste);
    -- Sémantique : recherche un noeud dans la liste chainée et fait pointer la liste vers ce nouveau noeud.
    -- Paramètres : liste : in out type T_liste
    -- Pré-condition : aucune
    -- Post-condition : liste pointe sur le noeud recherché s'il existe, sinon reste inchangé.
    -- exception : aucune

    Procedure affichage(liste : in T_liste);
    -- Sémantique : Affiche tous les éléments de la liste sans changé l'élément pointé
    -- Paramètres : liste : in type T_liste
    -- Pré-condition : aucune
    -- Post-condition : aucune
    -- exception : aucune



END liste_doublement_chainee;
