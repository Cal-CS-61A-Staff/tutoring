#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= What Would Gleam Do?

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Level:* Challenge
]

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

#part[
  What does the final expression evaluate to?

  ```gleam
  let run = shrink(3, [])
  run([3, 1, 4, 1, 5, 9, 2, 6])
  ```

  #answer_box(width: 70%)[`[2, 9, 1, 1]`]
]
