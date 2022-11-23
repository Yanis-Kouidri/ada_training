with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure tab4 is
    NMAX : constant Integer := 15; --indice maximum du tableau
    Type TAB_ENTIERS is Array(1..NMAX) of Integer;
    un_tab : TAB_ENTIERS; -- un tableau d'au maximum NMAX entiers
    pieme : Integer; -- p-ième occurrence d'une valeur dans le tableau un_tab
    valeur_recherche : Integer;
    reponse : Integer := 0;
    occurence: Integer := 0;
begin
    for i in 1..NMAX loop
        un_tab(i) := i mod 5;
    end loop;

    Put_line("Initialisation :");
    for i in 1..NMAX loop
        Put_line("Element " & Integer'Image(i) & " = " & Integer'Image(un_tab(i)));
    end loop;

    new_line;
    Put_line("Quelle valeur cherchez vous ?");
    Get(valeur_recherche);

    Put_line("Quelle occurence de cette valeur cherchez vous ?");
    Get(pieme);

    for i in 1..NMAX loop
        if un_tab(i) = valeur_recherche then
            occurence := occurence + 1; 
            if occurence = pieme then
                reponse := i;
            end if;
        end if;

    end loop;
    
    if reponse /= 0 then

        Put_line("La" & Integer'Image(pieme) & "ième occurrence de la valeur" 
        & Integer'Image(valeur_recherche) & " se trouve à l'indice" & Integer'Image(reponse) & " du tableau un_tab");
    else
        Put_line("Valeur non présente");
    end if;

end tab4; 
