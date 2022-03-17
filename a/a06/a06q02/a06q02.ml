(*
    File: smaug
    Name: a06q02.ml
    Nile Weadick
*)

exception IgnoreCase;;
exception NotImplemented;;

(**2**)

type token = Inttok of int
| Plustok
| Minustok
| Multtok
| Divtok
;;

Cons ((Inttok 1),
Cons ((Inttok 2),
Cons ((Inttok 3),
Cons ((Inttok 5),
Cons (Plustok,
Cons (Minustok,
Cons ((Inttok 4),
Cons (Minustok,
Cons (Multtok, Empty)
)
)
)
)
)
)
)
)
;;