with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure JDoodle is
    a0: Float :=1.0;
    ak: Float :=1.0;
    akold: Float := 0.0;
    x: Float :=0.0; -- Le nombre dont on veut la racine
    eps: Float :=1.0;
begin
    ak := a0;
    Put("Donner le nombre dont vous voulez la racine : ");
    Get(x);
    new_line;
    Put("Donner la precision : ");
    Get(eps);
    new_line;
    loop
        akold := ak;
        ak := 0.5 * (ak + x/ak);
    exit when abs(ak - akold) < eps;
    end loop;
    Put_Line("Racine de " & Float'Image(x) & " = " & Float'Image(ak));
    
end JDoodle;