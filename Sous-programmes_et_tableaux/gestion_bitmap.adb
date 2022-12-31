with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure gestion_bitmap is
    -- Déclaration de types
    NMAX: constant integer := 10;
    type valeurs is array(1..NMAX) of Float;
    type bool is array(1..NMAX) of boolean; 
    

    -- Déclaration de procédures et fonctions
    
    -- Contrat :
    -- Nom : Ajout
    -- Sémantique : Ajoute une valeur si possible entre imin et imax, sinon en dessous, sinon au dessus.
    --              Si tableau plein affiche "Ajout impossible tableau plein"
    -- Paramètre : P_valeurs : valeurs entrée sortie ; Le tableau de valeur a modifier
    --             P_bool : bool entrée sortie ; Le tableau de boolean associé au tableau de valeur
    --             P_imin, P_imax : integer entrée ; Imin et imax associé au tableau de valeur
    --             P_nb_elem : entier entrée sortie ; Nombre d'élement significatif du tableau
    --             P_ajout : réel entrée ; Valeur a ajouter au tableau
    -- Préconditions : 
    --      Taille de P_bool et P_valeurs < à NMAX
    --      0 < P_imin <= P_imax <= NMAX
    -- Post condition :
    --      Valeur ajouté au tableau
    --      nb_elem incrémenté
    Procedure Ajout(P_valeurs : in out valeurs ; P_bool : in out bool; P_imin, P_imax, P_nb_elem : in out Integer ; P_ajout : in float) is

    begin
        null;
    end Ajout;


    -- Contrat :
    -- Nom : Recherche
    -- Sémantique : Recherche une valeur dans un talbeau de valeur en fonction d'un talbeau de boolean et de imin et imax.
    --              La recherche ne s'effectue que pour les valeur significativer, c-a-d comprise entre imin et imax et ayant un bool a true.
    --              Si la valeur n'est pas trouvé renvoie 0 sinon revoie l'indice de la valeur recherchée.
    --
    -- Paramètre : P_valeurs : valeurs entrée ; Le tableau de valeur ou effectuer la recherche
    --             P_bool : bool entrée ; Le tableau de boolean associé au tableau de valeur
    --             P_imin, P_imax : integer entrée ; Imin et imax associé au tableau de valeur
    --             P_recherche : réel entrée ; Valeur a rechercher dans le tableau au tableau
    --             P_nb_elem : entier entrée ; Nombre d'élements significatifs du tableau
    --            
    -- Préconditions : 
    --      Taille de P_bool et P_valeurs < à NMAX
    --      0 < P_imin <= P_imax <= NMAX
    -- Post condition :
    --      retourne 0 si valeur non trouvé
    --      retourne i, 0 < i <= NMAX si la valeur est trouvé. i étant l'indice de la valeur recherchée.
    Function Recherche(P_valeurs : in valeurs ; P_bool : in bool; P_imin, P_imax, P_nb_elem : in Integer ; P_recherche : in float) return integer is
    begin 
       return 0;
    end Recherche; 
    
    
    -- Contrat :
    -- Nom : Suppression
    -- Sémantique : Supprime une valeur du talbeau bitmap en changeant le boolean associé à FAUX.
    --              La valeur en elle même n'est pas supprimé.
    --              imin et imax seront ajusté si cela est possible.
    --              Si la valeur n'est pas dans le tableau alors rien ne se passe.
    -- Paramètre : P_valeurs : valeurs entrée sortie ; Le tableau de valeur a modifier
    --             P_bool : bool entrée sortie ; Le tableau de boolean associé au tableau de valeur
    --             P_imin, P_imax : integer entrée ; Imin et imax associé au tableau de valeur
    --             P_supp : réel entrée ; Valeur a supprimer au tableau
    --             P_nb_elem : entier entrée sortie ; Nombre d'élement significatif du tableau
    -- Préconditions : 
    --      Taille de P_bool et P_valeurs < à NMAX
    --      0 < P_imin <= P_imax <= NMAX
    -- Post condition :
    --      Signification de la valeur passé à Faux si elle existe
    --      P_nb_elem mis à jour
    Procedure Suppression(P_valeurs : in out valeurs ; P_bool : in out bool; P_imin, P_imax, P_nb_elem : in out Integer ; P_supp : in float) is

    begin
        null;
    end Suppression;


    -- Contrat :
    -- Nom : Affichage
    -- Sémantique : Affiche un tableau en 2 étapes :
    --              Dans un permier temps affiche le contenu des deux tableaux (booleens et valeurs) entre l’indice minimum et l’indice maximum.
    --              Puis :
    --              Affiche les valeurs significatives du tableau avec le nombre effectif de valeurs.
    --
    -- Paramètre : P_valeurs : valeurs entrée ; Le tableau de valeur a afficher.
    --             P_bool : bool entrée ; Le tableau de boolean associé au tableau de valeur
    --             P_imin, P_imax : integer entrée ; Imin et imax associé au tableau de valeur
    --             P_nb_elem : entier entrée ; Nombre d'élements significatifs du tableau
    --
    -- Préconditions : 
    --      Taille de P_bool et P_valeurs < à NMAX
    --      0 < P_imin <= P_imax <= NMAX
    -- Post condition :
    --
    Procedure Affichage(P_valeurs : in valeurs ; P_bool : in bool; P_imin, P_imax, P_nb_elem : in Integer) is

    begin
        null;
    end Affichage;
    

    -- Contrat :
    -- Nom : Compactage
    -- Sémantique : Compacte un tableau en ne laissant aucun trou entre imin et imax.
    --              Aucun trou veut dire qu'il n'y a aucune valeur a False entre imin et imax.
    --              Autrement dit aucun trou veut dire qu'il ny a que des true (vrai) entre imin et imax. (On atteint vite les limites du franglais)
    --              Le compactage se fait vers le haut donc imin ne bouge pas
    -- Paramètre : P_valeurs : valeurs entrée sortie; Le tableau de valeur a compacter.
    --             P_bool : bool entrée sortie; Le tableau de boolean associé au tableau de valeur
    --             P_imin : integer entrée ; Imin associé au tableau de valeur
    --             P_imax : integer entrée sortie; imax associé au tableau de valeur
    --             P_nb_elem : entier entrée ; Nombre d'élement significatif du tableau
    -- Préconditions : 
    --      Taille de P_bool et P_valeurs < à NMAX
    --      0 < P_imin <= P_imax <= NMAX
    -- Post condition :
    --      Tableau compacté == que des true entre imin' et imax'.
    --
    Procedure Compactage(P_valeurs : in out valeurs ; P_bool : in out bool; P_imin, P_nb_elem : in Integer ; P_imax : in out Integer) is

    begin
        null;
    end Compactage;
    
    -- Déclaration de variables
begin

    null;

end gestion_bitmap; 
