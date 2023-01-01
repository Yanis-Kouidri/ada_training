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

        ajoute : boolean := false;
    begin
        if P_imin = 0 and P_imax = 0 then -- Cas ou le tableau est vide
            P_valeurs(1) := P_ajout;
            P_bool(1) := True;
            P_imin := 1;
            P_imax := 1;
            P_nb_elem := 1;
        else                               -- Cas ou l'on peut ajouter entre imin et imax
            for i in P_imin..P_imax loop
                if P_bool(i) = False and ajoute = False then
                    P_valeurs(i) := P_ajout;
                    P_bool(i) := True;
                    ajoute := True;
                    P_nb_elem := P_nb_elem + 1;
                end if;
            end loop;

            if ajoute = False then

                if P_imin > 1 then   -- Cas ou l'on peut ajouer en dessous de imin
                    P_valeurs(P_imin - 1) := P_ajout;
                    P_bool(P_imin - 1) := True;
                    P_imin := P_imin - 1;
                    P_nb_elem := P_nb_elem + 1;
                elsif P_imax < NMAX  then                -- Cas ou l'on peut ajouter au dessus de Imax
                    P_valeurs(P_imax + 1) := P_ajout;
                    P_bool(P_imax + 1) := True;
                    P_imax := P_imax + 1;
                    P_nb_elem := P_nb_elem + 1;
                else
                    Put_line("Ajout impossible, tableau plein");
                end if;
            end if;
        end if;

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
    --
    -- Paramètre : P_valeurs : valeurs entrée sortie ; Le tableau de valeur a modifier
    --             P_bool : bool entrée sortie ; Le tableau de boolean associé au tableau de valeur
    --             P_imin, P_imax : integer entrée ; Imin et imax associé au tableau de valeur
    --             P_supp : Entier entrée ; indice de la valeur a supprimer du tableau
    --             P_nb_elem : entier entrée sortie ; Nombre d'élement significatif du tableau
    --
    -- Préconditions : 
    --      Taille de P_bool et P_valeurs < à NMAX
    --      0 < P_imin <= P_imax <= NMAX
    --      0 < P_supp <= NMAX
    -- Post condition :
    --      Signification de la valeur passé à Faux si elle existe
    --      P_nb_elem mis à jour
    Procedure Suppression(P_valeurs : in out valeurs ; P_bool : in out bool; P_imin, P_imax, P_nb_elem : in out Integer ; P_supp : in integer) is

    begin
        P_bool(P_supp) := False; 

        if P_supp <= P_imax and P_supp >= P_imin then
            P_nb_elem := P_nb_elem - 1;
        end if;

        if P_supp = P_imax then
            P_imax := P_imax - 1;
        elsif P_supp = P_imin then
            P_imin := P_imin + 1;
        end if;
            
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
    --
    -- Paramètre : P_valeurs : valeurs entrée sortie; Le tableau de valeur a compacter.
    --             P_bool : bool entrée sortie; Le tableau de boolean associé au tableau de valeur
    --             P_imin : integer entrée ; Imin associé au tableau de valeur
    --             P_imax : integer entrée sortie; imax associé au tableau de valeur
    --             P_nb_elem : entier entrée ; Nombre d'élement significatif du tableau
    --
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

    Procedure Debug(P_imin, P_imax, P_nb_elem : in Integer) is
    begin
        put("Imin :");
        put(P_imin, 3);
        put("   Imax :");
        put(P_imax, 3);
        put("   Nb_val :");
        put(P_nb_elem, 3);
        new_line;
    end Debug;


    
    -- Déclaration de variables
    val1 : valeurs;
    bool1 : bool;
    imin1, imax1 : integer := 0;
    nb_val1 : integer := 0;
    
begin
    bool1(1) := False; -- Initialisation à faux de la première valeur
    
    ajout(val1, bool1, imin1, imax1, nb_val1, 1.0); -- Ajout de 1.0
    Debug(imin1, imax1, nb_val1);
    
    ajout(val1, bool1, imin1, imax1, nb_val1, 2.0); -- Ajout de 2.0
    Debug(imin1, imax1, nb_val1);
    
    ajout(val1, bool1, imin1, imax1, nb_val1, 3.0); -- Ajout de 3.0
    Debug(imin1, imax1, nb_val1);
    
    ajout(val1, bool1, imin1, imax1, nb_val1, 4.0); -- Ajout de 4.0
    Debug(imin1, imax1, nb_val1);
    
    ajout(val1, bool1, imin1, imax1, nb_val1, 5.0); -- Ajout de 5.0
    Debug(imin1, imax1, nb_val1);


    suppression(val1, bool1, imin1, imax1, nb_val1, 1); -- Supprimer 1er valeur
    Debug(imin1, imax1, nb_val1);

    suppression(val1, bool1, imin1, imax1, nb_val1, 3); -- Supprimer 3eme valeur
    Debug(imin1, imax1, nb_val1);

    suppression(val1, bool1, imin1, imax1, nb_val1, 5); -- Supprimer 5eme valeur
    Debug(imin1, imax1, nb_val1);


    ajout(val1, bool1, imin1, imax1, nb_val1, 2.5); -- Ajout de 2.5
    Debug(imin1, imax1, nb_val1);
    
    ajout(val1, bool1, imin1, imax1, nb_val1, 1.5); -- Ajout de 1.5
    Debug(imin1, imax1, nb_val1);
    
    ajout(val1, bool1, imin1, imax1, nb_val1, 4.0); -- Ajout de 4.0
    Debug(imin1, imax1, nb_val1);


    compactage(val1, bool1, imin1, nb_val1, imax1);
    Debug(imin1, imax1, nb_val1);
   

    Put("Recherche de 4.0 :");
    Put (recherche(val1, bool1, imin1, imax1, nb_val1, 4.0), 3); -- Recherche de 4.0
    new_line;
    Put("Recherche de 1.0 :");
    Put (recherche(val1, bool1, imin1, imax1, nb_val1, 1.0), 3); -- Recherche de 1.0
    new_line;


    suppression(val1, bool1, imin1, imax1, nb_val1, 3); -- Supprimer 3eme valeur
    Debug(imin1, imax1, nb_val1);

    suppression(val1, bool1, imin1, imax1, nb_val1, 4); -- Supprimer 4eme valeur
    Debug(imin1, imax1, nb_val1);

    Put("Recherche de 4.0 :");
    Put (recherche(val1, bool1, imin1, imax1, nb_val1, 4.0), 3); -- Recherche de 4.0
    new_line;

    compactage(val1, bool1, imin1, nb_val1, imax1);
    Debug(imin1, imax1, nb_val1);

end gestion_bitmap; 
