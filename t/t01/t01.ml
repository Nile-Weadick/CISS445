(*
    File: t01.ml
    Name: Nile Weadick
*)

exception IgnoreCase;;
exception NotImplemented;;

(**===============================================================**)
(**Board Functions**)
(**Array of moves for board**)
let moves = fun n -> Array.make (n * n) ' ';;
(**Display board borders given variable size**)
let displayBorder = fun n ->
for i = 1 to n do
    print_string "+-"
done;
print_string "+\n"
;;
(**Uses board borders to display full board**)
let displayBoard = fun b -> fun n ->
displayBorder n; 
print_string "|";
for i = 1 to (Array.length b) do
    Printf.printf("%c|") b.(i - 1);
    if (i mod n = 0) 
    then (print_string "\n"; displayBorder n; 
        if (i != Array.length b) 
        then print_string "|")
done
;;
(**Determine if game board is full or not**)
let notFullBoard = fun b -> fun n ->
  Array.exists ((=) ' ') b
;;

(**===============================================================**)
(**Player Move Functions**)
let playerMove = fun move -> fun b ->
    b.(move) == ' '
;; 
let calcMove = fun row -> fun col -> fun n -> 
    (n * row) + col
;;
(**retrieve player moves**)
let rec getPlayerMove = fun b -> fun n ->
    print_string "ROW: ";
    let row = read_int () in
    print_string "COLUMN: ";
    let col = read_int () in
    let move = calcMove row col n in
    if (playerMove move b) then
      b.(move) <- 'X'
    else
      begin
        print_string "MOVE INVALID. TRY AGAIN.\n";
        getPlayerMove b n;
      end
;;

(**===============================================================**)
(**check for O Functions**)
let rowO = fun b -> fun row -> fun n ->
    let o_exists = ref false in
    for i = n * row to (n * row + (n - 1)) do
      if b.(i) = 'O' then
        o_exists := true;
    done;
    !o_exists
;;
let colO = fun b -> fun col -> fun n ->
    let o_exists = ref false in
    let arr_index = ref 0 in
    for i = 0 to (n - 1) do
    arr_index := (i * n + col);
    if (b.(!arr_index) = 'O') then
        o_exists := true;
    done;
    !o_exists
;;
let diagrO = fun b -> fun n ->
    let temp = Array.make n ' ' in
    let row = ref 0 in
    for i = 0 to (n * n - 1) do
        if (i mod (n + 1) = 0) then
        begin
            temp.(!row) <- b.(i);
            row := !row + 1;
        end
    done;
    Array.exists ((=) 'O') temp
;;
let diagonalO = fun b -> fun n ->
    let temp = Array.make n ' ' in
    let row = ref 0 in
    for i = 0 to (n * n - 1) do
      if (i mod (n - 1) = 0 && (i != 0) && (i != (n * n - 1))) then
        begin
          temp.(!row) <- b.(i);
          row := !row + 1;
        end
    done;
    Array.exists ((=) 'O') temp
;;

(**===============================================================**)
(**check for X Functions**)
let rowX = fun b -> fun row -> fun n ->
    let x_exists = ref false in
    for i = n * row to ((n * row) + (n - 1)) do
      if (b.(i) = 'X') then
        x_exists := true;
    done;
    !x_exists
;;
let colX = fun b -> fun col -> fun n ->
    let x_exists = ref false in
    let arr_index = ref 0 in
    for i = 0 to (n - 1) do
      arr_index := (i * n + col);
      if (b.(!arr_index) = 'X') then
        x_exists := true;
    done;
    !x_exists
;;
let diagonalX = fun b -> fun n -> 
    let temp = Array.make n ' ' in
    let row = ref 0 in
    for i = 0 to (n * n - 1) do
      if (i mod (n - 1) = 0 && (i != 0) && (i != (n * n - 1))) then
        begin
          temp.(!row) <- b.(i);
          row := !row + 1;
        end
    done;
    Array.exists ((=) 'X') temp
;;
  let diagrX = fun b -> fun n ->
    let temp = Array.make n ' ' in
    let row = ref 0 in
    for i = 0 to (n * n - 1) do
      if (i mod (n + 1) = 0) then
        begin
          temp.(!row) <- b.(i);
          row := !row + 1;
        end
    done;
    Array.exists ((=) 'X') temp
;;

(**===============================================================**)
(**Check for Win functions**)
let rowWin = fun b -> fun row -> fun n ->
    let win = ref false in
    let o_count = ref 0 in
    let start_point = row * n in
    let end_point = start_point + (n - 1) in
    for i = start_point to end_point do
      if b.(i) = 'O' then
        o_count := !o_count + 1;
    done;
    if (!o_count == (n - 1) && (rowX b row n = false)) then
      win := true;
    !win
;;
  let colWin = fun b -> fun col -> fun n ->
    let win = ref false in
    let o_count = ref 0 in
    let arr_index = ref 0 in
    for i = 0 to (n - 1) do
      arr_index := (i * n + col);
      if (b.(!arr_index) = 'O') then
        o_count := !o_count + 1;
    done;
    if (!o_count == (n - 1) && (colX b col n = false)) then
      win := true;
    !win
;;
  let diagrWin = fun b -> fun n ->
    let win = ref false in
    let temp = Array.make n ' ' in
    let row = ref 0 in
    for i = 0 to (n * n - 1) do
      if (i mod (n + 1) = 0) then
        begin
          temp.(!row) <- b.(i);
          row := !row + 1;
        end
    done;
    let o_count = ref 0 in
    for i = 0 to n - 1 do
      if (temp.(i) = 'O') then
        o_count := !o_count + 1;
    done;
    if (!o_count == n - 1 && (diagrX b n = false)) then
      win := true;
    !win
;;
let diagonalWin = fun b -> fun n -> 
    let win = ref false in
    let temp = Array.make n ' ' in
    let row = ref 0 in
    for i = 0 to (n * n - 1) do
      if (i mod (n - 1) = 0 && (i != 0) && (i != (n * n - 1))) then
        begin
          temp.(!row) <- b.(i);
          row := !row + 1;
        end
    done;
    let o_count = ref 0 in
    for i = 0 to n - 1 do
      if (temp.(i) = 'O') then
        o_count := !o_count + 1;
    done;
    if (!o_count == n - 1 && (diagonalX b n = false)) then
      win := true;
    !win
;;
(**===============================================================**)
let checkRow = fun b -> fun row -> fun n -> fun c ->
  let temp = Array.sub b (row * n) n in
  Array.for_all ((=) c) temp
;;
let checkCol = fun b -> fun col -> fun n -> fun c ->
  let temp = Array.make n ' ' in
  let j = ref 0 in
  for i = 0 to (n * n - 1) do
    if ((i mod n) = col) then
      begin
        temp.(!j) <- b.(i);
        j := !j + 1;
      end
  done;
  Array.for_all ((=) c) temp
;;
let checkDiagRight = fun b -> fun n -> fun c -> 
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to (n * n - 1) do
    if (i mod (n + 1) = 0) then
      begin
        temp.(!row) <- b.(i);
        row := !row + 1;
      end
  done;
  Array.for_all ((=) c) temp
;;
let checkDiagLeft = fun b -> fun n -> fun c -> 
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to ((n * n) - 1) do
    if (i mod (n - 1) = 0 && (i != 0) && i != ((n * n) - 1)) then
       begin
         temp.(!row) <- b.(i);
         row := !row + 1;
       end
  done;
  Array.for_all ((=) c) temp
;;

(**===============================================================**)
(**Check for Block functions* *)
let rowBlock = fun b -> fun row -> fun n ->
    let make_block = ref false in
    let x_count = ref 0 in
    let start_point = row * n in
    let end_point = start_point + (n - 1) in
    for i = start_point to end_point do
      if b.(i) = 'X' then
        x_count := !x_count + 1;
    done;
    if (!x_count == (n - 1) && (rowO (b) (row) (n)) = false) then
      make_block := true;
    !make_block
;;
let colBlock = fun b -> fun col -> fun n ->
    let make_block = ref false in
    let x_count = ref 0 in
    let arr_index = ref 0 in
    for i = 0 to (n - 1) do
        arr_index := (i * n + col);
        if (b.(!arr_index) = 'X') then
        x_count := !x_count + 1;
    done;
    if (!x_count == (n - 1) && (colO b col n) = false) then
        make_block := true;
    !make_block
;;
let diagonalBlock = fun b -> fun n ->
    let make_block = ref false in
    let temp = Array.make n ' ' in
    let row = ref 0 in
    for i = 0 to (n * n - 1) do
        if (i mod (n - 1) = 0 && (i != 0) && (i != (n * n - 1))) then
        begin
            temp.(!row) <- b.(i);
            row := !row + 1;
        end
    done;
    let x_count = ref 0 in
    for i = 0 to n - 1 do
        if (temp.(i) = 'X') then
        x_count := !x_count + 1;
    done;
    if (!x_count == n - 1 && (diagonalO b n = false)) then
        make_block := true;
    !make_block
;;
let diagrBlock  = fun b -> fun n ->
    let make_block = ref false in
    let temp = Array.make n ' ' in
    let row = ref 0 in
    for i = 0 to (n * n - 1) do
      if (i mod (n + 1) = 0) then
        begin
          temp.(!row) <- b.(i);
          row := !row + 1;
        end
    done;
    let x_count = ref 0 in
    for i = 0 to n - 1 do
      if (temp.(i) = 'X') then
        x_count := !x_count + 1;
    done;
    if (!x_count == n - 1 && (diagrO b n = false)) then
      make_block := true;
    !make_block
;;

(**===============================================================**)
(**winning Move Functions**)
let winRowMove = fun b -> fun row -> fun n ->
    let win_spot = ref 0 in
    for i = (row * n) to ((row * n) + (n - 1)) do
      if b.(i) == ' ' then
        win_spot := i;
    done;
    b.(!win_spot) <- 'O'
;;
let winColMove = fun b -> fun col -> fun n ->
    let win_spot = ref 0 in
    let arr_index = ref 0 in
    for i = 0 to (n - 1) do
      arr_index := (i * n + col);
      if (b.(!arr_index) = ' ') then
        win_spot := !arr_index;
    done;
    b.(!win_spot) <- 'O'
;;
let winDiagrMove = fun b -> fun n ->
    let win_spot = ref 0 in
    let arr_index = ref 0 in
    let j = ref 0 in
    for i = 0 to n - 1 do
      arr_index := (i * n + !j);
      j := !j + 1;
      if (b.(!arr_index) = ' ') then
        win_spot := !arr_index;
    done;
    b.(!win_spot) <- 'O'
;;
let winDiagonalMove = fun b -> fun n ->
    let win_spot = ref 0 in
    let arr_index = ref 0 in
    let j = ref (n - 1) in
    for i = 0 to n - 1 do
      arr_index := (i * n + !j);
      j := !j - 1;
      if (b.(!arr_index) = ' ') then
        win_spot := !arr_index;
    done;
    b.(!win_spot) <- 'O'
;;

(**===============================================================**)
(**Blocking Move Functions**)
let rowBlockMove = fun b -> fun row -> fun n ->
    let block_spot = ref 0 in
    for i = (row * n) to ((row * n) + (n - 1)) do
        if b.(i) = ' ' then
        block_spot := i;
    done;
    b.(!block_spot) <- 'O'
;;
let colBlockMove = fun b -> fun col -> fun n ->
    let block_spot = ref 0 in
    let arr_index = ref 0 in
    for i = 0 to (n - 1) do
      arr_index := (i * n + col);
      if (b.(!arr_index) = ' ') then
        block_spot := !arr_index;
    done;
    b.(!block_spot) <- 'O'
;;
let diagrBlockMove = fun b -> fun n ->
    let block_spot = ref 0 in
    let arr_index = ref 0 in
    let j = ref 0 in
    for i = 0 to n - 1 do
      arr_index := (i * n + !j);
      j := !j + 1;
      if (b.(!arr_index) = ' ') then
        block_spot := !arr_index;
    done;
    b.(!block_spot) <- 'O'
;;
let diagonalBlockMove = fun b -> fun n ->
    let block = ref 0 in
    let arr_index = ref 0 in
    let j = ref (n - 1) in
    for i = 0 to n - 1 do
      arr_index := (i * n + !j);
      j := !j - 1;
      if (b.(!arr_index) = ' ') then
        block := !arr_index;
    done;
    b.(!block) <- 'O'
;;

(**===============================================================**)
(**Computer Functions**)
(**How computer finds win move**)
let computerWin = fun b -> fun n ->
    let win_fun_num = ref 0 in
    let win_spot = ref 0 in
    for i = 0 to n - 1 do
      if (rowWin b i n) then
        begin
          win_fun_num := 1;
          win_spot := (i);
        end;
      if (colWin b i n) then
        begin
          win_fun_num := 2;
          win_spot := (i);
        end;
      if (diagrWin b n) then
        begin
          win_fun_num := 3;
          win_spot := (i);
        end;
      if (diagonalWin b n) then
        begin
          win_fun_num := 4;
          win_spot := (i);
        end;
      print_int i;
    done;
    if (!win_fun_num == 1) then
      winRowMove b !win_spot n;
    if (!win_fun_num == 2) then
      winColMove b !win_spot n;
    if (!win_fun_num == 3) then
      winDiagrMove b n;
    if (!win_fun_num == 4) then
      winDiagonalMove b n;
;;
(**How compuetr blocks**)
let computerBlock = fun b -> fun n ->
    let block_fun_num = ref 0 in
    let block_spot = ref 0 in
    for i = 0 to n - 1 do
      if (rowBlock b i n) then
        begin
          block_fun_num := 1;
          block_spot := (i);
        end;
      if (colBlock b i n) then
        begin
          block_fun_num := 2;
          block_spot := (i);
        end;
      if (diagrBlock b n) then
        begin
          block_fun_num := 3;
          block_spot := (i);
        end;
      if (diagonalBlock) b n then
        begin
          block_fun_num := 4;
          block_spot := (i);
        end;
    done;
    if (!block_fun_num == 1) then
      rowBlockMove b !block_spot n;
    if (!block_fun_num == 2) then
      colBlockMove b !block_spot n;
    if (!block_fun_num == 3) then
      diagrBlockMove b n;
    if (!block_fun_num == 4) then
      diagonalBlockMove b n;
;;
(**Determine if computers has win move**)
let computerWinMoveTest = fun b -> fun n ->
    let win = ref false in
    for i = 0 to n - 1 do
      if ((rowWin b i n) || (colWin b i n)
          || (diagrWin b n) || (diagonalWin b n)) then
        win := true;
    done;
    !win
;;
(**Test if computer needs to block**)
let computerBlockMoveTest = fun b -> fun n ->
    let block_check = ref false in
    for i = 0 to n - 1 do
      if ((rowBlock b i n) || (colBlock b i n)
          || (diagrBlock b n) || (diagonalBlock b n)) then
        block_check := true;
    done;
    !block_check
;;
(**make random open spot move**)
let randomMove = fun b -> fun n ->
    let temp = Array.make (n * n) 0 in
    let empty_count = ref 0 in
    for i = 0 to (n * n - 1) do
      if b.(i) = ' ' then
        begin
          temp.(!empty_count) <- i; 
          empty_count := !empty_count + 1;
        end;
    done;
    let move = Random.int !empty_count in
    b.(temp.(move)) <- 'O'
;;
(**Perform Computers move**)
let computerMove = fun b -> fun n -> 
    if (computerWinMoveTest b n) then
      (computerWin b n;)
    else if (computerBlockMoveTest b n) then
      (computerBlock b n;)
    else
      (randomMove b n;)
;;
(**===============================================================**)
(**function to detect for a win**)
let findWinMove = fun b -> fun n -> fun c -> 
  let win = ref false in
  for i = 0 to (n - 1) do
    begin
      if (checkRow b i n c) then win := true;
      if (checkCol b i n c) then win := true;
      if (checkDiagRight b n c) then win := true;
      if (checkDiagLeft b n c) then win := true;
    end
  done;
  !win;;
(**===============================================================**)
(**Main Function**)
let main = fun () -> 
(**variables**)
let game = ref false in
let computer = ref true in
let _ = print_string "ENTER BOARD SIZE : "in
let n = read_int() in
let board = moves n in
getPlayerMove board n;
(** Begin Game**)
while not !game do 
  displayBoard board n;
  if (notFullBoard board n = false) then
  game := true;
  (* Player win? *)
  if (findWinMove board n 'X') then
    game := true;
  (* computer win? *)
  if (findWinMove board n 'O') then
    game := true;
  (* Current Tie*)
  if (not !game) then
    if (!computer) then
      (* Do computers turn *)
        (computerMove board n;
        computer := false;)
    else if (not !computer) then
        (getPlayerMove board n;
        computer := true;)
done;
  print_string "GAME OVER.\n";
  if (findWinMove board n 'X') then
    print_string "YOU WIN.\n";
  if (findWinMove board n 'O') then
    print_string "You LOSE.\n";
;;

main ();;
