(*
    File: smaug
    Name: a05q01.ml
    Nile Weadick
*)

exception IgnoreCase;;
exception NotImplemented;;

(**Tail rec examples**)
let rec rev2 = fun list -> fun revlist -> match list with [] -> revlist | x::xs -> rev2 (xs) (x::revlist);;
let rev = fun list -> rev2 list [];;

let rec len2 = fun list -> fun acc -> match list with [] -> acc | x::xs -> len2 (xs) (acc+1);;

(**Q1. Write a function seteq that returns true if two lists contains the same elements.**)
let rec seteq = fun list1 -> fun list2 -> match list1,list2 with [],[] -> "true" 
|[],list2 -> "false"
| list1,[] -> "false";
| x::xs,y::ys -> if x == y then seteq xs ys else "false";;

(**Q2. Write a function setsimplify that removes duplicate elements from a list as a set. The
relative position of the elements in the set must be retained. You must implement this using
tail recursion.**)
let remove_elt e l =
  let rec go l acc = match l with
    | [] -> List.rev acc
    | x::xs when e = x -> go xs acc
    | x::xs -> go xs (x::acc)
  in go l [];;

let setsimplify l =
  let rec go l acc = match l with
    | [] -> List.rev acc
    | x :: xs -> go (remove_elt x xs) (x::acc)
  in go l [];;

(**Q3. Write a function setintersect that returns the intersection of two lists as sets, i.e., the
list of elements in both lists. Duplicates must be removed. You must implement this using
tail recursion.**)

let rec element = fun list -> fun num -> match list with [] -> false | x::xs -> if num==x then true else element (xs) (num);;


let rec intersect = fun list1 -> fun list2 -> fun acc -> match list1,list2 with list1,[] -> []
| [],list2 -> []
| x::xs,y::ys -> if (element (list2) (x) == true) then x::intersect (xs) (list2) acc  else intersect (xs) (list2) acc;;

let setintersect = fun list1 -> fun list2 -> intersect list1 list2 [];;

(**Q4. Write a function setunion that returns the union of two lists as sets. There must not
be any duplicates.**)
let rec union = fun list1 -> fun list2 -> fun acc -> match list1,list2 with [],[] -> [] | [],list2 -> list2 | list1,[] -> list1 | x::xs,y::ys -> x::y::union (xs) (ys) (acc);;

let setunion = fun list1 -> fun list2 -> setsimplify (union (list1) (list2) ([]));;

(**Q5. Write a function setdiff that returns the difference of two lists as sets. Duplicates
must be removed.**)

let rec diff = fun list1 -> fun list2 -> fun acc -> match list1,list2 with [],[] -> [] 
| list1,[] -> list1 
| [],list2 -> acc
| x::xs,y::ys -> if (element (list2) (x) == true) then diff (xs) (list2) (acc) else x::diff (xs) (list2) (acc);;

let setdiff = fun list1 -> fun list2 -> diff (list1) (list2) ([]);;

(**Q6. Write a function powerset that returns the powerset of a list (as a set). The lists in
the return list may appear in any order and for each such list, the elements may be in any
order, but there must not be any duplicates. You may assume that the list passed in does
not have duplicates. You must implement this using tail recursion.**)
let rec power = fun list -> fun acc -> match list with [] -> []::acc
| x::xs -> list::[x]::power (xs) (acc);;

let powerset = fun list -> setsimplify(power (list) ([]));;

(**Q7. Write a function subsequence that returns true when a list (as a sequence) is a subsequence of another list (as a sequence). A list ys is a subsequence of another xs if the relative
positions of the elements in ys is the same as the relative positions in xs. For example, the
list
ys = [3;5;2]
is a subsequence of
xs = [1;3;5;4;2]
because in ys, 3 appears before 5 which app**)
let rec seq = fun list1 -> fun list2 -> fun acc -> match list1,list2 with [],list2 -> false 
|x::xs,y::ys -> if (element (list2) (x)== true) then true else seq (xs) (list2) (acc);; 

let subsequence = fun list1 -> fun list2 -> seq (list1) (list2) ([]);;

(**Q8. Write a function subsequences that returns a list of all possible subsequences of a list
(as a sequence) passed into the function. This is the same function as powerset except that
the list passed in may have duplicates, and any element of the return list is itself a list of
elements from the argument passed in with their relative positions retained.
**)
let rec power = fun list -> fun acc -> match list with [] -> []::acc
| x::xs -> list::[x]::power (xs) (acc);;

let subsequences = fun list -> power (list) ([]);;