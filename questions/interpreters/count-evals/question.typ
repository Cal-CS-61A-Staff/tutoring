#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Evals All the Way Down

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Fall 2015 Final - Question 6(c) and Summer 2016 Final - Question 6(c) | *Level:* Challenge
]

Implement `count_evals`, which takes an `Expr` and returns how many calls are
made to `eval` when it is evaluated. Assume the expression never applies a
`UserFn`, so every function it calls is a built-in function. Only five variants
of `Expr` are shown.

```gleam
import gleam/int
import gleam/list

pub type Expr {
  Var(String)
  LiteralInt(Int)
  Call(fn_expr: Expr, operands: List(Expr))
  Lambda(params: List(String), body: Expr)
  Let(name: String, value: Expr, body: Expr)
}
pub fn count_evals(e: Expr) -> Int {
  case e {
    Var(_) | LiteralInt(_) -> 1
    Lambda(_, _) -> _______                                  // (a)
    Call(fn_expr, operands) ->
      1 + _______ + int.sum(list.map(operands, _______))     // (b), (c)
    Let(_, value, body) -> 1 + _______ + _______             // (d), (e)
  }
}
let square = Call(Var("*"), [Var("y"), Var("y")])
assert count_evals(Var("y")) == 1
assert count_evals(Lambda(["x"], square)) == 1
assert count_evals(Call(Var("+"), [LiteralInt(1), LiteralInt(2)])) == 4
assert count_evals(Let("y", LiteralInt(3), square)) == 6
```

#part(points: 2)[
  Fill in blanks (a) and (b).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(a)#h(0.6em)])[`1`],
    answer_box(width: 100%, pre: [(b)#h(0.6em)])[`count_evals(fn_expr)`],
  )
]

#part(points: 1)[
  Fill in blank (c). Select *all* that apply.

  #multi-select(
    cols: 2,
    none-above: false,
    correct()[`count_evals`],
    [`count_evals(operands)`],
    correct()[`fn(o) { count_evals(o) }`],
    [`fn(o) { 1 }`],
    [`list.length`],
  )
]

#part(points: 2)[
  Fill in blanks (d) and (e).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(d)#h(0.6em)])[`count_evals(value)`],
    answer_box(width: 100%, pre: [(e)#h(0.6em)])[`count_evals(body)`],
  )
]

#part(points: 1)[
  `count_evals` is wrong for some expressions that apply a `UserFn`. For which of
  these expressions, in an environment where `square` is a global user-defined
  function, is the number it returns *less than* the number of calls made to
  `eval`? Select *all* that apply.

  #multi-select(
    cols: 1,
    none-above: false,
    correct()[`Call(Var("square"), [LiteralInt(2)])`],
    [`Call(Var("+"), [LiteralInt(1), LiteralInt(2)])`],
    correct()[`Call(Lambda(["x"], Var("x")), [LiteralInt(5)])`],
    [`Lambda(["x"], Call(Var("square"), [Var("x")]))`],
    correct()[`Let("f", Lambda(["x"], Var("x")), Call(Var("f"), [LiteralInt(1)]))`],
  )
]

// Solution notes:
// Each expression costs one eval for itself plus the evals for its
// subexpressions that eval actually reaches. A Lambda's body is not evaluated
// until the function is applied, so a Lambda counts only for itself. A Call
// evaluates its fn_expr and every operand.
// The last part: applying a UserFn evaluates its body, which count_evals does
// not count. That happens for square(2), for the Lambda that is called
// immediately, and for f in the Let body. The Lambda that wraps a call to
// square is never applied, so its body is never evaluated.
//
// Adapted from the eval and apply counting questions on the Scheme final.
