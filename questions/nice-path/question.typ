#import "../../61c_exam/lib.typ": *

= Nice Path!

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Fall 2024 - Midterm 2 - Question 6 (A+ question) | *Level:* Challenge
]

`max_path` takes a `Tree` of integers `t` and a function `g`. It returns a list
`s` containing the labels along a path from the root of `t` to a leaf for which
`g(s)` is at least as large as for any other root-to-leaf path. In case of a tie,
return any maximizing path.

```python
def climb(t, f):
    if is_leaf(t):
        return [t.label]
    return [t.label] + climb(max(t.branches, key=f), f)

def max_path(t, g):
    """Return the path s from the root of t to a leaf for which g(s) is largest.

    >>> scare = Tree(0, [Tree(4), Tree(5, [Tree(10)]), Tree(2)])
    >>> crow = Tree(4, [Tree(5), Tree(9, [scare, Tree(7, [Tree(6)])]), Tree(8)])
    >>> max_path(crow, lambda p: -p[-1])
    [4, 9, 0, 2]
    >>> max_path(crow, len)
    [4, 9, 0, 5, 10]
    >>> max_path(crow, lambda p: -abs(p[0] - p[-1]))
    [4, 9, 0, 4]
    """
    x = [t.label]  # You may use x instead of [t.label].
    return climb(t, lambda b: _______)
```

#part(points: 0)[
  Fill in the blank.

  #answer_box(width: 440pt, height: 30pt)[]
]
