with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure test_string is
    CMAX : constant Integer :=80; -- taille maximum de la chaine de caracrètes
    nom : STRING(1..CMAX);
    l_nom : integer := 0;
begin
    put_line("Entrez un texte");
    get_line(nom, l_nom);
    put_line(nom(1..l_nom));
end test_string; 
