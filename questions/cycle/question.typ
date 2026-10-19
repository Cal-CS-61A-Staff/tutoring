#import "../../61c_exam/lib.typ": *

= Merry-Go-Round

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Spring 2024 - Final - Question 4(a) | *Level:* Regular
]

Implement `cycle`, which takes a non-empty finite linked list `s` (a `Link` instance). It returns a linked list in which the first `Link` of `s` has been moved to become the last `Link` of the result. If `s` has only one element, then it is not moved. A linked list is finite if it contains a `Link` whose `rest` attribute is `()` rather than having a cyclical structure.

```python
def cycle(s):
    """Move the first Link of a non-empty finite linked list to be the last.

    >>> a = Link(3, Link(5, Link(7, Link(9))))
    >>> print(cycle(a))
    (5 7 9 3)
    >>> print(a)
    (3)
    """
    assert isinstance(s, Link)
    if not isinstance(s.rest, Link):
        return s
    last = s
    while isinstance(last.rest, Link):
        last = last.rest
    s.rest, last.rest, result = _______ , _______ , _______
                                  # (a)    # (b)    # (c)
    return result
```

#part(points: 2)[
  Fill in blank (a).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`s`], [`s.rest`], [`last`], [`last.rest`], correct()[`()`],
  )
]

#part(points: 2)[
  Fill in blank (b).

  #multi-choice(
    cols: 2,
    none-above: false,
    correct()[`s`], [`s.rest`], [`last`], [`last.rest`], [`()`],
  )
]

#part(points: 2)[
  Fill in blank (c).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`s`], correct()[`s.rest`], [`last`], [`last.rest`], [`()`],
  )
]
