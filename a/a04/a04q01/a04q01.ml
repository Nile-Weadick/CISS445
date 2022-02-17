(*
    File: smaug
    Name: a04q01.ml
    Nile Weadick
*)

exception IgnoreCase;;
exception NotImplemented;;

(**Q1. Write a function duplicate so that (duplicate x n) will return a list with n copies
of x. Ignore the case where n is negative.**)
let rec duplicate = fun x -> fun n -> if n == 0 then [] else x::duplicate (x) (n-1);;

(**Q2. Write a function range so that (range a b) will return a list of integers from a to
b - 1.**)
let rec range = fun a -> fun b -> if a >= b then [] else a::range (a+1) (b);;