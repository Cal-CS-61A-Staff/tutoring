#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Gleam Sequences

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Past exam practice - Fibonacci2 and The (n-1)-al Countdown | *Level:* Regular
]

*Part A: Fibonacci2.* The 0th and 1st elements of the `fibonacci2` sequence are
0 and 1. Every later element is twice the absolute difference between the
previous two elements. Implement `fib2`, which returns element `n` for a
non-negative integer `n`.

```gleam
import gleam/int

pub fn fib2(n: Int) -> Int {
  case n {
    _______ -> n                                      // (a)
    _ -> _______ * int.absolute_value(
      fib2(_______) - fib2(_______)                   // (b), (c), (d)
    )
  }
}

assert fib2(0) == 0
assert fib2(1) == 1
assert fib2(2) == 2
assert fib2(3) == 2
assert fib2(4) == 0
assert fib2(5) == 4
```

#part(points: 1)[
  Fill in blank (a).

  #answer_box(width: 70%)[`_ if n <= 1`]
]

#part(points: 3)[
  Fill in blanks (b), (c), and (d).

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.7em,
    answer_box(width: 100%, pre: [(b)#h(0.4em)])[`2`],
    answer_box(width: 100%, pre: [(c)#h(0.4em)])[`n - 1`],
    answer_box(width: 100%, pre: [(d)#h(0.4em)])[`n - 2`],
  )
]

#pagebreak()

*Part B: The (n-1)-al Countdown.* The countdown sequence of `n` starts at `n`
and descends to 0. Implement `countdowns`, which concatenates the countdown
sequence of each non-negative integer in `values`.

```gleam
pub fn countdowns(values: List(Int)) -> List(Int) {
  case values {
    [] -> _______                                     // (e)
    [first, ..rest] if _______ -> [                   // (f)
      first,
      ..countdowns(_______)                           // (g)
    ]
    [_, ..rest] -> [0, .._______]                    // (h)
  }
}

assert countdowns([3]) == [3, 2, 1, 0]
assert countdowns([2, 0, 3]) == [2, 1, 0, 0, 3, 2, 1, 0]
assert countdowns([]) == []
```

#part(points: 1)[
  Fill in blank (e).

  #answer_box(width: 70%)[`[]`]
]

#part(points: 1)[
  Fill in blank (f).

  #answer_box(width: 70%)[`first > 0`]
]

#part(points: 2)[
  Fill in blank (g).

  #answer_box(width: 70%)[`[first - 1, ..rest]`]
]

#part(points: 1)[
  Fill in blank (h).

  #answer_box(width: 70%)[`countdowns(rest)`]
]
