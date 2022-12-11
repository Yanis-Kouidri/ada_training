with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation ;

procedure tab_ptr_enr is
    LMAX: constant Integer := 50;
    Type PINT is access Integer;
    Type MATIERE is
        record
            code : String(1..5);
            note : PINT := null;
        end record;
    Type PMATIERE is access Matiere;
    Type Liste_Matiere is array(1..LMAX) of PMATIERE;

    procedure free is new Ada.Unchecked_Deallocation(Matiere,PMATIERE) ; 

    procedure init(ma_matiere : in out Matiere ; nom_matiere : in String) is
    begin

        ma_matiere.code := nom_matiere;

    end init;

    procedure affiche(ma_matiere : in Matiere) is
    begin
        put_line("Code : " & ma_matiere.code);
        put_line("Note : " & Integer'Image(ma_matiere.note.all));

    Exception
        when CONSTRAINT_ERROR => put_line("Affichage impossible, note non initialisée");
    end affiche;
    
    procedure set_note(ma_matiere : in out Matiere ; nouv_note : in Integer) is
    begin
        if ma_matiere.note = null then
            ma_matiere.note := new Integer;
        end if;    
        ma_matiere.note.all := nouv_note;

    end set_note;

    Procedure init_tab(tab: in out liste_matiere) is
    begin
        for i in 1..LMAX loop
            if tab(i) /= null then
                free(tab(i));
            end if;

            tab(i) := null;
        end loop;
    end init_tab;

    Procedure add_matiere(tab: in out liste_matiere ; indice: in Integer ) is
        nouv_matiere : PMATIERE;
        nom_mat : String(1..5);
        note_mat : integer; 
    begin
        Put_line("Code matiere : (5 charactères)");
        Get(nom_mat);

        Put_line("Note matiere : (entre 0 et 20)");
        Get(note_mat);
        
        nouv_matiere := new MATIERE;
        nouv_matiere.all.code := nom_mat;
        set_note(nouv_matiere.all, note_mat);
        tab(indice) := nouv_matiere;

        put_line("Matiere créée");
        

    Exception
        when CONSTRAINT_ERROR => put_line("Ajout impossible, tableau non initialisé");
    end add_matiere;

    Function moyenne(tab: in liste_matiere) return float is

        nb_note: integer := 0;
        moyenne: float := 0.0;

    begin
        for i in tab'range loop
            if tab(i) /= null then
                moyenne := moyenne + float( tab(i).all.note.all );
                nb_note := nb_note + 1;
            end if;

        end loop;
        moyenne := moyenne / float(nb_note);
        return moyenne;

    end moyenne;
    

    cours_n7 : Liste_Matiere;
    choix: Character;
    index: Integer;
    est_init: boolean := false;


begin

   loop
       Put_line("Que vouslez vous faire ? (a)jouter/modifier, (s)upprimer, (i)nitialisation, a(f)ficher, (m)oyenne, (q)uitter : ");
       Get(choix);
       Case choix is
           when 'a' =>
               if est_init then
                   Put_line("Quelle case ? entre 1 et 50 inclus");
                   Get(index);
                   add_matiere(cours_n7, index);
               else
                   put_line("Veuillez initialiser le tableau");
               end if;
           when 'f' =>
               if est_init then
                   begin
                       Put_line("Quelle case ? entre 1 et 50 inclus");
                       Get(index);
                       affiche(cours_n7(index).all);
                   Exception
                       when CONSTRAINT_ERROR => put_line("Affichage impossible, case vide");
                   end;
               else
                   put_line("Veuillez initialiser le tableau");
               end if;
           when 'i' =>
               init_tab(cours_n7);
               est_init := true;
               put_line("Tableau (ré)initialisé. Il est désormais vide et prêt à être rempli");
           when 's' =>
               if est_init then
                   Put_line("Quelle case ? entre 1 et 50 inclus");
                   Get(index);
                   cours_n7(index) := null;
                   put_line("Matiere supprimée");
               else
                   put_line("Veuillez initialiser le tableau");
               end if;
           when 'm' =>
               if est_init then
                   Put_line(Float'Image(moyenne(cours_n7)));
               else
                   put_line("Veuillez initialiser le tableau");
               end if;
           when 'q' =>
               put_line("Au revoir");


           when others => Put_line("Choix impossible");
       end case;

       exit when choix = 'q';
   end loop;

end tab_ptr_enr; 
