#import "../../../61c_exam/lib.typ": *

#metadata("gleam-reference") <titled-question>

#align(center)[
  #text(size: 15pt, weight: "bold")[Gleam Reference]
]

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  This page summarizes the Gleam features used in this worksheet. Types are
  capitalized, function bodies end with the expression they return, and values
  are immutable.
]

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  [
    *Functions and types*

    ```text
    pub fn square(x: Int) -> Int {
      x * x
    }

    pub fn twice(f: fn(a) -> a, x: a) -> a {
      f(f(x))
    }
    ```

    `a` is a type variable. For example, `List(a)` means a list whose elements
    all have the same type, whatever that type is.

    Anonymous functions use `fn`:

    ```text
    fn(x) { x + 1 }
    ```

    Define named recursive helpers at the top level, not inside another
    function. A recursive call is tail recursive when its result is returned
    directly, with no remaining operation.

    *Operators*

    - Arithmetic: `+`, `-`, `*`, `/`, `%`
    - Comparison: `==`, `!=`, `<`, `<=`, `>`, `>=`
    - Boolean: `&&`, `||`, `!`
  ],
  [
    *Case expressions and patterns*

    ```text
    case n {
      0 -> "zero"
      _ if n < 0 -> "negative"
      _ -> "positive"
    }
    ```

    A `case` can match multiple subjects: `case x, y { ... }`. The `_` pattern
    matches any value, and `if` adds a guard to a pattern.

    *Lists*

    ```text
    case s {
      [] -> []
      [first, ..rest] -> [first, ..rest]
      [a, b, ..tail] -> [a, b, ..tail]
    }
    ```

    - `[]` is empty.
    - `[first, ..rest]` splits a non-empty list.
    - `[first, ..rest]` also constructs a new list.
    - `#(x, y)` is a two-element tuple.

    Useful standard-library functions:

    - `list.append(xs, ys)` joins two lists.
    - `list.map(xs, f)` applies `f` to each value.
    - `list.filter(xs, keep)` keeps values satisfying `keep`.
    - `list.length(xs)` returns a list's length.
    - `int.absolute_value(n)` returns an integer's absolute value.

    Import their modules with `import gleam/list` or `import gleam/int`.
  ],
)
