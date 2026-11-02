#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Don't Skip This

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Fall 2023 - Final 7 - `part` | *Level:* 
  Challenge
]

*Definition.* A _skip-partition_ of a positive integer `n` is a list of
positive integers in increasing order that sums to `n` and does not contain
any duplicates or consecutive numbers.

Implement `part`, which takes positive integers `n` and `m`. It returns a list
of all skip-partitions of `n` whose elements are all greater than or equal to
`m`. The provided `start_with` function may be used in the implementation.

```gleam
import gleam/list

fn start_with(first: Int) -> fn(List(Int)) -> List(Int) {
  fn(rest) { [first, ..rest] }
}

pub fn part(n: Int, m: Int) -> List(List(Int)) {
  case m {
    _ if m == n -> _______                        // (a)
    _ if m > n -> []
    _ ->
      list.append(
        list.map(_______, _______),               // (b), (c)
        part(n, m + 1),
      )
  }
}

assert part(12, 2)
  == [[2, 4, 6], [2, 10], [3, 9], [4, 8], [5, 7], [12]]
assert part(10, 1)
  == [[1, 3, 6], [1, 9], [2, 8], [3, 7], [4, 6], [10]]
```

#part(points: 2)[
  Fill in blank (a).

  #answer_box(width: 90%)[`[[m]]`]
]

#part(points: 2)[
  Fill in blank (b).

  #answer_box(width: 90%)[`part(n - m, m + 2)`]
]

#part(points: 2)[
  Fill in blank (c).

  #answer_box(width: 90%)[`start_with(m)`]
]