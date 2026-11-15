#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= After Party

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Fall 2023 - Midterm 2 6 - `after` | *Level:* 
  Challenge
]

Implement `after`, which takes a list `s` and values `a` and `b`. It returns
whether an element of `s` equal to `b` appears after an element of `s` equal
to `a`.

```gleam
pub fn after(s: List(t), a: t, b: t) -> Bool {
  find(s, a, fn(rest) { _______ })                // (a)
}

fn find(s: List(t), n: t, f: fn(List(t)) -> Bool) -> Bool {
  case s {
    [] -> _______                                 // (b)
    [first, ..rest] if first == n -> f(rest)
    [_, ..rest] -> find(rest, n, f)
  }
}

assert after([3, 6, 5, 4], 6, 4) == True
assert after([3, 6, 5, 4], 4, 6) == False
assert after([3, 6, 5, 4], 6, 6) == False
```

#part(points: 4)[
  Fill in blank (a). You may not use `case`, `&&`, `||`, `[`, or `]`.

  #answer_box(width: 100%)[`find(rest, b, fn(_) { True })`]
]

#part(points: 1)[
  Fill in blank (b).

  #answer_box(width: 90%)[`False`]
]