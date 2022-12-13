with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with pile_entier; use pile_entier;

procedure calculatrice is
    -- Déclaration de types
    

    -- Déclaration de procédures et fonctions
    
    
    -- Déclaration de variables
    OPE_ERR : exception;
    commande : STRING(1..10);  --nombre, opération
    longueur : Integer;
    n: Integer;
    res : Integer;

    ma_pile : T_pile;
begin
    initialiser(ma_pile);

    put_line("Bienvenue dans la calculatrice !");

    while true loop
        get_line(commande, longueur);
        n := Integer'Value(commande(1..longueur));
        empiler(ma_pile, n);

        get_line(commande, longueur);
        n := Integer'Value(commande(1..longueur));
        empiler(ma_pile, n);
        
        get_line(commande, longueur);

        case commande(1) is
            when '+' =>
                res := sommet(ma_pile);
                depiler(ma_pile);
                res := sommet(ma_pile) + res;
                empiler(ma_pile, res);
                put(sommet(ma_pile));
            when '-' =>
                res := sommet(ma_pile);
                depiler(ma_pile);
                res := sommet(ma_pile) - res;
                empiler(ma_pile, res);
                put(sommet(ma_pile));
            when '*' =>
                res := sommet(ma_pile);
                depiler(ma_pile);
                res := sommet(ma_pile) * res ; 
                empiler(ma_pile, res);
                put(sommet(ma_pile));
            when '/' =>
                res := sommet(ma_pile);
                depiler(ma_pile);
                res := sommet(ma_pile) / res;
                empiler(ma_pile, res);
                put(sommet(ma_pile));
            when others => raise OPE_ERR;

        end case;
        
    new_line;

    end loop;
    
exception
    when OPE_ERR => put_line("Opérateur saisi incorrect");
    
end calculatrice; 
