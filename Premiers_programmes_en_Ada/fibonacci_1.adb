with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure fibonacci_1 is
    fibn_1: Integer := 0; -- Premier terme de la suite de fibo 
    fibn: Integer := 1; -- Deuxieme terme de la suite de fibo
    x: Integer; -- n ieme terme de la suite de fibo souhaité par l'utilisateru
    fibx: Integer := 0; -- x ieme terme de la suite de fibo
begin
    Put("Donner x : "); -- n ieme terme de la suite de fibo souhaite
    Get(x);

    if x < 2 then --Si c'est un des deux premiers termes de la liste alors :
        fibx := x;
    else 		--Sinon on le calcul
        for i in 2..x loop
            fibx := fibn_1 + fibn;
            fibn_1 := fibn; 
            fibn := fibx;
        end loop;
    end if;

    Put_line("Le" & Integer'Image(x) & " ieme terme de la suite de fibonacci_1 est :" & Integer'Image(fibx));

end fibonacci_1;  
