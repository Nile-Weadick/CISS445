(*
    File: smaug
    Name: a02q01.ml
*)

exception IgnoreCase;;
exception NotImplemented;;

let max (a: int) (b: int) (c: int) int = 
    let x = if a>b then a else b;;
        let y = if b>c then b else c;;

print_int (y);;