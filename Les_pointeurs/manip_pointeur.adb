with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure manip_pointeur is
    Type PINT is access Integer;
    p : PINT;
begin

    p := new Integer;
    p.all := 99;
    put_line("Valeur pointée par mon pointeur p :");
    put_line(Integer'Image(p.all));

    put_line("Saisissez une nouvelle valeur que va pointer p :");
    Get(p.all);

    put_line("Nouvelle valeur pointée par p :");
    put_line(Integer'Image(p.all));

end manip_pointeur; 
