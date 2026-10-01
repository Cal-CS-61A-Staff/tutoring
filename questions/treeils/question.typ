#import "../../61c_exam/lib.typ": *

= All Treeils Lead to Rome

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Summer 2023 - Midterm - Question 6(a) | *Level:* Regular
]

A *treeil* is a tree in which exactly one child of every non-leaf node has a
label equal to the label of its parent. Equivalently, from every node there is
exactly one path to a leaf consisting entirely of nodes with that same label.

```text
1
  1
    1
  2
  4
    4
    5
```

#text(size: 12pt, weight: "bold")[Treeil Trial]

Implement `is_treeil`, which determines whether a tree is a treeil.

```python
def is_treeil(t):
    """Return whether t is a treeil.

    >>> t1 = Tree(1)
    >>> is_treeil(t1)
    True
    >>> t2 = Tree(1, [Tree(2), Tree(3)])
    >>> is_treeil(t2)
    False
    >>> t3 = Tree(1, [Tree(1, [Tree(1), Tree(3)]), Tree(2)])
    >>> is_treeil(t3)
    True
    >>> t4 = Tree(1, [Tree(1, [Tree(1), Tree(1)]), Tree(2)])
    >>> is_treeil(t4)
    False
    >>> t5 = Tree(2, [Tree(3, [Tree(1)]), Tree(2, [Tree(2)])])
    >>> is_treeil(t5)
    False
    """
    if _________:
       # (a)
        return True
    else:
        match_one = _________([b for b in t.branches if _________]) == 1
                    # (b)                              # (c)
        return _________ and _________([_________ for b in t.branches])
               # (d)       # (e)      # (f)
```

#pagebreak()

#part(points: 1)[
  Fill in blank (a). Select all expressions that work.

  #multi-select(
    cols: 2,
    none-above: false,
    [`True`], [`False`], [`is_leaf(t)`], [`t.branches`],
    [`not t.branches`], [`t.label`], [`not t.label`], [`t.branches == []`],
  )
]

#part(points: 1)[
  Fill in blank (b).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`sum`], [`max`], [`min`], [`len`], [`any`], [`all`],
  )
]

#part(points: 2)[
  Fill in blank (c).

  #answer_box(width: 440pt, height: 30pt)[]
]

#part(points: 1)[
  Fill in blank (d).

  #answer_box(width: 440pt, height: 30pt)[]
]

#part(points: 1)[
  Fill in blank (e).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`sum`], [`max`], [`min`], [`len`], [`any`], [`all`],
  )
]

#part(points: 1)[
  Fill in blank (f).

  #answer_box(width: 440pt, height: 30pt)[]
]
