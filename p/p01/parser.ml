(**parser**)

exception TreeSTackTooSmall;;

let order tok = match tok with Plus_tok -> 1 
                             | Mult_tok -> 2
                             | _ -> 999
;;

let push_tree tree_stl op_stk = 
  let _ = print_string "in push_tree ..\n" in match op_stk with Plus_tok::op_stk - > (Plus (t2,t1):: tree_stk,op_stk)
;;