WITH Ada.Integer_Text_IO, Ada.Text_IO ;
USE Ada.Integer_Text_IO, Ada.Text_IO ;

PACKAGE BODY pile_entier IS

    procedure initialiser(pile : in out T_pile) is 
    begin
        pile.taille := 0;

    end initialiser;

    procedure empiler(pile : in out T_pile ; ajout : in Integer) is
    begin 
        if pile.taille < TMAX then
            pile.taille := pile.taille + 1;
            pile.tab(pile.taille) := ajout;
        else
            raise TAILLE_MAX_ERROR; 
            
        end if;
    exception
        when TAILLE_MAX_ERROR => Put_line("Impossible d'empiler, taille maximum atteinte");
    end empiler;

    procedure depiler(pile : in out T_pile) is
    begin
        if pile.taille > 0 then
            pile.taille := pile.taille - 1;
        else
            raise TAILLE_MIN_ERROR;
        end if;

    exception
        when TAILLE_MIN_ERROR => Put_line("Impossible de dépiler, taille minimum atteinte");
    end depiler;

    function sommet(pile : in T_pile) return Integer is
    begin

        return pile.tab(pile.taille);
    end sommet;



END pile_entier ;
