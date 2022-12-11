with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure puissance is
    x: Float; -- reel que l on veut elever a la puissance y
    y: Integer; -- puissance y
    resultat: Float;
begin
    Put("Donner x : "); -- Recuperer la valeur a elever a la puissance y
    Get(x);
    new_line;
    Put("Donner y : "); -- Recuperer la valeur de l exposant
    Get(y);
    new_line;
    pragma Assert(x/=0.0 or y/=0, "Erreur : 0 exposant 0 n'existe pas !"); 

    resultat := x;

    for i in 1..abs(y)-1 loop
        resultat := resultat * x;
    end loop;
    if y < 0 then
        resultat := 1.0 / resultat;
    end if;

    Put_line(Float'Image(x) & " a la puissance" & Integer'Image(Y) & " donne" & Float'Image(resultat));

end puissance;  
