#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Let It Go

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Discussion 10 - Remove Lets | *Level:* Challenge
]

A `Let` can always be replaced by a `Call` of a `Lambda` that has one parameter.
For example, the Gleam code `let y = 3` followed by `y * y` has the same value as
`fn(y) { y * y }(3)`. Implement `remove_lets`, which takes an `Expr` and returns
an `Expr` with the same value that contains no `Let`. Any `Expr` can contain a
`Let`: the `value` or `body` of another `Let`, an operand, a function body, and
so on.

```gleam
import gleam/list

pub type Expr {
  Var(String)
  LiteralInt(Int)
  Call(fn_expr: Expr, operands: List(Expr))
  Lambda(params: List(String), body: Expr)
  Let(name: String, value: Expr, body: Expr)
}

pub fn remove_lets(e: Expr) -> Expr {
  case e {
    Var(_) | LiteralInt(_) -> e
    Call(fn_expr, operands) ->
      Call(remove_lets(fn_expr), list.map(operands, _______))  // (a)
    Lambda(params, body) -> Lambda(params, _______)            // (b)
    Let(name, value, body) ->
      Call(Lambda([_______], _______), [_______])              // (c), (d), (e)
  }
}

let square = Call(Var("*"), [Var("y"), Var("y")])
assert remove_lets(Let("y", LiteralInt(3), square))
  == Call(Lambda(["y"], square), [LiteralInt(3)])
assert remove_lets(Lambda(["x"], Let("y", Var("x"), square)))
  == Lambda(["x"], Call(Lambda(["y"], square), [Var("x")]))
```

#part(points: 2)[
  Fill in blanks (a) and (b).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(a)#h(0.6em)])[`remove_lets`],
    answer_box(width: 100%, pre: [(b)#h(0.6em)])[`remove_lets(body)`],
  )
]

#part(points: 1)[
  Fill in blank (c).

  #multi-choice(
    cols: 4,
    none-above: false,
    correct()[`name`], [`value`], [`body`], [`"name"`],
  )
]

#part(points: 2)[
  Fill in blanks (d) and (e).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(d)#h(0.6em)])[`remove_lets(body)`],
    answer_box(width: 100%, pre: [(e)#h(0.6em)])[`remove_lets(value)`],
  )
]

#part(points: 2)[
  Let `before` be `Let("y", LiteralInt(3), square)` and `after` be
  `remove_lets(before)`. For each one, how many calls are made to `eval` and to
  `apply` when it is evaluated? Assume `*` is a built-in function.

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    row-gutter: 1.2em,
    answer_box(width: 100%, pre: [`before`, `eval`#h(0.6em)])[`6`],
    answer_box(width: 100%, pre: [`before`, `apply`#h(0.6em)])[`1`],
    answer_box(width: 100%, pre: [`after`, `eval`#h(0.6em)])[`7`],
    answer_box(width: 100%, pre: [`after`, `apply`#h(0.6em)])[`2`],
  )
]

// Solution notes:
// Every case that contains Exprs recurses on them: the operands and fn_expr of
// a Call, the body of a Lambda, and both the value and body of a Let. A Let
// becomes a Call of a Lambda whose parameter is the Let's name, whose body is
// the (converted) Let body, and whose single operand is the (converted) value.
// The Let evaluates as Let, 3, then the body (4 evals), and applies only *, so
// 6 evals and 1 apply. The Call of a Lambda evaluates the Call, the Lambda, 3,
// then the body (4 evals), and applies the lambda and *, so 7 evals and 2
// applies.
