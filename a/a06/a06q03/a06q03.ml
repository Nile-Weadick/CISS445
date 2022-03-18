(*
    File: smaug
    Name: a06q03.ml
    Nile Weadick
*)

exception IgnoreCase;;
exception NotImplemented;;

(**3**)

type 'a btree = Empty
| Node of 'a btree * 'a * 'a btree
;;

let x = Node(
            Node(
                  Empty,
                  1,
                  Node (Empty, 3, Empty)
                  ),
            5,
            Node(
                Node (Empty, 6, Empty),
                10,
                Node(
                    Node(Empty, 11, Empty),
                    15,
                    Empty
                  )
              )
            )
;;

let is_leaf = fun t -> match t with Node (Empty,x,Empty) -> true 
| Empty -> false
| Node (l,root,Empty) -> false
| Node (Empty,root,r) -> false
| Node (l,root,r) -> false;;

let rec size t = match t with Empty -> 0
| Node (left,root,right) -> 1 + (size left) + (size right);;

let rec height t = match t with Empty -> -1
| Node (l,root,r) -> if(height (l) >= height (r)) then 1 + height(l) else 1+height(r);;

let rec max = fun t -> match t with Empty -> () | Node (l,root,r) -> if root > max(l) then root;;



