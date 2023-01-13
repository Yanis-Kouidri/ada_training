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
        <<VAL1>>
        begin
            get_line(commande, longueur);
            n := Integer'Value(commande(1..longueur));
            empiler(ma_pile, n);
        exception
            when CONSTRAINT_ERROR =>
                put_line("La valeur entrée doit être un entier");
                goto VAL1;
        end;

        <<VAL2>>
        begin
            get_line(commande, longueur);
            n := Integer'Value(commande(1..longueur));
            empiler(ma_pile, n);
        exception
            when CONSTRAINT_ERROR =>
                put_line("La valeur entrée doit être un entier");
                goto VAL2;
        end;
        
        <<OPP>>
        begin
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
        exception
            when OPE_ERR =>
                put_line("Opérateur saisi incorrect");
                put_line("Choix : [ + - * / ]");
                goto OPP;

        end;
        
    new_line;

    end loop;
    
    
end calculatrice; 
