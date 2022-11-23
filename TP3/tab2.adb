with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure tab2 is
    NMAX : constant Integer := 5; --indice maximum du tableau
    Type TAB_ENTIERS is Array(1..NMAX) of Integer;
    un_tab : TAB_ENTIERS; -- un tableau d'au maximum NMAX entiers
    a_modif : Integer;
    nouv_valeur : Integer;
    -- nb_elements : Integer; -- le nombre effectif d'éléments (<= NMAX) de un_tab
begin
    for i in 1..NMAX loop
        un_tab(i) := 0;
    end loop;

    Put_line("Initialisation :");
    for i in 1..NMAX loop
        Put_line("Element " & Integer'Image(i) & " = " & Integer'Image(un_tab(i)));
    end loop;

    Put_line("Quel élément du tableau voulez vous modifier ? :");
    Put_line("Doit être entre 1 et " & Integer'Image(NMAX) & " inclus");
    Get(a_modif);

    if a_modif <= NMAX and a_modif >= 1 then
        Put_line("Quelle valeur souhaitez vous saisir à la composante " & Integer'Image(a_modif) & " ? :");
        Get(nouv_valeur);
        un_tab(a_modif) := nouv_valeur;
    else 
        Put_line("Numéro de composante hors de porté");
    end if;

    Put_line("Résultat :");
    for i in 1..NMAX loop
        Put_line("Element " & Integer'Image(i) & " = " & Integer'Image(un_tab(i)));
    end loop;



end tab2; 
