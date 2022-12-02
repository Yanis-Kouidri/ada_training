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

    Procedure add_matiere(tab: in out liste_matiere ; indice: in Integer ; add_matiere: in PMatiere) is
    begin
        tab(indice) := add_matiere;
    end add_matiere;
    

    anglais : PMatiere;
    francais : Matiere;
    cours_n7 : Liste_Matiere;
    choix: Character;


begin

   anglais := new matiere;
   init(anglais.all, "Angla");
   set_note(anglais.all, 13);

   init(francais, "Franc");
   set_note(francais, 17);

   init_tab(cours_n7);
   add_matiere(cours_n7, 1, anglais); 

   affiche(cours_n7(1).all);
   loop
       Put_line("Que vouslez vous faire ? (a)jouter, (s)upprimer, (r)eset, (a)fficher : ");
       Get(choix);
       Case choix is
           when 'a' =>
               Put_line("Quelle case ? entre 1 et 50 inclus");
               Get(index);

       end case;

       exit when choix = 'q';
   end loop;

end tab_ptr_enr; 
