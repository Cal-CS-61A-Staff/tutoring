#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Shrink to Fit

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Summer 2026 - 6B - Question 5 | *Level:* Regular
]

The function `shrink` returns a function. The returned function processes a
list from left to right. When it sees `k`, it increases `k`; otherwise, it adds
the current item to the front of `t`.

Assume the following code has been evaluated:

```gleam
pub fn shrink(k: Int, t: List(Int)) -> fn(List(Int)) -> List(Int) {
  fn(s) {
    case s {
      [] -> t
      [first, ..rest] if first == k -> {
        let next = shrink(k + 1, t)
        next(rest)
      }
      [first, ..rest] -> {
        let next = shrink(k, [first, ..t])
        next(rest)
      }
    }
  }
}
```

#part(points: 2)[
  What does the final expression evaluate to?

  ```gleam
  let run = shrink(3, [])
  run([3, 1, 4, 1, 5, 9, 2, 6])
  ```

  #answer_box(width: 70%)[`[2, 9, 1, 1]`]
]

// #part(points: 1)[
//   What is the order of growth of the runtime of `run(s)` in terms of the length
//   of `s`?

//   #multi-choice(
//     cols: 4,
//     none-above: false,
//     [constant],
//     correct()[linear],
//     [quadratic],
//     [exponential],
//   )
// ]

// Each call processes exactly one list element. The accumulator is built at
// the front, so its items appear in reverse encounter order.
