with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with liste_doublement_chainee; use liste_doublement_chainee;

procedure test_liste is
    -- Déclaration de types
    

    -- Déclaration de procédures et fonctions
    
    
    -- Déclaration de variables

    ma_liste : T_liste;
begin
    ma_liste := creation;

    if ma_liste = null then
        put_line("OK");
    else
        put_line("KO");
    end if;

    ajout(ma_liste, 6);
    ajout(ma_liste, 7);
    if ma_liste.all.element = 7 then
        put_line("OK");
    else
        put_line("KO");
    end if;


    suppression(ma_liste);
    if ma_liste = null then
        put_line("OK");
    else
        put_line("KO");
    end if;

    ajout(ma_liste, 6);
    ajout(ma_liste, 4);
    ajout(ma_liste, 9);
    ajout(ma_liste, 1);

    recherche(ma_liste, 6);

    if ma_liste.all.element = 6 then
        put_line("OK");
    else
        put_line("KO");
    end if;

end test_liste; 
