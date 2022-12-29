with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure manipulation_de_nb_pos_bin is
    -- Déclaration de types
    BIN_MAX : constant Integer := 7;
    TYPE BINAIRE is array(0..BIN_MAX) of integer;
    

    -- Déclaration de procédures et fonctions

    -- Contrat :
    --  Role : Affichage d'un nombre binaire à l'écran
    --  Paramètre :
    --      P_nb : Entrée BINAIRE
    --  Précondtion :
    --      P_nb est initialisé (les cases du tableau sont remplies)
    --  Postcondition :
    --      Rien
    Procedure Affichage(P_nb : in BINAIRE ) is
    begin
        for i in reverse 0..BIN_MAX loop
            put(P_nb(i), 0);
        end loop;
        new_line;
    end Affichage;

    -- Contrat :
    --  Role : Transformer un binaire en décimal
    --  Paramètre :
    --      F_bin : Entrée BINAIRE
    --  Précondtion :
    --      P_nb est initialisé (les cases du tableau sont remplies)
    --  Postcondition :
    --      Return est le nombre binaire converti en décimal
    Function to_base_10(F_bin : in BINAIRE) return integer is
        result : integer := 0;
    begin
        for i in 0..BIN_MAX loop
            result := result + F_bin(i)*2**i;
        end loop;
        return result;
    end to_base_10;

    -- Contrat :
    --  Role : Transformer un décimal en binaire
    --  Paramètre :
    --      F_int : Entrée Entier
    --  Précondtion :
    --      0 < F_int < 256 
    --  Postcondition :
    --      Return est le nombre entier converti en binaire
    Function to_base_2(F_int : in integer) return Binaire is
        res : BINAIRE;
        int : integer := F_int;
    begin
        for i in 0..BIN_MAX loop
           if (int mod 2) = 0 then
               res(i) := 0;
           else
               res(i) := 1;
           end if; 
           int := int / 2;
        end loop;
        return res;
    end to_base_2;

    -- Contrat :
    --  Role : Additioner deux nombre binaire
    --  Paramètre :
    --      F_bin1 : Entrée Binaire
    --      F_bin2 : Entrée Binaire
    --  Précondtion :
    --      F_bin1 et F_bin2 initialisés  
    --  Postcondition :
    --      Return est la somme des deux binaires passés en paramètre
    Function Addition(F_bin1, Fbin2 : in BINAIRE) return BINAIRE is
        res : binaire;      -- La somme
        c : integer := 0;   -- La retenue
    begin
        for i in 0..BIN_MAX loop
            res(i) := (F_bin1(i) + Fbin2(i) + c ) mod 2;
            if (F_bin1(i) + Fbin2(i) + c) > 1 then
                c := 1;
            else 
                c := 0;
            end if;

        end loop;

        return res; 
    end Addition;
    
    -- Déclaration de variables
    bin1, bin2, bin3 : BINAIRE;
    x : Integer;
begin
    put_line("Convertion de 200 en binaire :");
    bin1 := to_base_2(200);
    Affichage(bin1);

    put_line("Convertion du binaire en décimal :");
    x := to_base_10(bin1);
    put(x,0);
    new_line;

    bin2 := to_base_2(16);
    
    put_line("Addition de 16 et 200 en binaire : ");
    bin3 := Addition(bin1, bin2);
    affichage(bin3);

    bin1 := to_base_2(31);
    bin2 := to_base_2(63);
    affichage(Addition(bin1,bin2));


end manipulation_de_nb_pos_bin; 
