#import "../../61c_exam/lib.typ": *

= All Treeils Lead to Rome

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Summer 2023 - Midterm - Question 6(a) | *Level:* Regular
]

*Definition*: A *Treeil* is a tree in which _exactly_ one of the child node(s) of each non-leaf node has a label equal to the label of the node. Alternatively, a treeil is a tree where every node has a singular path from the node to a leaf consisting entirely of nodes with the same label. Here is an example of a valid treeil:

#align(center)[
  #image("treeil.png", width: 150pt)
]

#text(size: 12pt, weight: "bold")[Treeil Trial]

Implement `is_treeil`, which determines whether a tree is a treeil.

```python
def is_treeil(t):
    """Return whether t is a treeil. A treeil is a tree where exactly one of
    the branches of each non-leaf node has a label equal to the label of the node.

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
  Fill in blank (a). Select *all* that apply.

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
