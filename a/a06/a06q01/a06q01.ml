(*
    File: smaug
    Name: a06q01.ml
    Nile Weadick
*)

exception IgnoreCase;;
exception NotImplemented;;

(**Q1**)
type 'a list = Empty
| Cons of 'a * 'a list
;;

let l1 = Cons (1,Cons(2,Cons(3,Empty)));;

let rec print_list = fun s -> match s with Empty -> print_string "\n"
| Cons (x,s) -> let _ = print_int x in let _ = print_string " " in print_list (s);;

let rec getSize = fun l -> fun acc -> match l with Empty -> acc
| Cons (x,s) -> getSize (s) (acc+1);;

let size = fun l -> getSize (l) (0);;

let init = fun () -> Empty;;

let isEmpty = fun l -> match l with Empty -> true 
| Cons (x,s) -> false;;

let head = fun l -> match l with Cons (x,s) -> x;; 
let tail = fun l -> match l with Cons (x,s) -> s;;
                                
let insert_head = fun l -> fun x -> match l with Cons (h,t) -> Cons (x,l);;
let delete_head = fun l -> match l with Cons (h,t) -> Cons (t, Empty);;

let rec insert_tail = fun l -> fun x -> match l with Empty -> Cons (x,Empty)
| Cons (h,t) -> Cons (x, insert_tail (t) (x));;

let rec rev = fun l -> fun acc -> match l with Empty -> acc 
| Cons(h,t) -> rev (t) (insert_tail (acc) (h));;

let reverse = fun t -> rev (t) (Empty);;




