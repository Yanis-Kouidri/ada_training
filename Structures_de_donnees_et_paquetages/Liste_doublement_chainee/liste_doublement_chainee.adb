WITH Ada.Integer_Text_IO, Ada.Text_IO ;
USE Ada.Integer_Text_IO, Ada.Text_IO ;
with Ada.Unchecked_Deallocation ; 

PACKAGE BODY liste_doublement_chainee IS

    procedure free is new Ada.Unchecked_Deallocation(T_noeud, T_liste) ;

    Function creation return T_liste is
    begin
        return null;
    end creation;


    -- L'ajout se fera à la queue de la liste
    Procedure ajout(liste : in out T_liste ; elem : in Integer) is
    begin
        
        if liste = null then
            liste := new T_noeud;
            liste.all.element := elem;
            liste.all.precedent := null;
            liste.all.suivant := null;
        elsif liste.all.suivant = null then
            liste.all.suivant := new T_noeud;
            liste.all.suivant.all.element := elem;
            liste.all.suivant.all.precedent := liste;
            liste.all.suivant.all.suivant := null;
            liste := liste.all.suivant;
        else 
            ajout(liste.all.suivant, elem);
        end if;
    end ajout; 


    Procedure suppression(liste : in out T_liste) is 
        temp : T_liste := liste;
    begin
        if liste /= null then -- Vérification que la liste n'est pas déjà vide

            if liste.all.precedent /= null then -- S'il existe un précédent :
                liste := liste.all.precedent; -- On place la tete de lecture sur l'élément précédent
                liste.all.suivant := liste.all.suivant.all.suivant; -- on branche le précédent sur le suivant
                if liste.all.suivant /= null then
                    liste.all.suivant.all.precedent := liste; -- et on branche le suivant sur la précédent (si possible)
                end if;

            elsif liste.all.suivant /= null then -- S'il existe un suivant :
                liste := liste.all.suivant; -- On place la tete de lecture sur l'élément suivant
                liste.all.precedent := null; -- On se détache de l'élément précédent

            elsif liste.all.precedent = null and liste.all.suivant = null then -- Sinon
                liste := null;
            end if;
            free(temp); -- On n'oublie pas de libérer la mémoire du noeud supprimé
        else
            put_line("Suppression impossible : liste vide");

        end if;
    end suppression;


    Procedure recherche(liste : in out T_liste ; elem : in Integer) is
    begin

        null;
    end recherche;


    Procedure affichage(liste : in T_liste) is
    begin

        null;
    end affichage;


END liste_doublement_chainee ;
