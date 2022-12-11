with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation ;
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
    --
    procedure free is new Ada.Unchecked_Deallocation(T_cellule, T_liste_chainee) ;  

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
            put(list.all.element, 3);
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
        LISTE_VIDE_ERROR: EXCEPTION;
        FIN_ERROR: EXCEPTION;

    begin
        if est_vide(list) then
            raise LISTE_VIDE_ERROR ;
        else
            if list.all.element = data then
                inserer_en_tete(list.all.suivant, new_data);
            elsif est_vide(list.all.suivant) then
                raise FIN_ERROR;
            else
                inserer_apres(list.all.suivant, data, new_data);
            end if;
        end if;
    exception
        when LISTE_VIDE_ERROR => put_line(" Erreur : Liste vide.");
        when FIN_ERROR => put_line(" Erreur : Element non trouvé, insertion impossible.");
    end inserer_apres; 


    procedure inserer_avant(list : in out T_liste_chainee; data, new_data : in Integer) is
        LISTE_VIDE_ERROR: EXCEPTION;
        FIN_ERROR: EXCEPTION;

    begin
        if est_vide(list) then
            raise LISTE_VIDE_ERROR ;
        else
            if list.all.element = data then
                inserer_en_tete(list, new_data);
            elsif est_vide(list.all.suivant) then
                raise FIN_ERROR;
            else
                inserer_avant(list.all.suivant, data, new_data);
            end if;
        end if;
    exception
        when LISTE_VIDE_ERROR => put_line(" Erreur : Liste vide.");
        when FIN_ERROR => put_line(" Erreur : Element non trouvé, insertion impossible.");
    end inserer_avant; 


    procedure enlever(list : in out T_liste_chainee; a_enlever : in Integer) is
        LISTE_VIDE_ERROR: EXCEPTION;
        FIN_ERROR: EXCEPTION;
        tmp: T_liste_chainee; 

    begin
        if est_vide(list) then
            raise LISTE_VIDE_ERROR ;
        else
            if list.all.element = a_enlever then
                tmp := list;
                list := list.all.suivant;
                free(tmp);
            elsif est_vide(list.all.suivant) then
                raise FIN_ERROR;
            else
                enlever(list.all.suivant, a_enlever);
            end if;
        end if;
    exception
        when LISTE_VIDE_ERROR => put_line(" Erreur : Liste vide.");
        when FIN_ERROR => put_line(" Erreur : Element non trouvé, suppression impossible.");
    end enlever; 


    -- Déclaration des variables
    ma_liste : T_liste_chainee;


begin
    ma_liste := creer_liste_vide; 

    if est_vide(ma_liste) then
        put_line("Est vide");
    end if;
    inserer_avant(ma_liste, 5, 1);
    inserer_en_tete(ma_liste, 1);
    inserer_en_tete(ma_liste, 2);
    inserer_en_tete(ma_liste, 3);
    inserer_en_tete(ma_liste, 4);

    put_line("Ma liste");
    afficher(ma_liste);
    new_line;
    inserer_apres(ma_liste, 9, 23);

    inserer_avant(ma_liste, 2, 55);
    inserer_avant(ma_liste, 1, 55);

    new_line;
    put_line("RE :Ma liste");
    afficher(ma_liste);
    enlever(ma_liste, 1);

    new_line;
    put_line("RE :Ma liste");
    afficher(ma_liste);

        

end liste_chainee; 
