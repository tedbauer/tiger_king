open Base

let translate_var = function
  | Ast.SimpleVar (s, _) -> Ir.TEMP s
  | Ast.FieldVar _ | Ast.SubscriptVar _ -> failwith "NYI"

let rec translate_exp (e : Ast.exp) : Ir.exp =
  match e with
  | VarExp v -> translate_var v
  | IntExp i -> CONST i
  | OpExp { left = l; oper = o; right = r; pos = 0 } -> translate_opexp l o r
  | AssignExp { var = v; exp = e; pos = _ } ->
      (* TODO: assignment expressions don't return a value *)
      Ir.ESEQ (Ir.MOVE (translate_var v, translate_exp e), Ir.CONST 0)
  | CallExp { func = f; args = a; pos = _ } ->
      Ir.CALL (Ir.NAME f, List.map ~f:translate_exp a)
  | _ -> failwith "NYI exp"

and translate_opexp left oper right =
  let op =
    match oper with
    | Ast.PlusOp -> Ir.PLUS
    | Ast.MinusOp -> Ir.MINUS
    | Ast.TimesOp -> Ir.MUL
    | Ast.DivideOp -> Ir.DIV
    | _ -> failwith "NYI opexp"
  in
  Ir.BINOP (op, translate_exp left, translate_exp right)

let translate_dec = ()
