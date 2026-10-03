#import "../../61c_exam/lib.typ": *

= Prefixes

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Spring 2023 - Midterm 2 - Question 3 | *Level:* Regular
]

Implement `tens`, which takes a *non-empty* linked list of numbers `s`
represented as a `Link` instance. It prints all of the prefix sums of `s` that
are multiples of 10 in increasing order of the length of the prefix.

The `Link` class appears on the reference page at the beginning of this worksheet.

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
    correct()[`isinstance(suffix, Link)`],
    [`isinstance(suffix.rest, Link)`],
    [`isinstance(suffix.rest.rest, Link)`],
  )
]

#part(points: 2)[
  Fill in blank (e).

  #answer_box(width: 440pt, height: 30pt)[`f(suffix.rest, total + suffix.first)`]
]

#part(points: 2)[
  Fill in blank (f).

  #answer_box(width: 440pt, height: 30pt)[`f(s.rest, s.first)`]
]
