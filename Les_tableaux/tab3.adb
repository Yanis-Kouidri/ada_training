with Ada.Text_IO; use Ada.Text_IO;
procedure tab3 is
    NMAX : constant Integer := 5; --indice maximum du tableau
    Type TAB_ENTIERS is Array(1..NMAX) of Integer;
    un_tab : TAB_ENTIERS; -- un tableau d'au maximum NMAX entiers
begin
    for i in 1..NMAX loop
        un_tab(i) := i;
    end loop;

    Put_line("Initialisation :");
    for i in 1..NMAX loop
        Put_line("Element " & Integer'Image(i) & " = " & Integer'Image(un_tab(i)));
    end loop;

    new_line;
    Put_line("Incrémentation :");

    for i in 1..NMAX loop
        un_tab(i) := un_tab(i) + 1;
    end loop;

    for i in 1..NMAX loop
        Put_line("Element " & Integer'Image(i) & " = " & Integer'Image(un_tab(i)));
    end loop;



end tab3; 
