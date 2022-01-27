(*
    File: smaug
    Name: a02q01.ml
    Nile Weadick
*)

exception IgnoreCase;;
exception NotImplemented;;

(**max that returns the largest value among three values passed in.**)
let max = fun a -> fun b -> fun c -> if a>b then (if a>c then a else c) else (if b>c then b else c);;

(**add_func that returns a function that is the sum of two functions.**)
let add_funct = fun a -> fun b -> a +. b;;

(**sub_func that returns a function that is the difference of two functions**)
let sub_funct = fun a -> fun b -> a -. b;;

(**mult_func that returns a function that is the difference of two functions**)
let mult_funct = fun a -> fun b -> a *. b;;

(**div_func that returns a function that is the difference of two functions**)
let div_funct = fun a -> fun b -> a /. b;;

(**comp_func that returns a function that is the composition two functions.**)

(** max_func that returns the maximum of the value of two functions.**)
let max_funct = fun a -> fun b -> if a>b then a else b;;

(**print_int(add_funct (max 1 2 3) (max 4 5 6));;**)

let f x = x +. 1.0;;
let g x = x -. 1.0;;
let h x = x *. x;;

print_float (div_funct (f 0.0) (g 0.0));;
