#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Beadazzled, the Gleam-quel

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Spring 2022 Final - Question 11 | *Level:* Regular
]

Implement `make_necklace`, which returns a Gleam list whose values repeat the
items in `beads` in order until the result has `length` elements. Assume
`beads` is non-empty and `length` is non-negative.

`list.append(xs, ys)` returns a new list containing the elements of `xs`
followed by the elements of `ys`.

```gleam
import gleam/list

pub fn make_necklace(beads: List(a), length: Int) -> List(a) {
  case length, beads {
    _______ -> _______                         // (a), (b)
    _, [first, ..rest] -> [
      _______,                                 // (c)
      ..make_necklace(_______, _______)        // (d), (e)
    ]
    _, [] -> []
  }
}

assert make_necklace(["~", "*"], 3) == ["~", "*", "~"]
assert make_necklace(["~", "^"], 4) == ["~", "^", "~", "^"]
assert make_necklace([">", "0", "<"], 9)
  == [">", "0", "<", ">", "0", "<", ">", "0", "<"]
```

#part(points: 2)[
  Fill in blanks (a) and (b).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(a)#h(0.6em)])[`0, _`],
    answer_box(width: 100%, pre: [(b)#h(0.6em)])[`[]`],
  )
]

#part(points: 1)[
  Fill in blank (c).

  #answer_box(width: 70%)[`first`]
]

#part(points: 2)[
  Fill in blank (d).

  #answer_box(width: 70%)[`list.append(rest, [first])`]
]

#part(points: 1)[
  Fill in blank (e).

  #answer_box(width: 70%)[`length - 1`]
]

// The final _, [] branch makes the case expression exhaustive. Under the
// stated precondition it is unreachable because rotating a non-empty list
// keeps it non-empty.
