-- R0 : Insérer un élément en début de tableau en décalant les autres
--
-- R1 : Commant R0 ?
--      Si tableau non plein alors
--          Décaler tous les éléments
--          Ajouter le nouveau en première place
--      Sinon 
--          Afficher("Insertion impossible")
--      Fin si
--
-- R2 : Comment "décaler tous les éléments" ?
--      Pour i allant de 1 à nb_elements (reverse)
--          tab(i+1) = tab(i)
--      Fin pour
--

with Ada.Text_IO; use Ada.Text_IO;
-- with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure tab5 is
    NMAX : constant Integer := 15; --indice maximum du tableau
    Type TAB_ENTIERS is Array(1..NMAX) of Integer;
    un_tab : TAB_ENTIERS; -- un tableau d'au maximum NMAX entiers
    nb_elements : Integer := 0; -- le nombre effectif d'éléments (<= NMAX) de un_tab
begin
    for i in 1..NMAX loop
        un_tab(i) := i;
        nb_elements := nb_elements + 1;
    end loop;

    Put_line("Nombre d'éléments du tableau : " & Integer'Image(nb_elements));

    Put_line("Tableau avant :");
    for i in 1..NMAX loop
        Put_line("Element " & Integer'Image(i) & " = " & Integer'Image(un_tab(i)));
    end loop;

    new_line;
    if nb_elements < NMAX then
        for i in reverse 1..nb_elements loop 
            un_tab(i+1) := un_tab(i);
        end loop;
        un_tab(1) := 777; -- Insert de nouvelle valeur
    else
        Put_line("Insertion impossible");
        new_line;
    end if;

    Put_line("Tableau après :");
    for i in 1..NMAX loop
        Put_line("Element " & Integer'Image(i) & " = " & Integer'Image(un_tab(i)));
    end loop;
end tab5; 
