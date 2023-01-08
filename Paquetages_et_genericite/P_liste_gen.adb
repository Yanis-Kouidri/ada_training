with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation ;
PACKAGE BODY P_liste_gen IS

    LISTE_VIDE_ERROR: EXCEPTION;
    FIN_ERROR: EXCEPTION;
    -- Définiton des procédures et fonctions :
    
    procedure free is new Ada.Unchecked_Deallocation(T_cellule, T_liste_chainee) ;  

    -- Je suis obligé de changer la fonction en procédure car la type T_liste_chainee est limited private
    procedure creer_liste_vide(list : in out T_liste_chainee) is 
    begin
        list := null;
    end creer_liste_vide;

    function est_vide(list: in T_liste_chainee) return boolean is
    begin
        return list = null;
    end est_vide;


    procedure inserer_en_tete(list : in out T_liste_chainee ; elem : in Type_element) is
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
        else 
            new_line;
            new_line;
        end if;

    end afficher;

    
    -- Je suis obligé de changer la fonction en procédure car la type T_liste_chainee est limited private
    procedure rechercher(list : in T_liste_chainee ; elem : in Type_element ; retour : out T_liste_chainee) is
    begin
        if list /= null then
            if elem = list.all.element then
                retour := list;
            else
                rechercher(list.all.suivant, elem, retour);
            end if;
        else
            retour := null;
        end if;
    end rechercher;


    procedure inserer_apres(list : in T_liste_chainee; data, new_data : in Type_element) is

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
        when LISTE_VIDE_ERROR => put_line("Erreur : Liste vide.");
        when FIN_ERROR => put_line("Erreur : Element non trouvé, insertion impossible.");
    end inserer_apres; 


    procedure inserer_avant(list : in out T_liste_chainee; data, new_data : in Type_element) is

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
        when LISTE_VIDE_ERROR => put_line("Erreur : Liste vide.");
        when FIN_ERROR => put_line("Erreur : Element non trouvé, insertion impossible.");
    end inserer_avant; 


    procedure enlever(list : in out T_liste_chainee; a_enlever : in Type_element) is
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
        when LISTE_VIDE_ERROR => put_line("Erreur : Liste vide.");
        when FIN_ERROR => put_line("Erreur : Element non trouvé, suppression impossible.");
    end enlever; 


END P_liste_gen; 
