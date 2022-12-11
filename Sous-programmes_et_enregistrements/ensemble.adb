with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure ensemble is
    NMAX : constant integer := 50;
    type elements is array(1..NMAX) of integer;
    type ensemble is record
        contenu : elements;     -- Les éléments de l'ensemble
        cardinal : integer;     -- Le nombre d'élements de l'ensemble
    end record;

-- fonction creer : cree un ensemble vide
-- retour : ensemble (R)
-- PRE
--      - 
-- POST
--      - Est_vide(e) => True
--------------------------------------------------
-- fonction est_vide : vérifie si l'ensemble est vide
-- retour : boolean (R)
-- e : ensemble (D)
-- PRE
--
-- POST
--
--------------------------------------------------
-- fonction appartient : verifie la presence d'un element dans l'ensemble
-- x : integer (D)
-- e : ensemble (D/R)
-- PRE
--      - 
-- POST
--      - Est_vide(e) => not appartient'Result
--------------------------------------------------
-- procedure ajouter
-- ajoute un element dans l'ensemble
-- x : integer (D)
-- e : ensemble (D/R)
-- PRE
--      - Ensemble non plein 
-- POST
--      - Ensemble' = ensemble + element 
--------------------------------------------------
-- procedure supprimer
-- supprime un element dans l'ensemble
-- x : integer (D)
-- e : ensemble (D/R)
-- PRE
--      - Ensemble non plein 
-- POST
--      - Ensemble' = ensemble - element 
--------------------------------------------------
-- procedure afficher : Affiche le contenu de l'ensemble
-- e : ensmeble (D)
-- PRE
--      - 
-- POST
--      - 

begin

    -- Test
ensemble := creer()
if est_vide(ensemble) then
    put_line("OK");
else
    put_line("KO");
end if;

ajouter(9, ensemble);
if ensemble.contenu(1) = 9 then
    put_line("OK");
else
    put_line("KO");
end if;

ajouter(11, ensemble);
if ensemble.contenu(2) = 11 then
    put_line("OK");
else
    put_line("KO");
end if;

end ensemble; 
