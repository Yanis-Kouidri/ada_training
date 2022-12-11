with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure somme_ada is
    m: Integer;
    n: Integer;
    i: Integer;
    resultat: Integer;
begin
    m := 0;
    n := 0;
    i := 0;
    resultat := 0;
    Put("Donner m : ");
    Get(m);
    new_line;
    Put("Donner n : ");
    Get(n);
    new_line;
    for i in m..n loop
        resultat := resultat + i;
    end loop;
    Put_line("La somme des entier entre m et n est : " & Integer'Image(resultat));
end somme_ada; 
