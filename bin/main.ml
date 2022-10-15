open Tiger_king
open Base

(* gcd(x, y-x) *)
let test_exp1 =
  Ast.CallExp
    {
      func = "gcd";
      args =
        [
          Ast.VarExp (Ast.SimpleVar ("x", 0));
          Ast.OpExp
            {
              left = Ast.VarExp (Ast.SimpleVar ("y", 0));
              oper = Ast.MinusOp;
              right = Ast.VarExp (Ast.SimpleVar ("x", 0));
              pos = 0;
            };
        ];
      pos = 0;
    }

let () =
  let ir = Translate.translate_exp test_exp1 in
  [%sexp_of: Ir.exp] ir |> Sexp.to_string |> Stdio.print_endline
