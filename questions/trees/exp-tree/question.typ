#import "../../../61c_exam/lib.typ": *

= Maximum Exponen-tree-ation

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Summer 2021 - Midterm - Question 4 | *Level:* Challenge
]

For a list of integers `values`, define the *maximum exponentiation* of `values` to
be the largest single number that can be achieved by repeatedly combining
pairs of consecutive elements from `values` through exponentiation. Two possible exponentiations for the list
`[3, 1, 2, 3]` are shown below:

```text
(3 ** 1) ** (2 ** 3) = 6561
(3 ** (1 ** 2)) ** 3 = 27
```

Of all the exponentiations of `[3, 1, 2, 3]`, the maximum exponentiation is `6561`,
which can be calculated through the below steps:

```text
[3, 1, 2, 3]
[3 ** 1, 2, 3]
[3, 2, 3]
[3, 2 ** 3]
[3, 8]
[3 ** 8]
6561
```

Implement `exp_tree`, which accepts a non-empty list of integers `values` and returns a tree whose label is the maximum
exponentiation of `values`. Given that the maximum exponentiation is `b ** n` for
some two integers `b` and `n`, the two branches of this tree should be the `exp_tree`s of the sublists
of `values` used to exponentiate to `b` and `n`, respectively. You may assume that `values` has a unique
exponentiation tree.

For example, below is a drawing of the `exp_tree` for `values = [3, 1, 2, 3]`:

#align(center)[
  #image("exp-tree.png", width: 150pt)
]

The function should assume the `Tree` definition on the reference page at the beginning of this worksheet.

Note: Exponentials in Python are expressed as `base ** exponent`.

```python
def exp_tree(values):
    """
    Returns the exponential tree that can be made from VALUES
    with the greatest possible root label

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
    >>> lst = [3, 1, 2, 3]
    >>> print(exp_tree(lst))
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
  Which of these could fill in blank (a)?

  #multi-choice(
    cols: 2,
    none-above: false,
    [`len(values) == 0`],
    correct()[`len(values) == 1`],
    [`values`],
    [`len(values) == 2`],
    [`values[0] < values[1]`],
    [`len(values) <= 2`],
    [`len(values) <= 3`],
  )
]

#part(points: 1)[
  Which of these could fill in blank (b)?

  #multi-choice(
    cols: 2,
    none-above: false,
    [`0`],
    [`Tree(0)`],
    [`values[0]`],
    correct()[`Tree(values[0])`],
    [`values[1]`],
    [`Tree(values[1])`],
    [`values[0] ** values[1]`],
    [`Tree(values[0] ** values[1])`],
    [`values[1] ** values[0]`],
    [`Tree(values[1] ** values[0])`],
  )
]

#part(points: 1)[
  What line of code could go in blank (c)?

  #answer_box(width: 440pt, height: 30pt)[`values[:i]`]
]

#part(points: 1)[
  What line of code could go in blank (d)?

  #answer_box(width: 440pt, height: 30pt)[`values[i:]`]
]

#part(points: 1)[
  What line of code could go in blank (e)?

  #answer_box(width: 440pt, height: 30pt)[`base.label ** exponent.label`]
]

#part(points: 1)[
  What line of code could go in blank (f)?

  #answer_box(width: 440pt, height: 30pt)[`lambda t: t.label`]
]
