#import "../../../61c_exam/lib.typ": *

#metadata("interpreters-reference") <titled-question>

#align(center)[
  #text(size: 15pt, weight: "bold")[Animator Evaluator Reference]
]

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  This page summarizes the Animator project's evaluator, which is written in
  Gleam and evaluates a subset of Gleam. Some details are simplified. Operators
  such as `+` and `>` are the names of built-in functions, so `x > 5` is a
  `Call`. A name with a dot, such as `list.length`, is one `Var`, not a field
  access.
]

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  [
    *Expressions*

    ```text
    pub type Expr {
      Var(String)
      LiteralBool(Bool)
      LiteralInt(Int)
      LiteralList(elems: List(Expr),
                  rest: Option(Expr))
      Call(fn_expr: Expr, operands: List(Expr))
      Lambda(params: List(String), body: Expr)
      Case(subject: Expr, arms: List(Arm))
      Let(name: String, value: Expr, body: Expr)
      FieldAccess(record: Expr, field: String)
    }
    ```

    ```text
    x            Var("x")
    f(5)         Call(Var("f"), [LiteralInt(5)])
    fn(x) { x }  Lambda(["x"], Var("x"))
    [1, ..s]     LiteralList([LiteralInt(1)],
                             Some(Var("s")))
    let y = 3    Let("y", LiteralInt(3),
    y                 Var("y"))
    ```

    *Values*

    ```text
    pub type Value {
      VBool(Bool)
      VInt(Int)
      VList(List(Value))
      VData(tag: String, fields: List(Value))
      VFunc(Callable)
    }

    pub type Callable {
      Builtin(name: String, num_args: Int,
              run: fn(List(Value)) ->
                   Result(Value, EvalError))
      UserFn(name: String, params: List(String),
             body: Expr, env: Env)
    }
    ```

    A record is a `VData` whose `tag` is the name of its type and whose
    `fields` are its values in order, so `Pair(1, 2)` evaluates to
    `VData("Pair", [VInt(1), VInt(2)])`.
  ],
  [
    *Environments*

    An `Env` is a chain of frames. `Local(bindings, parent)` is a new frame
    whose `parent` is the next frame in the chain.

    - `lookup(env, name)` returns `Ok(value)` for the first frame with the
      name, or an `Error`.
    - `extend(env, [#(name, value)])` returns an environment that also binds
      the name.

    *Evaluating*

    ```text
    fn eval(expr: Expr, env: Env)
        -> Result(Value, EvalError)

    fn apply(f: Value, args: List(Value))
        -> Result(Value, EvalError)
    ```

    - `Var`: look up the name. A literal: make its `Value`.
    - `Lambda`: make a `UserFn` with the current `env`. The body is *not*
      evaluated.
    - `Call`: `eval` the `fn_expr`, then `eval` each operand from left to
      right, then call `apply`.
    - `Case`: `eval` the subject, find the first arm whose pattern matches,
      then `eval` that arm's body. Patterns are not evaluated.
    - `Let`: `eval` the value, bind the name, then `eval` the body.
    - `apply` on a `Builtin`: call `run` on the arguments. No `eval`.
    - `apply` on a `UserFn`: make a `Local` frame that binds each parameter to
      its argument, then `eval` the body in that frame.

    *Useful functions*

    - `result.try(r, f)` calls `f` on `v` if `r` is `Ok(v)`. Otherwise it
      returns the `Error`. `use v <- result.try(r)` runs the rest of the
      block as `f`.
    - `list.try_map(xs, f)` applies `f` to each element and stops at the first
      `Error`.
    - `list.zip(xs, ys)` pairs up elements; `dict.from_list(pairs)` makes a
      dict.
    - `int.sum(xs)` adds up a list of integers.
  ],
)
