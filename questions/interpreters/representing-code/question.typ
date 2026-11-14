#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Code as Data

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Lecture 30 and Discussion 10 | *Level:* Regular
]

In the Animator project's evaluator, Gleam code is represented by an `Expr`, and
the result of evaluating it is represented by a `Value`. Use the reference page.
Operators such as `*` are names of built-in functions.

#part(points: 1)[
  Write the `Expr` that represents `f(x, 2) * 3`.

  #answer_box(width: 100%, height: 48pt)[`Call(Var("*"), [Call(Var("f"), [Var("x"), LiteralInt(2)]), LiteralInt(3)])`]
]

#part(points: 1)[
  Write the `Expr` that represents `fn(n) { n * n }`.

  #answer_box(width: 100%, height: 36pt)[`Lambda(["n"], Call(Var("*"), [Var("n"), Var("n")]))`]
]

#part(points: 1)[
  Write the `Value` that the expression `Pair(7, [True])` evaluates to.

  #answer_box(width: 100%)[`VData("Pair", [VInt(7), VList([VBool(True)])])`]
]

#part(points: 1)[
  Write the Gleam expression that this `Expr` represents.

  ```text
  LiteralList([Var("a"), LiteralInt(2)], Some(Var("rest")))
  ```

  #answer_box(width: 50%)[`[a, 2, ..rest]`]
]

#part(points: 1)[
  Which of the following are `Value`s rather than `Expr`s? Select *all* that apply.

  #multi-select(
    cols: 1,
    none-above: false,
    correct()[`VInt(3)`],
    [`LiteralInt(3)`],
    [`Lambda(["x"], Var("x"))`],
    correct()[`VFunc(UserFn("lambda", ["x"], Var("x"), env))`],
    correct()[`VData("Point", [VInt(1), VInt(2)])`],
    [`Call(Var("Point"), [LiteralInt(1), LiteralInt(2)])`],
  )
]

// Solution notes:
// Operators are Calls of a Var, so f(x, 2) * 3 is a Call whose fn_expr is
// Var("*") and whose operands are the Call to f and LiteralInt(3). A record is
// a VData with the type's name as its tag and its field Values in order. A
// LiteralList with a rest is written with .. before the rest expression. A
// Lambda is an Expr; evaluating it produces a VFunc holding a UserFn. Call and
// the Literal variants are Exprs.
//
// Adapted from the "How is this represented in the Animator evaluator?" final
// exam questions in Lecture 30 and Discussion 10.
