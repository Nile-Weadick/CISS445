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

(**Q3. Write a function range2 so that (range2 a b c) returns a list of integers from a to
< b in steps of c if c is positive and from a to > b if c is negative.**)
let rec range2 = fun a -> fun b -> fun c -> if a >= b then [] else a::range2 (a+c) (b) c;;

(**Q4. Write a function slice so that (slice list a b c) returns a list consisting of the
elements of list from index position a to b - 1 in steps of c. (Ignore the case where c is
negative).**)let slice list a b c = 
let newlist = [] in  
let i = a in let rec aux list newlist i a b c = 
match list with
    | [] -> newlist
    | x::xs -> if x mod c = 0 && i < b then aux (xs) (newlist@[x]) (i+1) a b c else aux (xs) newlist (i+1) a b c
  in aux list newlist i a b c
;;

(**Q5. Write a function index so that (index list x) returns the index position of the first
occurrence of x in the list. (-1) is returned if x is not found.**)
let rec index = fun list -> fun n -> match list with [] -> -1 | x::xs -> if x == n then 0 else 1 + index xs n;;

(**Q6. Write a function at so that (at list n) returns the element of the list at index n.
Ignore the case where n < 0 or n >= the size of the list.**)
let rec at = fun list -> fun n -> match list with x::xs -> if n == 0 then x else at xs (n-1);;

(**Q7. Write a function elementof such that (elementof x list) returns true if x is a value
in list.**)
let rec elementof = fun n -> fun list -> match list with [] -> "false" | x::xs -> if n==x then "true" else elementof n xs;;

(**Q8. Write a function subseteq such that subseteq list1 list2 is true iff every value in
list is in list2.**)
let rec subseteq = fun list1 -> fun list2 -> match list1,list2 with [],list2 -> "true" | list1,[] -> "false" | x::xs, y::ys-> subseteq xs ys;;