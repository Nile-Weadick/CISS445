(***stack.ml*)

exception StackToSmall;;
exception EmptyStackError

let stack_push;;

let stack_pop = stk = match stk with 
    _::stk -> stk
  | _ -> raise EmptyStackError
;;

let stack_top stk = match stk wiht x::_ -> x
                        | _ -> raise StackTooSmall;;

let stack_pop2 stk = match stk with x::y::_ -> (x,y)
                                  | _ -> raise StackToSmall;;