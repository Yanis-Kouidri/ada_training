-- Raffinage :
-- R0 : Deviner le nombre entre 1 et 100 inclus choisi par l'utilisateur
--
-- R1 : Comment R0 ?
--      Afficher("Pensez à un nombre entre 1 et 100 inclus")
--      Répéter
--          A11 Faire une proposition probable
--              Compter le nombre de propositions
--          A12 Interoger l'utilisateur sur la proposition faite
--      JusquA nombre deviné
--      Afficher("J'ai deviné ton nombre en " nb_tentative "tentative")
--
-- R2 : Comment A11 ?
--      A21 Calculer la dicotomie en fonction des éléments que l'on a
--      A22 Afficher le nombre calculé
--      

-- R2 : Comment A12 ?
--      Répéter
--          A23 Afficher("Votre réponse : C'est plus (+), c'est moins (-) ou c'est égal (=)")
--          A24 Lire(reponse) ( out : reponse char)
--          A25 Traiter réponse
--      JusquA reponse correcte
--
--
-- R3 : Comment A21 ?
--      proposition = (max + min)/2 (in : min, max Integer ; out : propostion : integer)
--
-- R3 : Comment A25 ?
--          Selon reponse:
--              Cas '+' faire : min = proposition
--              Cas '-' faire : max = proposition
--              Cas '=' faire : rien
--              Défaut faire : Afficher("Réponse incorrecte, recommence")
--          Fin Selon
--
--          
--      

with Ada.Text_IO; use Ada.Text_IO;
procedure devin2 is
    min, max: Integer;
    nb_tentative: Integer;
    proposition: Integer;
    reponse: character;
begin
    nb_tentative := 0;
    min := 1;
    max := 101;
    put_line("Pense à un nombre entre 1 et 100 inclus");
    loop
        proposition := (min + max)/2;

        Put_line("Je pense que c'est : " & Integer'Image(proposition));
        nb_tentative := nb_tentative + 1; 

        loop
            Put_line("Votre réponse : C'est plus (+), c'est moins (-) ou c'est égal (=)");
            Get(reponse);
            Case reponse is
                when '+' => min := proposition;
                when '-' => max := proposition;
                when '=' => null;
                when others => Put_line("Réponse incorrecte, recommence.");
            end case;
        exit when reponse = '=' or reponse = '+' or reponse = '-';
        end loop;

    exit when reponse = '=';
    end loop;

    put_line("J'ai trouvé en : " & Integer'Image(nb_tentative) & " tentatives !");

end devin2; 
