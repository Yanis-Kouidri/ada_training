with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure fibonacci_2 is
    fibn_1: Integer := 0; -- Premier terme de la suite de fibo 
    fibn: Integer := 1; -- Deuxieme terme de la suite de fibo
    m: Integer; -- Entier saisi par l utilisateur afin de trouver le permier terme de la suite de fibo sup ou egal a ce m
    fibx: Integer := 0; -- x ieme terme de la suite de fibo
begin
    Put("Donner m : "); 
    Get(m);
    new_line;
    
    pragma Assert(m>1, "Erreur : m doit etre supperieur strictement a 1 "); 

    while m > fibx loop
        fibx := fibn_1 + fibn;
        fibn_1 := fibn; 
        fibn := fibx;
    end loop;
    Put_line("Le premier terme de la suite de fibonacci strictement supperieur a" & Integer'Image(m) & " est :" & Integer'Image(fibx));

end fibonacci_2;  
