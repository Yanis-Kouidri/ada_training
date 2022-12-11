with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure nombres_parfaits is
    N_max: Integer; -- L'entier dont on veut tous les nombres parfait inferieur
    Somme_div: Integer; -- Somme_divomme des diviseurs
begin
    Put("Donner N_max : "); -- Recuperer la valeur de N_max
    Get(N_max);
    Put("Tous les nombres parfaits inferieur a N_max sont : ");
    for i in 2..N_max loop -- Parcours de tous les entiers selon N_max
        Somme_div := 0; -- Initialisation de Somme_div a zero
        for j in 1..i/2 loop -- Calcul de la somme des diviseurs
            if i mod j = 0 then -- Est ce un diviseur ?
                Somme_div := Somme_div + j; -- Si oui ont l'ajoute a la somme
            end if;
        end loop;
        if Somme_div = i then -- Conclusion, test si l'entier est parfait
            Put(i);
        end if;
    end loop;

end nombres_parfaits;  
