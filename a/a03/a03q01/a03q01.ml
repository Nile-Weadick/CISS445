(*
    File: smaug
    Name: a03q01.ml
    Nile Weadick
*)

exception IgnoreCase;;
exception NotImplemented;;

(**Q1. Write a function power so that (power x n) returns the power of x to the n-th power**)
let rec power = fun x -> fun n -> if n == 0 then 1 else x * power x (n-1);;

(**Q2. Write a function power2 that has the same output as power from Q1 but is computed
using this recursion:**)
let rec power2 = fun x -> fun n -> 
    if n == 0 then 1 
    else if (n mod 2) == 0 then x * power x (n-1)
    else x * power x (n-1);;

(**Q3. Write a function sum_to such that (sum_to n) computes the sum from 0 to n. If n is
negative, then 0 is returned.**)

print_int(power2 (-3) 3);;