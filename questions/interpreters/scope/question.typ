#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Scope It Out

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Spring 2019 Final - Question 5 | *Level:* Regular
]

The Animator project's evaluator uses lexical scope. Suppose we changed it to use
dynamic scope: the frame made when a function is applied would be a child of the
environment of the *call*, instead of the environment where the function was
defined.

For each expression below, write the value it returns under lexical scope and
under dynamic scope. If it would cause an error, write `Error`.

#part(points: 2)[
  Assume the following definitions are in the global environment. Evaluate `g()`.

  ```gleam
  const y = 5

  pub fn f(x: Int) -> Int {
    x * y
  }

  pub fn g() -> Int {
    let y = 20
    f(3)
  }
  ```

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [lexical#h(0.6em)])[`15`],
    answer_box(width: 100%, pre: [dynamic#h(0.6em)])[`60`],
  )
]

#part(points: 2)[
  Assume the following definitions are in the global environment. Evaluate
  `foo(3)(5)`.

  ```gleam
  const x = 2
  const y = 20

  pub fn foo(x: Int) -> fn(Int) -> Int {
    fn(y) { x * y }
  }
  ```

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [lexical#h(0.6em)])[`15`],
    answer_box(width: 100%, pre: [dynamic#h(0.6em)])[`10`],
  )
]

#part(points: 1)[
  In the evaluator as written, a `UserFn` stores an `env`. When `apply` makes
  the `Local` frame for a call to that function, which environment is the
  `parent` of the new frame?

  #multi-choice(
    cols: 1,
    none-above: false,
    correct()[The `env` stored in the `UserFn`, where the function was defined],
    [The environment of the `Call` expression that applied the function],
    [The global environment],
    [An empty environment],
  )
]

// Solution notes:
// Lexical scope: f's body looks up y in f's parent, the global frame, so
// g() is 3 * 5 = 15. Dynamic scope: f's frame is a child of g's frame, where
// y is 20, so g() is 3 * 20 = 60.
// foo(3)(5): lexically, the lambda's parent is foo's frame, so x is 3 and
// y is 5, giving 15. Dynamically, foo's frame is gone by the time the lambda
// is called from the global frame, so x is 2 and y is 5, giving 10.
//
// Adapted from the lexical vs dynamic scope question on the Scheme final.
