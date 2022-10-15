open Tiger_king

let () =
  let e = Ast.IntExp(5) in 
  let ir = Translate.translate_exp e in
 print_endline (Ir.string_of_exp ir)
