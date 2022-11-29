with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure recursivite_tab is
    NMAX: constant Integer := 100;
    Type TAB_ENTIERS is Array(1..NMAX) of Integer;
    un_tab : TAB_ENTIERS; -- un tableau d'au maximum NMAX entiers
    nb_elements : Integer := 10; -- le nombre effectif d'éléments (<= NMAX) de un_tab
    ind : Integer;
    look_valeur : Integer;


    procedure affiche_tab( tab : in TAB_ENTIERS; index : in Integer; nbr_elements: in Integer) is
    begin
       if index <= nbr_elements then
           put(Integer'Image(tab(index)));
           affiche_tab(tab, index+1, nbr_elements);
       end if;  
    end affiche_tab; 


    procedure affiche_tab_reverse( tab : in TAB_ENTIERS; taille : in Integer) is
    begin
       if 0 < taille then
           put(Integer'Image(tab(taille)));
           affiche_tab_reverse(tab, taille-1);
       end if;  
    end affiche_tab_reverse; 


    function calcul_indice (tab : in TAB_ENTIERS; index : in Integer; nbr_elements : in Integer; valeur : in Integer) return Integer is
    begin
        if tab(index) = valeur then
            return index;
        else
            if index < nbr_elements then
                return calcul_indice( tab, index + 1, nbr_elements, valeur);
            else
                return 0;
            end if;
        end if;

    end calcul_indice;

begin
    
    for n in 1..nb_elements loop
        un_tab(n) := n+1;
    end loop;

    affiche_tab(un_tab, 1, nb_elements); 
    new_line;
    affiche_tab_reverse(un_tab, nb_elements); 
    new_line;

    Put_line("Quelle valeur cherchez vous ?");
    get(look_valeur);
    ind := calcul_indice(un_tab, 1, nb_elements, look_valeur);
    put_line("L'indice de la valeur cherchée est : " & Integer'Image(ind));

end recursivite_tab; 
