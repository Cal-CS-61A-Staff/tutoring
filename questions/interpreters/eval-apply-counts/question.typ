#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Count the Calls

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Scheme final exam eval and apply counting | *Level:* Shared
]

For each Gleam expression below, choose the number of calls that would be made
to `eval` and to `apply` when it is evaluated in the Animator project's
evaluator. Count every call, including the first call to `eval` on the whole
expression and the calls for operators such as `+`, which are built-in functions.

Assume the following code has already been evaluated, so `square` and `nums` are
bound in the global environment. `list.length` is a built-in function.

```gleam
pub fn square(x: Int) -> Int {
  x * x
}

let nums = [1, 2, 3]
```

#part(points: 2)[
  ```gleam
  square(1 + 2)
  ```

  Number of calls to `eval`:

  #multi-choice(
    cols: 6,
    none-above: false,
    [`8`], [`9`], correct()[`10`], [`11`], [`12`], [`14`],
  )

  Number of calls to `apply`:

  #multi-choice(
    cols: 6,
    none-above: false,
    [`2`], correct()[`3`], [`4`], [`5`], [`6`], [`7`],
  )
]

#part(points: 2)[
  ```gleam
  list.length(nums) + square(2)
  ```

  Number of calls to `eval`:

  #multi-choice(
    cols: 6,
    none-above: false,
    [`10`], [`11`], correct()[`12`], [`13`], [`14`], [`15`],
  )

  Number of calls to `apply`:

  #multi-choice(
    cols: 6,
    none-above: false,
    [`3`], correct()[`4`], [`5`], [`6`], [`7`], [`8`],
  )
]

#part(points: 2)[
  ```gleam
  fn(x) { x + 1 }(square(2))
  ```

  Number of calls to `eval`:

  #multi-choice(
    cols: 6,
    none-above: false,
    [`9`], [`11`], [`12`], correct()[`13`], [`14`], [`15`],
  )

  Number of calls to `apply`:

  #multi-choice(
    cols: 6,
    none-above: false,
    [`2`], [`3`], correct()[`4`], [`5`], [`6`], [`7`],
  )
]

// Solution notes:
// Each Call costs one eval for itself, one for its fn_expr and one for each
// operand (plus whatever those cost), and one apply. Applying a built-in does
// not call eval. Applying a UserFn calls eval once on its body.
//
// square(1 + 2): eval on the Call, square, 1 + 2, +, 1, 2, then the body
// x * x, *, x, x = 10. apply on +, square, * = 3.
// list.length(nums) + square(2): eval on the whole Call, +, list.length(nums),
// list.length, nums, square(2), square, 2, then x * x, *, x, x = 12. apply on
// list.length, square, *, + = 4.
// fn(x) { x + 1 }(square(2)): eval on the whole Call, the Lambda, square(2),
// square, 2, then x * x, *, x, x, then x + 1, +, x, 1 = 13. The Lambda's body
// is evaluated only when the Lambda is applied. apply on square, *, the
// lambda, + = 4.
