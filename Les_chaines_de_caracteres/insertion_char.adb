with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure insertion_char is
    CMAX : constant Integer := 80; -- taille maximum de la chaine de caracrètes
    nom : STRING(1..CMAX);
    l_nom : Integer := 0;
begin
    put_line("Entrez un texte");
    get_line(nom, l_nom);

    put_line("Votre chaine :");
    put_line(nom);

    new_line;
    if l_nom < CMAX then
        for i in reverse 1..l_nom loop 
            nom(i+1) := nom(i);
        end loop;
        nom(1) := 'X'; -- Insert de nouvelle valeur
        l_nom := l_nom + 1;
    else
        Put_line("Insertion impossible");
        new_line;
    end if;

    Put_line("Nouvelle chaine :");
    put_line(nom);
end insertion_char; 

