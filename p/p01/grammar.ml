type expr = Int of int 
          | Plus of expr* expr
          |Mult of expr * expr
;;

let rec expr_to_string e = match e with 
    Int x -> "Int_" ^ (String_of_int x)
  |Plus (e1,e2) -> "Plus (" ^ (expr_to_string e1) ^ "_" ^ (expr_to_string e2) ^ ")"
  |Mult (e1,e2) -> "Mult ..."
;;