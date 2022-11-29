with Ada.Text_IO; use Ada.Text_IO;
-- with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure mc_carthy is
    NMAX: constant Integer := 210;

    function mc_Carthy (n : Integer) return Integer is -- Fonction mc_Carthy pour la récursivité
    begin
        if n > 100 then
            return(n - 10);
        else
            return(mc_Carthy( mc_Carthy(n+11) ));

        end if;
    end mc_Carthy;

begin
    
    for n in 0..NMAX loop
        Put_line("M(" & Integer'Image(n) & ") = " &  Integer'Image(mc_Carthy(n)));
    end loop;
end mc_carthy; 
