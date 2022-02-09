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
    else if (n mod 2) == 0 then power x (n/2) * power x (n/2)
    else x * power x ((n-1)/2) * power x ((n-1)/2);;

(**Q3. Write a function sum_to such that (sum_to n) computes the sum from 0 to n. If n is
negative, then 0 is returned.**)
let rec sum_to = fun n -> if n < 0 then 0 else n + sum_to (n-1);;

(**Q4. Write a function isprime such that (isprime n) is true if and only if n is a prime.**)
let rec isprime = fun n -> if n > isprime n-1 then 1 else 0;;

(**Q5. Write a function head that returns the first element of a list. (Ignore the case where
the list passed in is empty).**)
let head;;


