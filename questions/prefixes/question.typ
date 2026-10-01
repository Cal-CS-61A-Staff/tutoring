#import "../../61c_exam/lib.typ": *

= Prefixes

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Spring 2023 - Midterm 2 - Question 3 | *Level:* Regular
]

// A prefix sum of a sequence is the sum of its first `n` elements for some positive
// length `n`.

// #text(size: 12pt, weight: "bold")[Prefix sums]

// Implement `prefix`, which takes a list of numbers `s` and returns all prefix sums
// of `s` in increasing order of prefix length.

// ```python
// def prefix(s):
//     """Return a list of all prefix sums of list s.

//     >>> prefix([1, 2, 3, 0, 4, 5])
//     [1, 3, 6, 6, 10, 15]
//     >>> prefix([2, 2, 2, 0, -5, 5])
//     [2, 4, 6, 6, 1, 6]
//     """
//     return [_________ for k in _________]
//             # (a)          # (b)
// ```

// #part(points: 2)[
//   Fill in blank (a).

//   #answer_box(width: 440pt, height: 30pt)[]
// ]

// #part(points: 1)[
//   Fill in blank (b).

//   #answer_box(width: 440pt, height: 30pt)[]

//   #multi-choice(
//     cols: 2,
//     none-above: false,
//     [`s`],
//     [`[s]`],
//     [`s[1:]`],
//     [`range(s)`],
//     [`range(len(s))`],
//   )
// ]

// #part(points: 1)[
//   What is the order of growth of the time required by the alternate implementation
//   below, in terms of the length of `s`? Assume `append` takes constant time.

//   ```python
//   def prefix(s):
//       t = 0
//       result = []
//       for x in s:
//           t = t + x
//           result.append(t)
//       return result
//   ```

//   #multi-choice(
//     cols: 2,
//     none-above: false,
//     [Constant],
//     [Logarithmic],
//     [Linear],
//     [Quadratic],
//     [Exponential],
//   )
// ]

#text(size: 12pt, weight: "bold")[Tens]

Implement `tens`, which takes a non-empty linked list of numbers `s` represented
as a `Link`. It prints all prefix sums of `s` that are multiples of 10, in
increasing order of prefix length.

```python
def tens(s):
    """Print all prefix sums of Link s that are multiples of ten.

    >>> tens(Link(3, Link(9, Link(8, Link(10, Link(0, Link(14, Link(6))))))))
    20
    30
    30
    50
    """
    def f(suffix, total):
        if total % 10 == 0:
            print(total)
        if _________:
            # (d)
            _________
            # (e)

    _________
    # (f)
```

#part(points: 1)[
  Fill in blank (d).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`isinstance(s, Link)`],
    [`isinstance(s.rest, Link)`],
    [`isinstance(s.rest.rest, Link)`],
    [`isinstance(suffix, Link)`],
    [`isinstance(suffix.rest, Link)`],
    [`isinstance(suffix.rest.rest, Link)`],
  )
]

#part(points: 2)[
  Fill in blank (e).

  #answer_box(width: 440pt, height: 30pt)[]
]

#part(points: 2)[
  Fill in blank (f).

  #answer_box(width: 440pt, height: 30pt)[]
]
