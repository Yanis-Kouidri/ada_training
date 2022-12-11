with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure liste_chainee is

    -- Déclaration des types :
    Type T_liste_chainee;
    Type T_cellule;

    -- Définition des types :
    Type T_liste_chainee is access T_cellule; -- Une liste chainée (pointeur sur cellule)

    Type T_cellule is
        Record
            Element : Integer;
            Suivant : T_liste_chainee;
        End Record;
    -- Définiton des procédures et fonctions :

    function creer_liste_vide return T_liste_chainee is 
        new_list : T_liste_chainee;
    begin
        new_list := null;

        return new_list;
    end creer_liste_vide;

    function est_vide(list: in T_liste_chainee) return boolean is
    begin
        if list = null then
            return true;
        else
            return false;
        end if;
    end est_vide;

    procedure inserer_en_tete(list : in out T_liste_chainee ; elem : in integer) is
        temp : T_liste_chainee;
    begin
        temp := list;
        list := new T_cellule;
        list.all.element := elem;
        list.all.suivant := temp;
    end inserer_en_tete;

    procedure afficher(list : in T_liste_chainee) is
    begin
        if list /= null then
            put(list.all.element);
            afficher(list.all.suivant);
        end if;

    end afficher;

    function rechercher(list : in T_liste_chainee ; elem : in Integer) return T_liste_chainee is
    begin
        if list /= null then
            if elem = list.all.element then
                return list;
            else
                return rechercher(list.all.suivant, elem);
            end if;
        else
            return null;
        end if;
    end rechercher;

    procedure inserer_apres(list : in T_liste_chainee; data, new_data : in Integer) is
        insere : boolean := false;
        LISTE_VIDE_ERROR := EXCEPTION;

    begin
        if est_vide(list) then
            raise LISTE_VIDE_ERROR ;
        else
            --TODO
        end if;


    exception
        when LISTE_VIDE_ERROR => put_line(" Erreur : Liste vide ");
    end inserer_apres; 

    -- Déclaration des variables
    ma_liste : T_liste_chainee;


begin
    ma_liste := creer_liste_vide; 

    if est_vide(ma_liste) then
        put_line("Est vide");
    end if;
    inserer_en_tete(ma_liste, 8);
    inserer_en_tete(ma_liste, 156);
    inserer_en_tete(ma_liste, 16);

    afficher(ma_liste);
    new_line;
    if rechercher(ma_liste, 8) /= null then
        put_line("Trouvé");
    end if;

    if rechercher(ma_liste, 156) /= null then
        put_line("Trouvé");
    end if;
    
    if rechercher(ma_liste, 9) = null then
        put_line("non Trouvé");
    end if;
        

end liste_chainee; 
