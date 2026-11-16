#import "../../61c_exam/lib.typ": *
#import "../../61c_exam/questions/answer-box.typ": answer_box

= Thumper

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Fall 2021 - Final - Question 2(c) | *Level:* Challenge
]

A _worm_ is a non-negative integer in which the absolute difference between each pair of adjacent digits is 1. For example, 4345 is a worm, but 4334 and 4354 are not. All non-negative integers below 10 are worms.

Implement `thumper`, a generator function that takes a positive integer `k` and a digit `m`. It yields all `k`-digit worms with digits that are all less than or equal to `m`, and it yields these results in increasing order. Assume the number 0 has 0 digits.

```python
def thumper(k, m):
    """Yield all k-digit worms with digits that are at most m, in increasing order.

    >>> list(thumper(1, 7))  # Note: 0 has no digits, so it is not a 1-digit worm.
    [1, 2, 3, 4, 5, 6, 7]
    >>> list(thumper(2, 3))
    [10, 12, 21, 23, 32]
    >>> list(thumper(3, 3))
    [101, 121, 123, 210, 212, 232, 321, 323]
    """
    if k == 1:
        _______  # (a)
    else:
        for w in _______:  # (b)
            if _______:  # (c)
                yield 10 * w + (w % 10 - 1)
            if _______:  # (d)
                yield 10 * w + (w % 10 + 1)
```

#part(points: 3)[
  Fill in blank (a).

  #answer_box(width: 70%, pre: [(a)#h(0.6em)])[`yield from range(1, m + 1)`]
]

#part(points: 2)[
  Fill in blank (b).

  #answer_box(width: 70%, pre: [(b)#h(0.6em)])[`thumper(k - 1, m)`]
]

#part(points: 1)[
  Which of these could fill in blank (c)?

  #multi-choice(
    cols: 5,
    none-above: false,
    [`True`],
    [`False`],
    [`w > 0`],
    [`w >= 0`],
    [`w < m`],
    [`w <= m`],
    correct()[`w % 10 > 0`],
    [`w % 10 >= 0`],
    [`w % 10 < m`],
    [`w % 10 <= m`],
  )
]

#part(points: 1)[
  Which of these could fill in blank (d)?

  #multi-choice(
    cols: 5,
    none-above: false,
    [`True`],
    [`False`],
    [`w > 0`],
    [`w >= 0`],
    [`w < m`],
    [`w <= m`],
    [`w % 10 > 0`],
    [`w % 10 >= 0`],
    correct()[`w % 10 < m`],
    [`w % 10 <= m`],
  )
]
