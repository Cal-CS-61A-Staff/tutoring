#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Rotation Situation

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Summer 2026 - 6B - Question 7 | *Level:* Regular
]

Implement `rotate`, which shifts all elements of a list `lst` left by `k`
positions. Assume `k` is non-negative. The function should still work when
`k` is greater than the length of the list.

`list.append(xs, ys)` returns the elements of `xs` followed by the elements of
`ys`.

```gleam
import gleam/list

pub fn rotate(lst: List(a), k: Int) -> List(a) {
  case k, lst {
    0, _ -> _______                               // (a)
    _, [] -> []
    _, [first, ..rest] ->
      rotate(
        _______(_______, _______),                // (b), (c), (d)
        _______,                                  // (e)
      )
  }
}

assert rotate([1, 2, 3, 4, 5], 0) == [1, 2, 3, 4, 5]
assert rotate([1, 2, 3, 4, 5], 1) == [2, 3, 4, 5, 1]
assert rotate([1, 2, 3, 4, 5], 2) == [3, 4, 5, 1, 2]
assert rotate([1, 2, 3, 4, 5], 7) == [3, 4, 5, 1, 2]
```

#part(points: 1)[
  Fill in blank (a).

  #answer_box(width: 70%)[`lst`]
]

#part(points: 1)[
  Fill in blank (b).

  #multi-choice(
    cols: 3,
    none-above: false,
    [`list.filter`],
    correct()[`list.append`],
    [`list.length`],
  )
]

#part(points: 2)[
  Fill in blanks (c) and (d).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(c)#h(0.6em)])[`rest`],
    answer_box(width: 100%, pre: [(d)#h(0.6em)])[`[first]`],
  )
]

#part(points: 1)[
  Fill in blank (e).

  #answer_box(width: 70%)[`k - 1`]
]

// #part(points: 1)[
//   Is `rotate` tail recursive?

//   #multi-choice(
//     cols: 1,
//     none-above: false,
//     correct()[Yes. The recursive call's value is returned directly.],
//     [No. `list.append` runs after the recursive call returns.],
//   )
// ]
