---Function Overloading in Packages
----Packages allow function overloading (same function name with different parameters)...

create or replace package math_ops as
    function multiply(a number,b number) return number;
    function multiply(a number,b number,c number) return number;
end math_ops;

----====body
create or replace package body math_ops as
    function multiply(a number,b number) return number is
    begin
        return a*b;
        end multiply;
    
    function multiply(a number,b number,c number) return number is
    begin
        return a*b*c;
    end multiply;
 end math_ops;
 
 --=========
 select math_ops.multiply(10,20) from dual;
 
 select math_ops.multiply(10,20,30) from dual;