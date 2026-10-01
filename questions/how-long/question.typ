#import "../../61c_exam/lib.typ": *

= How Long Is This Exam?

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Fall 2024 - Midterm 2 - Question 5
]

#text(size: 12pt, weight: "bold")[Longer]

Implement `longer`, which takes two linked lists of numbers `s` and `t`. It
returns the longer list. If they have the same length, it returns `s`.

```python
def longer(s, t):
    """Return the longer linked list, s or t. (Same length? Return s.)

    >>> print(longer(Link(2, Link(3)), ()))
    (2 3)
    >>> print(longer(Link(2, Link(3)), Link(4, Link(5))))
    (2 3)
    >>> print(longer(Link(2, Link(3)), Link(4, Link(5, Link(6, Link(7))))))
    (4 5 6 7)
    >>> longer((), ()) == ()
    True
    """
    a, b = s, t
    while isinstance(b, Link):
        if _______:
           # (a)
            return _______
                   # (b)
        _______
        # (c)
    return _______
           # (d)
```

#part(points: 2)[
  Fill in blank (a).

  #answer_box(width: 440pt, height: 30pt)[]
]

#part(points: 1)[
  Fill in blank (b).

  #multi-choice(
    cols: 1,
    none-above: false,
    [`a`], [`b`], [`s`], [`t`], [`longer(a, b)`], [`longer(s, t)`],
  )
]

#part(points: 1)[
  Fill in blank (c).

  #multi-choice(
    cols: 1,
    none-above: false,
    [`a = a.rest`],
    [`a = s.rest`],
    [`b = b.rest`],
    [`b = t.rest`],
    [`a, b = a.rest, b.rest`],
    [`a, b = s.rest, t.rest`],
  )
]

#part(points: 1)[
  Fill in blank (d).

  #multi-choice(
    cols: 1,
    none-above: false,
    [`a`], [`b`], [`s`], [`t`], [`longer(a, b)`], [`longer(s, t)`],
  )
]

#pagebreak()

#text(size: 12pt, weight: "bold")[Longest]

Implement `longest`, which takes a linked list of positive integers `s` and a
positive integer `n`. It returns the longest sublist of `s` whose elements sum to
at most `n`. Do not mutate `s`. In a tie, return any longest valid sublist.
Assume `longer` is implemented correctly.

A sublist contains some, none, or all elements of `s` in their original order.
The sum of `()` is 0, and `()` is a sublist of every linked list.

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
    cols: 1,
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
