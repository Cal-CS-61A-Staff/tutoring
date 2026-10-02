#import "../../61c_exam/lib.typ": *

= Longest

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Fall 2024 - Midterm 2 - Question 5(b) | *Level:* Challenge
]

Implement `longest`, which takes a linked list of postive integers `s` and a positive integer `n`. It returns the longest sublist of `s` with elements that sum to a number less than or equal to `n`. *Do not mutate `s`.* In case of a tie, return any of the longest sublists whose sum is `n` or less. Assume `longer` is implemented correctly.

A sublist of a linked list `s` is a linked list with some (or none or all) of the elements of `s` in order.

Assume the sum of the elements of `()` is 0. `()` is a sublist of any linked list.

```python
def longest(s, n):
    """Return the longest sublist of s that sums to n or less.

    >>> print(longest(Link(5, Link(1, Link(3, Link(4, Link(2, Link(7)))))), 7))
    (1 3 2)
    >>> print(longest(Link(5, Link(1, Link(3, Link(4, Link(2, Link(7)))))), 70))
    (5 1 3 4 2 7)
    >>> longest(Link(3, Link(4, Link(5))), 2) == ()
    True
    """
    if not isinstance(s, Link):
        return s
    t = _______
        # (e)
    if _______:
       # (f)
        return longer(_______, t)
                      # (g)
    else:
        return t
```

#part(points: 1)[
  Fill in blank (e).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`longest(s, n)`],
    [`longest(s, n - s.first)`],
    [`longest(s.rest, n)`],
    [`longest(s.rest, n - s.first)`],
  )
]

#part(points: 2)[
  Fill in blank (f).

  #answer_box(width: 440pt, height: 30pt)[]
]

#part(points: 3)[
  Fill in blank (g).

  #answer_box(width: 440pt, height: 30pt)[]
]
