#import "../../61c_exam/lib.typ": *

= Maximum Exponen-tree-ation

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Summer 2021 - Midterm - Question 4 | *Level:* Challenge
]

For a list of integers `values`, define its *maximum exponentiation* to be the
largest single number obtainable by repeatedly combining consecutive pairs using
exponentiation. For example:

```text
(3 ** 1) ** (2 ** 3) = 6561
(3 ** (1 ** 2)) ** 3 = 27
```

The maximum exponentiation of `[3, 1, 2, 3]` is 6561. Its tree is:

```text
6561
  3
    3
    1
  8
    2
    3
```

Implement `exp_tree`. If the maximum is `b ** n`, its two branches must be the
`exp_tree`s of the sublists used to produce `b` and `n`, respectively. Assume
`values` has a unique maximum-exponentiation tree.

```python
def exp_tree(values):
    """Return the exponential tree made from values with the greatest root label.

    >>> print(exp_tree([5]))
    5
    >>> print(exp_tree([3, 2]))
    9
      3
      2
    >>> print(exp_tree([2, 3, 2]))
    512
      2
      9
        3
        2
    >>> print(exp_tree([3, 1, 2, 3]))
    6561
      3
        3
        1
      8
        2
        3
    """
    if __________:
       # (a)
        return __________
               # (b)
    else:
        def tree_at_split(i):
            base = exp_tree(__________)
                            # (c)
            exponent = exp_tree(__________)
                                # (d)
            return Tree(__________, [base, exponent])
                        # (e)
        trees = [tree_at_split(i) for i in range(1, len(values))]
        return max(trees, key=__________)
                              # (f)
```

#part(points: 1)[
  Fill in blank (a).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`len(values) == 0`],
    [`len(values) == 1`],
    [`values`],
    [`len(values) == 2`],
    [`values[0] < values[1]`],
    [`len(values) <= 2`],
    [`len(values) <= 3`],
  )
]

#part(points: 1)[
  Fill in blank (b).
  
  #multi-choice(
    cols: 2,
    none-above: false,
    [`0`],
    [`Tree(0)`],
    [`values[0]`],
    [`Tree(values[0])`],
    [`values[1]`],
    [`Tree(values[1])`],
    [`values[0] ** values[1]`],
    [`Tree(values[0] ** values[1])`],
    [`values[1] ** values[0]`],
    [`Tree(values[1] ** values[0])`],
  )
]

#part(points: 1)[
  Fill in blank (c).

  #answer_box(width: 440pt, height: 30pt)[]
]

#part(points: 1)[
  Fill in blank (d).

  #answer_box(width: 440pt, height: 30pt)[]
]

#part(points: 1)[
  Fill in blank (e).

  #answer_box(width: 440pt, height: 30pt)[]
]

#part(points: 1)[
  Fill in blank (f).

  #answer_box(width: 440pt, height: 30pt)[]
]
