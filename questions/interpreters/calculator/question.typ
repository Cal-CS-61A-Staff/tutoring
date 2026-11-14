#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Calculator Check

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Homework 8 | *Level:* Regular
]

This question uses the calculator from Homework 8. Arithmetic works on integers,
so `/` drops any remainder, as in `7 / 2` is `3`. Assume `eval`, `make_fn`, and
`apply` are implemented correctly. `make_fn` reports duplicate parameter names
before it looks for unbound variables.

```gleam
pub type Operator { Add Sub Mul Div }
pub type Expr {
  Var(String)
  N(Int)
  Binary(operator: Operator, left: Expr, right: Expr)
}
pub type UserFn {
  UserFn(params: List(String), body: Expr)
}
pub type EvalError {
  NameNotFound(String)
  WrongArgumentCount(want: Int, got: Int)
}
pub type FnError {
  DuplicateParameterNames(List(String))
  VariablesNotBound(List(String))
}

pub fn eval(expr: Expr, bindings: Dict(String, Int)) -> Result(Int, EvalError)
pub fn make_fn(params: List(String), body: Expr) -> Result(UserFn, FnError)
pub fn apply(f: UserFn, args: List(Int)) -> Result(Int, EvalError)

let bindings = dict.from_list([#("x", 7)])
```

#part(points: 1)[
  What does this evaluate to?

  ```gleam
  eval(Binary(Sub, N(10), Binary(Div, Var("x"), N(2))), bindings)
  ```

  #answer_box(width: 50%)[`Ok(7)`]
]

#part(points: 1)[
  What does this evaluate to?

  ```gleam
  eval(Binary(Add, Var("z"), Var("y")), bindings)
  ```

  #answer_box(width: 70%)[`Error(NameNotFound("z"))`]
]

#part(points: 1)[
  What does this evaluate to?

  ```gleam
  apply(UserFn(["a"], Binary(Mul, Var("a"), Var("b"))), [4])
  ```

  #answer_box(width: 70%)[`Error(NameNotFound("b"))`]
]

#part(points: 1)[
  What does this evaluate to?

  ```gleam
  make_fn(["x", "x"], Var("y"))
  ```

  #answer_box(width: 80%)[`Error(DuplicateParameterNames(["x"]))`]
]

// Solution notes:
// 7 / 2 is 3, so the expression is 10 - 3.
// When both operands of a Binary fail, eval matches Error(e), _ first, so the
// error for the left operand, z, is the one returned.
// apply has one argument for one parameter, so it evaluates the body with a
// bound to 4. The left operand is Ok(4), and b is not bound.
// make_fn finds the duplicate x before it checks whether y is bound, so
// VariablesNotBound is never returned.
//
// Adapted from Homework 8: Interpreters.
