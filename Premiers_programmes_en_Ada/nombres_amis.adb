-- Raffinage :
--
-- R0 : Trouver tous les couples de nombres amis entre 1 et MAX, MAX lu au clavier.
--
-- R1 : Comment "Trouver tous les couples de nombres amis entre 1 et MAX, MAX lu au clavier." ? 
--
--      Demander MAX    (out : MAX Entier)
--      Calculer les couples d'entiers entre 1 et MAX (in : MAX)
--      
-- R2 : Comment "Calculer les couples d'entiers entre 1 et MAX" ?
--
--      Pour i allant de 2 à MAX
--          Calculer la somme des diviseurs de i (out somme_div_i Entier)
--          Calculer la somme des diviseurs de somme_div_i (in somme_div_i Entier ; out : i_prime Entier)
--          Si le couple n'a pas déjà été trouvé alors
--              Si i = i_prime alors    (in i, somme_div_i Entier)
--                  Afficher i et somme_div_i
--              Sinon rien
--              Fin si
--          Sinon Rien
--          Fin si
--      Fin pour
--
-- R3 : Comment calculer la somme des diviseur de x, x entier ?
--
--      somme = 0 ( out : somme Entier)
--
--      Pour i allant de 1 à x-1
--          si x modulo i est = 0 alors
--              somme = somme + i
--          sinon rien
--          fin si
--      Fin pour
--
-- R3 : Comment "Le couple n'a pas déjà été trouvé une fois" ?
--
--      somme_div_i < i
--
--       
--              
--
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure nombres_amis is
    N_max: Integer; -- L'entier dont on veut tous les couples de nombre amis (N,M) tel que 1 < N < M < N_max
    N: Integer; -- Premier element du couple (N,M) 
    --M: Integer; -- Second element du couple (N,M) 
    P: Integer; -- Element intermediaire
    Nb_amis: Integer; -- Compteur du nombre de couples d'amis trouvé
    Somme_div: Integer; 
begin
    Nb_amis := 0;
    Put("Donner N_max : "); -- Recuperer la valeur de N_max
    Get(N_max);
    Put("Tous les couples de nombre amis inferieur a N_max sont : ");
    new_line;
    for M in 2..N_max loop -- Parcours de tous les entiers selon N_max
        Somme_div := 0; -- Initialisation de Somme_div a zero

        for j in 1..M/2 loop -- Calcul de la somme des diviseurs
            if M mod j = 0 then -- Est ce un diviseur ?
                Somme_div := Somme_div + j; -- Si oui ont l'ajoute a la somme
            end if;
        end loop;
        
        N := Somme_div; -- Affectation de la somme des fiviseur de M dans N
        
        if N < M then -- Pour eviter les doublons
            Somme_div := 0; -- Initialisation de Somme_div a zero

            for j in 1..N/2 loop -- Calcul de la somme des diviseurs
                if N mod j = 0 then -- Est ce un diviseur ?
                    Somme_div := Somme_div + j; -- Si oui ont l'ajoute a la somme
                end if;
            end loop;
            P := Somme_div;
            
            if M = P then
                Put_line("(" & Integer'Image(N) & "," & Integer'Image(M) & " )");
                Nb_amis := Nb_amis+1;
            end if;
        end if;
    end loop;
    Put_line("Nombre de couples trouvés :" & Integer'Image(Nb_amis));

end nombres_amis;  
