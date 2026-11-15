#import "../../../61c_exam/lib.typ": *

= Their Mascot is a Tree?!?

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Fall 2019 - Midterm 2 - Question 8 | *Level:* Regular
]

*Definitions.* The depth of the root node of a tree is 0, and the depth of a child is 1 more than the depth of its parent. A linked list is either a `Link` instance or `()`.

Implement `layer`, which takes a `Tree` instance `t` and a non-negative integer `d`. It returns a linked list containing the labels of all nodes in `t` that have depth `d`. Labels in the result should appear in branch order.

You may *not* use `lambda`, `if`, `and`, or `or` in your solution other than what already appears in the template.

*Note:* The built-in `reversed` function returns a reverse iterator over the values of a sequence. For example, `list(reversed([1, 2, 3]))` evaluates to `[3, 2, 1]`.

```python
def layer(t, d):
    """Return a linked list containing all labels of Tree t at depth d.

    >>> a_tree = Tree(1, [Tree('b', [Tree('mas')]),
    ...                   Tree('a', [Tree('co')]),
    ...                   Tree('d', [Tree('t', [Tree('!')])])])
    >>> print(layer(a_tree, 0))
    (1)
    >>> print(layer(a_tree, 1))
    (b a d)
    >>> print(layer(a_tree, 2))
    (mas co t)
    >>> print(layer(a_tree, 3))
    (!)
    """
    return helper(t, d, _________)
                        # (a)

def helper(t, d, s):
    if d == 0:
        return _________
               # (b)
    else:
        for b in reversed(t.branches):
            s = _________
                # (c)
        return s
```

#part(points: 1)[
  Fill in blank (a).

  #answer_box(width: 440pt, height: 30pt)[`()`]
]

#part(points: 1)[
  Fill in blank (b).

  #answer_box(width: 440pt, height: 30pt)[`Link(t.label, s)`]
]

#part(points: 2)[
  Fill in blank (c).

  #answer_box(width: 440pt, height: 30pt)[`helper(b, d - 1, s)`]
]
