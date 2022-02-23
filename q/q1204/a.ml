let f =
  fun xs ->
  fun n ->
  match xs with
    [] -> []
  | x::xs -> (x + n)::(f xs (n + 1))
;;
                                     
