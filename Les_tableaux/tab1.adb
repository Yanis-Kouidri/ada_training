with Ada.Text_IO; use Ada.Text_IO;
-- with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure tab1 is
    NMAX : constant Integer := 5; --indice maximum du tableau
    Type TAB_ENTIERS is Array(1..NMAX) of Integer;
    un_tab : TAB_ENTIERS; -- un tableau d'au maximum NMAX entiers
    -- nb_elements : Integer; -- le nombre effectif d'éléments (<= NMAX) de un_tab
begin
    for i in 1..NMAX loop
        un_tab(i) := i + 2;
    end loop;

    for i in 1..NMAX loop
        Put_line("Element " & Integer'Image(i) & " = " & Integer'Image(un_tab(i)));
    end loop;
end tab1; 
