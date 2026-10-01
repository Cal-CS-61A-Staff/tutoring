#import "../../61c_exam/lib.typ": *

= Treeil Trail

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Summer 2023 - Midterm - Question 6(b) | *Level:* Regular
]

A *treeil* is a tree in which exactly one child of every non-leaf node has a
label equal to the label of its parent. Implement `max_treeil`, which returns
the largest number of nodes in any treeil that is a subtree of `t`. Assume
`is_treeil` is implemented correctly from the previous question.

In the tree below, the subtree rooted at the right child labeled `4` is the
largest treeil and contains four nodes.

```text
1
  2
    1
  4  <- root of the largest treeil
    4
      4
    5
```

```python
def max_treeil(t):
    """Return the highest number of nodes in a treeil within t.

    >>> max_treeil(Tree(1))
    1
    >>> max_treeil(Tree(1, [Tree(2), Tree(3)]))
    1
    >>> t3 = Tree(1, [Tree(1, [Tree(1), Tree(3)]), Tree(2)])
    >>> max_treeil(t3)
    5
    >>> t4 = Tree(1, [Tree(1, [Tree(1), Tree(1)]), Tree(2)])
    >>> max_treeil(t4)
    1
    >>> t5 = Tree(2, [Tree(3, [Tree(1)]), Tree(2, [Tree(2)])])
    >>> max_treeil(t5)
    2
    """
    if _________:
       # (a)
        return 1
    elif _________:
         # (b)
        return 1 + _________
                   # (c)
    else:
        return max([_________ for b in t.branches])
                    # (d)
```

#part(points: 1)[
  Fill in blank (a).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`is_treeil(t)`],
    [`not is_treeil(t)`],
    [`is_leaf(t)`],
    [`is_treeil(t) or is_leaf(t)`],
    [`not is_treeil(t) and is_leaf(t)`],
  )
]

#part(points: 1.5)[
  Fill in blank (b).

  #answer_box(width: 440pt, height: 30pt)[]
]

#part(points: 1)[
  Fill in blank (c).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`max([max_treeil(b) for b in t.branches])`],
    [`len([max_treeil(b) for b in t.branches])`],
    [`sum([max_treeil(b) for b in t.branches])`],
    [`sum([b for b in t.branches if is_treeil(b)])`],
    [`len([b for b in t.branches if is_treeil(b)])`],
  )
]

#part(points: 1.5)[
  Fill in blank (d).

  #answer_box(width: 440pt, height: 30pt)[]
]
