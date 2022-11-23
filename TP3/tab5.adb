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
--      Pour i
--          Avancer toutes les valeurs du tableau d'une position
--      JusquA tout le tableau parcouru



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
