#import "../../61c_exam/lib.typ": *

= Trees

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Spring 2024 - Final - Question 5(a) | *Level:* Regular
]

Implement `count_ones`, which takes a `Tree` instance `t`. It returns the number
of nodes in `t` that have one child. The `Tree` class is defined on the
reference page at the beginning of this worksheet.

```python
def count_ones(t):
    """Return the number of nodes that have one child.

    >>> count_ones(Tree(1, [Tree(2), Tree(3, [Tree(4)])]))
    1
    >>> count_ones(Tree(1, [Tree(2), Tree(3), Tree(4)]))
    0
    >>> count_ones(Tree(1, [Tree(2, [Tree(3, [Tree(4)]), Tree(5, [Tree(6)])])]))
    3
    """
    count = sum([ count_ones(_______) for b in t.branches if _______ ])
                               # (a)                             # (b)
    if _______:
         # (c)
        return count + 1
    else:
        return count
```

#part(points: 1)[
  Fill in blank (a).

  #multi-choice(
    cols: 2,
    none-above: false,
    correct()[`b`],
    [`t`],
    [`b.branches`],
    [`t.branches`],
  )
]

#part(points: 1)[
  Fill in blank (b).

  #multi-choice(
    cols: 2,
    none-above: false,
    correct()[`True`],
    [`is_leaf(b)`],
    [`is_leaf(t)`],
    [`len(b.branches) == 1`],
    correct()[`len(t.branches) == 1`],
  )
]

#part(points: 2)[
  Fill in blank (c).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`True`],
    [`is_leaf(b)`],
    [`is_leaf(t)`],
    [`len(b.branches) == 1`],
    [`len(t.branches) == 1`],
    [`all([len(b.branches) == 1 for b in t.branches])`],
    [`any([len(b.branches) == 1 for b in t.branches])`],
  )
]
