#import "../../61c_exam/lib.typ": *

= Promote Link

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Fall 2024 - Final - Question 4(c) | *Level:* Challenge
]

Implement `promote_link`, which takes a `Link` instance `s` (a non-empty linked list) and two non-negative integers `i` and `j` with `i < j` and `j` less than the length of `s`. It mutates `s` by promoting to `i` from `j` and then returns `s`.

```python
def promote_link(s, i, j):
    """Mutate linked list s so that the item at index j is at index i.

    >>> a = Link(3, Link(6, Link(9, Link(12, Link(15, Link(18))))))
    >>> print(promote_link(a, 2, 4))
    (3 6 15 9 12 18)
    >>> print(promote_link(a, 0, 4))
    (12 3 6 15 9 18)
    >>> promote_link(a, 1, 3) is a
    True
    """
    assert i >= 0 and i < j
    if i > 0:
        _______
        # (g)
    else:
        insert, tail = s.first, s.rest
        while j > 0:
            _______  # Hint: use multiple assignment
            # (h)
            tail, j = tail.rest, j - 1
        _______ = insert
        # (i)
    return _______
           # (j)
```

#part(points: 2)[
  Fill in blank (g).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`promote_link(s.rest, i - 1, j)`],
    [`return promote_link(s.rest, i - 1, j)`],
    [`promote_link(s.rest, i, j - 1)`],
    [`return promote_link(s.rest, i, j - 1)`],
    correct()[`promote_link(s.rest, i - 1, j - 1)`],
    [`return promote_link(s.rest, i - 1, j - 1)`],
  )
]

#part(points: 2)[
  Fill in blank (h). *Hint:* Use multiple assignment: `___, ___ = ___, ___`.

  #answer_box(width: 440pt, height: 30pt)[`insert, tail.first = tail.first, insert`]
]

#part(points: 1)[
  Fill in blank (i).

  #multi-choice(
    cols: 2,
    none-above: false,
    correct()[`s.first`], [`s.rest.first`], [`tail.first`], [`tail.rest.first`],
  )
]

#part(points: 1)[
  Fill in blank (j).

  #multi-choice(
    cols: 2,
    none-above: false,
    correct()[`s`], [`tail`], [`Link(insert, tail.rest)`], [`Link(s.first, tail.rest)`],
  )
]

#part(points: 2)[
  What is displayed by the call to `print` in this code?

  ```python
  odds = Link(3, Link(5, Link(7, Link(9))))
  for i in range(3):
      promote_link(odds, 0, 3)
  print(odds)
  ```

  #multi-choice(
    cols: 2,
    none-above: false,
    [`(3 5 7 9)`],
    [`(3 9 7 5)`],
    correct()[`(5 7 9 3)`],
    [`(5 9 7 3)`],
    [`(9 7 5 3)`],
    [`(9 3 5 7)`],
  )
]
