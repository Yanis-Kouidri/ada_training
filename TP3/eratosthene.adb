with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure eratosthene is
    NMAX : constant Integer := 1005; --indice maximum du tableau
    Type TAB_ENTIERS is Array(2..NMAX) of Integer;
    un_tab : TAB_ENTIERS; -- un tableau d'au maximum NMAX entiers
    n: Integer;
begin
    Put("Donner n : ");
    Get(n);
    new_line;
    for i in 2..n loop
        un_tab(i) := i;
    end loop;
    for i in 2..n loop
        if un_tab(i) /= 0 then
            Put_line(Integer'Image(un_tab(i)));
            for j in un_tab(i)+1..NMAX loop
                if (un_tab(j) mod un_tab(i)) = 0 then
                    un_tab(j) := 0;
                end if;
            end loop;
        end if;
    end loop;
end eratosthene; 
