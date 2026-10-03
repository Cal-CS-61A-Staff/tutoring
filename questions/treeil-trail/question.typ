#import "../../61c_exam/lib.typ": *

= Treeil Trail

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Summer 2023 - Midterm - Question 6(b) | *Level:* Regular
]

Implement `max_treeil` which takes in a tree `t` and determines the highest number of nodes in a treeil that is a subtree of `t`. 
You may assume is_treeil is implemented correctly from the previous question.
The following diagram displays a tree `t`, which is not a treeil. The treeil subtree of `t` with the highest number of nodes is highlighted. Calling `max_treeil` on this tree `t` should give a result of 4.

#align(center)[
  #image("treeil-trail.jpg", width: 114pt)
]

```python
def max_treeil(t):
    """
    Given a tree (that is not necessarily a treeil), returns
    the highest number of nodes in a treeil in the tree.

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
    correct()[`is_leaf(t)`],
    [`not is_treeil(t)`],
    [`is_leaf(t)`],
    [`is_treeil(t) or is_leaf(t)`],
    [`not is_treeil(t) and is_leaf(t)`],
  )
]

#part(points: 1.5)[
  Fill in blank (b).

  #answer_box(width: 440pt, height: 30pt)[`is_treeil(t)`]
]

#part(points: 1)[
  Fill in blank (c).

  #multi-choice(
    cols: 2,
    none-above: false,
    [`max([max_treeil(b) for b in t.branches])`],
    [`len([max_treeil(b) for b in t.branches])`],
    correct()[`sum([max_treeil(b) for b in t.branches])`],
    [`sum([b for b in t.branches if is_treeil(b)])`],
    [`len([b for b in t.branches if is_treeil(b)])`],
  )
]

#part(points: 1.5)[
  Fill in blank (d).

  #answer_box(width: 440pt, height: 30pt)[`max_treeil(b)`]
]
