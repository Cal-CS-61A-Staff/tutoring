#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Case Counter

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Summer 2023 Final - Question 6b and Summer 2025 Final - Question 7(g) | *Level:* Regular
]

Assume the following code has already been evaluated in the Animator project's
evaluator, and that `eval` is the evaluator described on the reference page.

```gleam
pub fn square(x: Int) -> Int {
  x * x
}

let op = 2
```

We now evaluate this `case` expression:

```gleam
case op {
  1 -> 5 * 5
  2 -> 3 + 4
  _ -> square(7)
}
```

#part(points: 2)[
  Which of these expressions are passed to `eval` while evaluating the `case`
  expression? Do not count the `case` expression itself. Select *all* that apply.

  #multi-select(
    cols: 2,
    none-above: false,
    correct()[`op`], [`1`], [`5 * 5`], correct()[`3 + 4`],
    correct()[`+`], correct()[`4`], [`square(7)`], [`x * x`],
  )
]

#part(points: 1)[
  How many calls are made to `eval` in total, including the call on the whole
  `case` expression?

  #answer_box(width: 30%)[`6`]
]

#part(points: 1)[
  Suppose `op` had been defined as `let op = 3`. How many calls would be made
  to `eval` in total?

  #answer_box(width: 30%)[`9`]
]

// Solution notes:
// Patterns are not expressions, so 1 and 2 in the arms are never passed to
// eval. Only the body of the first matching arm is evaluated.
// op = 2: eval on the case, op, then the body 3 + 4, +, 3, 4 = 6.
// op = 3: the _ arm matches. eval on the case, op, square(7), square, 7, then
// the body x * x, *, x, x = 9.
//
// Adapted from the "Match Counter" question on the Scheme final, where only
// the clause that matches has its body evaluated.
