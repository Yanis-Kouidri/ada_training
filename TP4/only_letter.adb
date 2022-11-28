with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure only_letter is
    CMAX : constant Integer := 80; -- taille maximum de la chaine de caracrètes
    nom : STRING(1..CMAX);
    l_nom : Integer := 0;
    j : Integer := 1;
begin
    put_line("Entrez un texte");
    get_line(nom, l_nom);

    for i in 1..l_nom loop
        if (character'pos(nom(i)) >= character'pos('a') and  character'pos(nom(i)) <= character'pos('z')) then
            nom2(j) := nom(i);
            j := j +1;
        end if;
    end loop;
    put_line(nom2);
end only_letter; 
