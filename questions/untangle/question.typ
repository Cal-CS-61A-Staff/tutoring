#import "../../61c_exam/lib.typ": *

= Untangle

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Summer 2023 - Final - Question 3(b) | *Level:* Regular
]

Implement `untangle`, a function that takes in a linked list `s` with strictly positive values.
The function *mutates* the linked list to contain only `1`s, where the length of the resulting linked list
is equal to the sum of the values in the original list. `untangle` potentially modifies the values in `s`
and adds new `Link`s to `s`.

For example, calling `untangle` on `(3 1 2)` will mutate the linked list to become
`(1 1 1 1 1 1)`. See the doctests for more examples.

```python
def untangle(s):
    """Mutate s to contain only 1s and preserve the sum as its length.

    >>> a = Link(5)
    >>> untangle(a)
    >>> print(a)
    (1 1 1 1 1)
    >>> b = Link(3, Link(2, Link(4)))
    >>> untangle(b)
    >>> print(b)
    (1 1 1 1 1 1 1 1 1)
    >>> c = Link(1)
    >>> untangle(c)
    >>> print(c)
    (1)
    """
    if _________:
       # (a)
        return
    next = _________
           # (b)
    while _________:
          # (c)
        s.rest = _________
                 # (d)
        s.first = _________
                  # (e)
    _________
    # (f)
```

#part(points: 1)[
  Fill in blank (a).

  #answer_box(width: 440pt, height: 30pt)[`not isinstance(s, Link)`]
]

#part(points: 1)[
  Fill in blank (b).

  #answer_box(width: 440pt, height: 30pt)[`s.rest`]
]

#part(points: 0.5)[
  Fill in blank (c).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`isinstance(s, Link)`],
    [`isinstance(s.rest, Link)`],
    [`isinstance(s, Link) and isinstance(s.rest, Link)`],
    [`isinstance(s, Link) or isinstance(s.rest, Link)`],
    [`s.first > 0`],
    [`s.first < 0`],
    correct()[`s.first > 1`],
    [`s.first < 1`],
  )
]

#part(points: 1)[
  Fill in blank (d).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`1`],
    [`s`],
    [`Link(1)`],
    [`Link(1, s)`],
    correct()[`Link(1, s.rest)`],
    [`Link(s, Link(1))`],
    [`Link(s.first, Link(1))`],
  )
]

#part(points: 0.5)[
  Fill in blank (e).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`s`],
    [`s.rest`],
    [`s.rest.first`],
    correct()[`s.first - 1`],
    [`s.first + 1`],
    [`-1 * s.first`],
  )
]

#part(points: 1)[
  Fill in blank (f).

  #answer_box(width: 440pt, height: 30pt)[`untangle(next)`]
]
