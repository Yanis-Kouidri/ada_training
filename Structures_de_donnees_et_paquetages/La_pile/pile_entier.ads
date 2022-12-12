WITH Ada.Integer_Text_IO, Ada.Text_IO ;
USE Ada.Integer_Text_IO, Ada.Text_IO ;

PACKAGE pile_entier IS
    TAILLE_MAX_ERROR : exception;
    TAILLE_MIN_ERROR : exception;
    
    TMAX : constant integer := 50;
    TYPE T_tab is array (1..TMAX) of integer;
    TYPE T_pile is 
        RECORD
            taille : Integer; --Taille de la pile (nombre d'élements)
            tab : T_tab; --La pile en elle même
        END RECORD;


    procedure empiler(pile : in out T_pile ; ajout : in Integer);

    procedure depiler(pile : in out T_pile);

    procedure initialiser(pile : in out T_pile);

    function sommet(pile : in T_pile) return Integer ;

END pile_entier;
