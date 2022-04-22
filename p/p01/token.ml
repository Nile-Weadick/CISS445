(**token.ml**)

type token = 
    Int_tok of int
  | Plus_tok 
  | Mult_tok 
;;

let token_to_string tok = match tok with 
    Int_tok x -> "Int " ^ (string_of_int x)
  | Plus_tok -> "Plus_tok"
  | Mult_tok -> "Mult_tok"
;;

let print_token t = 
  Printf.printf "%s" (token_to_string t)
;;

let token_list_to_string toks = 
  let rec token_list_to_string_ toks = 
    (
      match toks with 
        [] -> ""
      | [tok] -> token_to_string tok
      | tok::toks -> token_to_string tok ^ "; " ^ (token_list_to_string_ toks) 
    )
  in 
  "[" ^ (token_list_to_string_ toks) ^ "]"
;;


let print_tok_list toks = print_string (token_list_to_string toks);;

print_token (Int_tok 42);; 
print_string "\n";;
Printf.printf "%s" (token_list_to_string [Int_tok 42; Int_tok 3])
;;