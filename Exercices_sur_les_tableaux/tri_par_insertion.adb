with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
procedure tri_par_insertion is
    NMAX : constant Integer := 11; --indice maximum du tableau
    Type TAB_ENTIERS is Array(1..NMAX) of Integer;
    un_tab : TAB_ENTIERS; -- un tableau d'au maximum NMAX entiers
    buffer: Integer := 0;
begin
    un_tab := (1,18,74,8,2,90,35,4, 345, 4, 5); --Tableau quelconque non trié
    put_line("Tableau non trié :");
    for i in 1..NMAX loop -- Affichage du tableau non trié :
        put(un_tab(i));
    end loop;
    
    for i in 1..NMAX-1 loop -- Tri du tableau par insertion
        for j in 1..i loop

            if un_tab(j) > un_tab(i+1) then
                buffer := un_tab(j);
                un_tab(j) := un_tab(i+1);
                un_tab(i+1) := buffer;
            end if;

        end loop;
    end loop;
    
    new_line;

    put_line("Tableau trié :");
    for i in 1..NMAX loop -- Affichage du tableau trié
        put(un_tab(i));
    end loop;

end tri_par_insertion; 
