WITH Ada.Integer_Text_IO, Ada.Text_IO ;
USE Ada.Integer_Text_IO, Ada.Text_IO ;
with Ada.Unchecked_Deallocation ;

PACKAGE BODY AB IS

    procedure free is new Ada.unchecked_deallocation( T_noeud, T_AB);



    -- Initialiser un AB Abr. L'AB est vide.
    PROCEDURE Initialiser(Abr : OUT T_AB) IS
    BEGIN
        abr := NULL;

    END Initialiser;

    -- Est-ce qu'un AB Abr est vide ?
    FUNCTION Est_Vide (Abr : IN T_AB) return boolean IS
    BEGIN
        return abr = NULL;
    END Est_Vide;

    -- Obtenir le nombre d'éléments d'un AB
    FUNCTION Taille (Abr : IN T_AB) return Integer IS
    BEGIN
        if abr /= null then
            return (1 + Taille(Abr.all.Sous_Arbre_Gauche) + Taille(Abr.all.Sous_arbre_droit) ); 
        else
            return 0;
        end if;

    END Taille;

    -- Insérer la donnée dans l'AB Abr.
    PROCEDURE Inserer(Abr : IN OUT T_AB ; Donnee : IN Integer) IS
        
    BEGIN

        -- Cas ou on atteint une feuille de l'arbre : c'est qu'on a trouvé l'endroit ou insérer la valeur
        IF Abr = NULL THEN
            Abr := new T_Noeud;
            Abr.all.Donnee := Donnee;
            Abr.sous_arbre_gauche := NULL;
            Abr.sous_arbre_droit := NULL;

        -- Dans le cas ou notre valeur a ajouter est plus petite que celle courante alors il faut aller à gauche 
        ELSIF Donnee < abr.all.donnee  THEN
            Inserer( abr.all.sous_arbre_gauche, Donnee);

        -- Dans le cas ou notre valeur a ajouter est plus grande que celle courante alors il faut aller à droite 
        ELSIF Donnee > abr.all.donnee THEN
            Inserer( abr.all.sous_arbre_droit, Donnee);
        ELSE 
            put_line("Donnée déjà présente");

        END IF;

    END Inserer;

    -- Recherche dans l'AB Abr. et renvoie la un pointeur sur noeud si trouvé, null sinon
    FUNCTION Aller_a(Abr : IN T_AB ; Donnee : IN Integer) return T_AB IS
    BEGIN

        IF abr = null then
            return null;
        ELSIF Donnee < abr.all.donnee then
            return Aller_a(abr.all.sous_arbre_gauche, donnee);
        elsif Donnee > abr.all.donnee then
            return Aller_a(abr.all.sous_arbre_droit, donnee);
        elsif Donnee = abr.all.donnee then
            return Abr;
        -- Le else ici ne sert a priori a rien mais je le mets par précaution, pour traiter l'ensemble des cas
        else
            return null;
        end if;

    END aller_a;


    FUNCTION Recherche(Abr : IN T_AB ; Donnee : IN Integer) return boolean IS
    BEGIN

        IF aller_a(Abr, Donnee) = null then
            return false;
        else
            return true;
        end if;

    END Recherche;


    -- Modifier la donnée dans l'AB Abr.
    -- tar_donnee = target donnee = donnée ciblée (donnée qui va être remplacer par src_donnée)
    -- src_donnee = donnée source (donnée qui va remplacer tar_donné)
    -- Pour des raison de cohérence la modification d'une valeur se fera en deux temps :
    -- Dans un premier temps je commence par supprimer la valeur ciblée
    -- Puis j'ajoute la valeur donnée par l'appelant.
    --
    -- J'ai fait le choix de ne pas directement modifier la valeur ciblée avec la valeur source car cela pourrait comprometre 
    -- la relation d'odre de l'abre
    PROCEDURE Modifier (Abr : IN OUT T_AB ; src_donnee : IN Integer ; tar_donnee : IN Integer) IS
    BEGIN
        if Recherche(abr, tar_donnee) then
            Supprimer( abr, tar_donnee);
            inserer(abr, src_donnee);
        else
            put_line("Valeur cible non présente dans l'arbre");
        end if;

    END Modifier;

    -- Supprimer la donnée dans l'AB Abr.
    PROCEDURE Supprimer (Abr : IN OUT T_AB; donnee : IN Integer) IS 
        temp : T_AB := null;

    BEGIN
        IF abr /= null then
            -- Dans un premier temps on cherche a atteindre la bonne valeur
            IF abr.all.donnee = donnee then

                -- Puis on s'occupe de la traiter :
                If abr.all.sous_arbre_gauche = null and abr.sous_arbre_droit = null then
                    free(abr);
                    abr := null;

                elsif abr.all.sous_arbre_gauche /= null then
                    temp := abr;
                    abr := abr.all.sous_arbre_gauche;
                    while abr.all.sous_arbre_droit /= null loop
                        abr := abr.all.sous_arbre_droit;
                    end loop;
                    abr.all.sous_arbre_droit := temp.all.sous_arbre_droit;
                    free(temp);
                    temp := null;
                elsif abr.all.sous_arbre_droit /= null then
                    temp := abr;
                    abr := abr.all.sous_arbre_droit;
                    free(temp);
                    temp := null;
                end if;

            ELSIF Donnee < abr.all.donnee then
                Supprimer(Abr.all.sous_arbre_gauche, donnee);

            elsif Donnee > abr.all.donnee then
                Supprimer(Abr.all.sous_arbre_droit, donnee);
            end if;

        else
            put_line("Valeur a supprimer non trouvée : Modification impossible");
        end if;
    END Supprimer;

    -- Afficher un AB Abr
    -- Technique utilisé : DFS (Depth-first search)
    PROCEDURE Afficher (Abr : IN T_AB) IS
    BEGIN
        if abr /= null then
            afficher(abr.all.sous_arbre_gauche);
            put(abr.all.donnee);
            afficher(abr.all.sous_arbre_droit);
        end if;
        

    END Afficher;



END AB ;
