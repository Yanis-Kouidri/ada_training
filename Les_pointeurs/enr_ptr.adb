with Ada.Text_IO; use Ada.Text_IO;
--with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure enr_ptr is
    Type PINT is access Integer;
    type MATIERE is
        record
            code : String(1..5);
            note : PINT := null;
        end record;

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
    
    anglais : Matiere;
    francais : Matiere;
begin

   init(anglais, "Angla");

   affiche(anglais);
   set_note(anglais, 13);

   init(francais, "Franc");
   set_note(francais, 17);

   affiche(francais);
   set_note(francais, 4);

   affiche(francais);


end enr_ptr; 
