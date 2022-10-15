open Base

type label = string [@@deriving sexp]
type size
type temp = string [@@deriving sexp]

type stm =
  | SEQ of stm * stm
  | LABEL of label
  | JUMP of exp * label list
  | CJUMP of relop * exp * exp * label * label
  | MOVE of exp * exp
  | EXP of exp
[@@deriving sexp]

and exp =
  | BINOP of binop * exp * exp
  | MEM of exp
  | TEMP of temp (* TODO: use real temp type *)
  | ESEQ of stm * exp
  | NAME of label
  | CONST of int
  | CALL of exp * exp list
[@@deriving sexp]

and binop =
  | PLUS
  | MINUS
  | MUL
  | DIV
  | AND
  | OR
  | LSHIFT
  | RSHIFT
  | ARSHIFT
  | XOR

and relop = EQ | NE | LT | GT | LE | GE | ULT | ULE | UGT | UGE