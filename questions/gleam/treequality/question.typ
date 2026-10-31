#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Listquality

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Past exam practice - Treequality | *Level:* Regular
]

*Part A: `all`.* Implement `all`, which returns `True` when every Boolean in
`s` is `True`, including when `s` is empty, and returns `False` otherwise.

```gleam
pub fn all(s: List(Bool)) -> Bool {
  case s {
    [] -> _______                                    // (a)
    [first, ..rest] -> _______ && all(_______)       // (b), (c)
  }
}

assert all([True, True, True]) == True
assert all([True, False, True]) == False
assert all([]) == True
```

#part(points: 1)[
  Fill in blank (a).

  #multi-choice(
    cols: 2,
    none-above: false,
    correct()[`True`],
    [`False`],
    [`[]`],
    [`Nil`],
  )
]

#part(points: 1)[
  Fill in blanks (b) and (c).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(b)#h(0.6em)])[`first`],
    answer_box(width: 100%, pre: [(c)#h(0.6em)])[`rest`],
  )
]

// #part(points: 2)[
//   Is `all` tail recursive?

//   #multi-choice(
//     cols: 1,
//     none-above: false,
//     correct()[Yes. When the recursive call is reached, its value is returned directly.],
//     [No. The `&&` operator always performs another operation after the recursive call.],
//   )
// ]

#v(2em)

*Part B: `zip`.* Implement `zip`, which combines two lists into a list of
two-element tuples. If the inputs have different lengths, stop when the shorter
list runs out. The type variables may differ, so the two input lists do not
need to contain the same type.

```gleam
pub fn zip(s0: List(a), s1: List(b)) -> List(#(a, b)) {
  case s0, s1 {
    [], _ -> []
    _, [] -> []
    [first0, ..rest0], [first1, ..rest1] -> [
      _______,                                         // (d)
      ..zip(_______, _______)                          // (e), (f)
    ]
  }
}

assert zip([1, 2, 3], [-1, -2, -3])
  == [#(1, -1), #(2, -2), #(3, -3)]
assert zip(["a", "b"], [1, 2, 3]) == [#("a", 1), #("b", 2)]
```

#part(points: 1)[
  Fill in blank (d).

  #answer_box(width: 70%)[`#(first0, first1)`]
]

#part(points: 1)[
  Fill in blanks (e) and (f).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(e)#h(0.6em)])[`rest0`],
    answer_box(width: 100%, pre: [(f)#h(0.6em)])[`rest1`],
  )
]

// #part(points: 2)[
//   Is `zip` tail recursive?

//   #multi-choice(
//     cols: 1,
//     none-above: false,
//     [Yes. The recursive call is the last text in the function.],
//     correct()[No. The tuple is added to the front only after the recursive call returns.],
//   )
// ]

// Gleam tuples allow zip's two inputs to have different element types while
// preserving the two-item pairing from the original exercise.
