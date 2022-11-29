with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure enr_ptr is
    Type PINT is access Integer;
    type MATIERE is
        record
            code : String(1..5);
            note : PINT := null;
        end record

    matiere1 : Matiere;
    procedure init(matiere : in out Matiere ; nom_matiere : in String) is
    begin

        matiere.code := nom_matiere;

    end init;
begin

    
   


end enr_ptr; 
