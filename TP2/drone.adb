-- Raffinage :
-- R0 : Controler le drone à l'aide d'un menu contextuel

-- R1 : Comment R0 ?
--      Répéter 
--          A12 Afficher le menu des choix
--          A13 Demander le choix à l'utilisateur (choix : out character)
--          A14 Traiter le choix (choix : in character)
--      JusquA Arret du drone

-- R2 : Comment A12 ?
--      Afficher("Que faire : (d)émarrer (m)onter de(s)endre (q)uitter ?")
--
-- R2 : Comment A13 ?
--      Lire(Choix)
--
-- R2 : Comment A14 ?
--      Selon Choix
--          Cas "d" faire : demarre = vraie
--          Cas "m" faire : Faire monter le drone (in 
--          Cas "s" faire : Faire descendre le drone
--          Cas "q" faire : quitte = vraie
--      Fin Selon
--
-- R2 : Comment Arret du drone ?
--      a_porte = vraie et quitte = faux
--
-- R3 : Comment Faire monter le drone ?
--      Si demarre = vrai alors
--          altitude = altitude + 1
--      Sinon 
--          Afficher("Impossible, le drone est éteint")
--      Si altitude > 5 alors
--          a_porte = faux
--      Sinon rien
--
-- R3 : Comment Faire descendre le drone ?
--      Si demarre = vrai et altitude > 0 alors
--          altitude = altitude - 1
--      Sinon 
--          si demarre = faux alors
--              Afficher("Impossible, le drone est éteint")
--          Sinon 
--              Afficher("Le drone ne peut pas descendre plus")
--
--
--
--

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure drone is
    altitude: Integer; -- Altitude du drone
    quitte: Bool; -- L'utilisateur souhaite quitté
    demarre: Bool; -- Le drone est il demarré ?
    choix: Char; -- Choix de l'utilisateur
    a_porte: Bool; -- Le drone est il a porté ?
begin
    altitude := 0;
    delarre := false;
    quitte := false;

    loop
        Put("Que faire : (d)émarrer (m)onter de(s)endre (q)uitter ?");
        Get(choix);
        Case choix is
            when 'd' => demarre := True;
            when 'm' => 
                if demarre then
                    altitude := altitude + 1;
                end if;
            when 's' => 
                if demarre and altitude > 0 then
                    altitude := altitude - 1;
                end if;
            when 'q' => quitte := true;
            when others => Put("Choix incorrecte");
        end case;
    for a_porte and not quitte

end drone;  
