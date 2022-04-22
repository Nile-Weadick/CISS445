(**lexer.mml**)


{ #use "token.ml" ;; }

let integer = ['1'-'9']['0'-'9']*

              rule lexer0 = parse
                integer as s { 
                (Int_tok (int_of_string s))::(lexer0 lexbuf)
              }
            | '+' {
                Plus_tok::(lexer0 lexbuf)
              }

            | '*' { 
                Mult_tok::(lexer0 lexbuf) 
              }
            | eof {
                
                []
              }
                
            | _ {
                lexer0 lexbuf
              }
                
                
let lexer s = lexer0 (Lexing.from_string s);;
;;
    