WITH Ada.Integer_Text_IO, Ada.Text_IO ;
USE Ada.Integer_Text_IO, Ada.Text_IO ;

PACKAGE BODY pile_entier IS

    procedure initialiser(pile : in out T_pile) is 
    begin

        null;
    end initialiser;

    procedure empiler(pile : in out T_pile ; ajout : in Integer) is
    begin 
        null;

    end empiler;

    procedure depiler(pile : in out T_pile) is
    begin
        null;
    end depiler;

    function sommet(pile : in T_pile) return Integer is
    begin

        return pile.tab(taille);
    end sommet;



END pile_entier ;
