#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Fill In the Evaluator

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Lecture 30 - Gleam Evaluation | *Level:* Regular-Hard
]

Complete the `eval` and `apply` functions of the Animator project's evaluator.
Only some variants of `Expr` are shown. Use the reference page.

```gleam
import gleam/dict
import gleam/list
import gleam/result

pub fn eval(expr: Expr, env: Env) -> Result(Value, EvalError) {
  case expr {
    LiteralInt(n) -> Ok(VInt(n))
    Var(name) -> lookup(env, name)
    Lambda(params, body) ->
      Ok(VFunc(UserFn("lambda", params, body, _______)))      // (a)
    Let(name, value, body) -> {
      use v <- result.try(eval(_______, env))                 // (b)
      eval(_______, extend(env, [#(name, v)]))                // (c)
    }
    Call(fn_expr, operands) -> {
      use f <- result.try(eval(fn_expr, env))
      use args <- result.try(list.try_map(operands, _______)) // (d)
      apply(f, args)
    }
    _ -> todo // the other variants are omitted
  }
}

pub fn apply(f: Value, args: List(Value)) -> Result(Value, EvalError) {
  case f {
    VFunc(Builtin(_, _, run)) -> run(args)
    VFunc(UserFn(_, params, body, parent)) ->
      eval(body, Local(dict.from_list(list.zip(params, args)), _______)) // (e)
    _ -> todo // the other values are omitted
  }
}
```

#part(points: 2)[
  Fill in blanks (a) and (e).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(a)#h(0.6em)])[`env`],
    answer_box(width: 100%, pre: [(e)#h(0.6em)])[`parent`],
  )
]

#part(points: 2)[
  Fill in blanks (b) and (c).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(b)#h(0.6em)])[`value`],
    answer_box(width: 100%, pre: [(c)#h(0.6em)])[`body`],
  )
]

#part(points: 2)[
  Fill in blank (d).

  #answer_box(width: 100%, pre: [(d)#h(0.6em)])[`fn(operand) { eval(operand, env) }`]
]

// Solution notes:
// A Lambda captures the current env, which is what makes the evaluator
// lexically scoped. apply later makes a frame whose parent is that stored env
// (parent), not the env of the call. A Let evaluates its value in env, then
// evaluates its body in an environment that also binds the name. Each operand
// is evaluated in env, so (d) is a function that calls eval on one operand.
// Passing a bare `eval` would not type check, since eval takes two arguments.
//
// Adapted from the Gleam Evaluation slide in Lecture 30 and the Animator
// project's evaluator.
