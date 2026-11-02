#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Split Decision

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Summer 2026 - 6B - `split` | *Level:* Regular
]

Implement `split` tail recursively. It takes a list `s` and a predicate
`pred`, then returns a tuple containing two lists: items that satisfy `pred`
and items that do not. Each result list is in reverse order because items are
added to the front of an accumulator.

```gleam
pub fn split(
  s: List(a),
  pred: fn(a) -> Bool,
) -> #(List(a), List(a)) {
  split_tail(_______)                              // (a)
}

fn split_tail(
  s: List(a),
  pred: fn(a) -> Bool,
  satisfy: List(a),
  not_satisfy: List(a),
) -> #(List(a), List(a)) {
  case s {
    [] -> _______                                 // (b)
    [first, ..rest] ->
      case pred(first) {
        True -> split_tail(_______)               // (c)
        False -> split_tail(_______)              // (d)
      }
  }
}

assert split([], fn(x) { x % 2 == 0 }) == #([], [])
assert split([1, 2, 3, 4, 5], fn(x) { x % 2 == 0 })
  == #([4, 2], [5, 3, 1])
```

#part(points: 1)[
  Fill in blank (a).

  #answer_box(width: 90%)[`s, pred, [], []`]
]

#part(points: 1)[
  Fill in blank (b).

  #answer_box(width: 90%)[`#(satisfy, not_satisfy)`]
]

#part(points: 2)[
  Fill in blank (c).

  #answer_box(width: 100%)[`rest, pred, [first, ..satisfy], not_satisfy`]
]

#part(points: 2)[
  Fill in blank (d).

  #answer_box(width: 100%)[`rest, pred, satisfy, [first, ..not_satisfy]`]
]
