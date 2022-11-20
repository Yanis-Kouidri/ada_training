with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure template is
    m: Integer;
begin
    m := 0;
    Put("Donner m : ");
    Get(m);
    new_line;
    for i in 1..9 loop
        m := m + i;
    end loop;
    Put_line("m : " & Integer'Image(m));
end template; 
