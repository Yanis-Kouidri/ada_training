with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure a_to_b is
    CMAX : constant Integer :=80; -- taille maximum de la chaine de caracrètes
    nom : STRING(1..CMAX);
    l_nom : integer := 0;
begin
    put_line("Entrez un texte");
    get_line(nom, l_nom);

    for i in 1..l_nom loop
        if nom(i) = 'A' then
            nom(i) := 'B';
        end if;
    end loop;
    put_line(nom(1..l_nom));
end a_to_b; 
