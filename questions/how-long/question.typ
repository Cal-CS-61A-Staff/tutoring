#import "../../61c_exam/lib.typ": *

= How Long Is This Exam?

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Fall 2024 - Midterm 2 - Question 5(a) | *Level:* Regular
]

#text(size: 12pt, weight: "bold")[Longer]

Implement `longer`, which takes two linked lists of numbers `s` and `t`. It returns the longer of the two. If they have the same length, it returns `s`.

A linked list is either a `Link` instance or `()`. The `Link` class is on the reference page at the beginning of this worksheet.

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
    cols: 2,
    none-above: false,
    [`a`], [`b`], [`s`], [`t`], [`longer(a, b)`], [`longer(s, t)`],
  )
]

#part(points: 1)[
  Fill in blank (c).

  #multi-choice(
    cols: 2,
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
    cols: 2,
    none-above: false,
    [`a`], [`b`], [`s`], [`t`], [`longer(a, b)`], [`longer(s, t)`],
  )
]
