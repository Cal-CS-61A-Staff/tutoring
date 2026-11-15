#import "../../../61c_exam/lib.typ": *

= Nice Path!

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Fall 2024 - Midterm 2 - Question 6 (A+ question) | *Level:* Challenge
]

*This A+ question is not worth any points. It can only affect your course
grade if you have a high A and might receive an A+. Finish the rest of the exam
first!*

Fill in the blank of `max_path`, which takes a Tree of integers `t` and a
function `g`. It returns a list `s` containing the labels along the path from
the root of `t` to a leaf for which `g(s)` is as large or larger than for any
other path. In case of a tie, return any path with a maximum `g(s)` value.

```python
def climb(t, f):
    if is_leaf(t):
        return [t.label]
    return [t.label] + climb(max(t.branches, key=f), f)

def max_path(t, g):
    """Return the path s from the root of t to a leaf for which g(s) is largest.

    >>> scare = Tree(0, [Tree(4), Tree(5, [Tree(10)]), Tree(2)])
    >>> crow = Tree(4, [Tree(5), Tree(9, [scare, Tree(7, [Tree(6)])]), Tree(8)])
    >>> max_path(crow, lambda p: -p[-1])            # The path to the smallest leaf
    [4, 9, 0, 2]
    >>> max_path(crow, len)                         # The longest path
    [4, 9, 0, 5, 10]
    >>> max_path(crow, lambda p: -abs(p[0]-p[-1]))  # To the leaf closest in value to the root
    [4, 9, 0, 4]
    """

    x = [t.label]  # You can use x instead of [t.label] to shorten your answer!

    return climb(t, lambda b: _______ )
```

#part(points: 0)[
  #answer_box(width: 440pt, height: 30pt)[`g(x + max_path(b, lambda p: g(x + p)))`]
]
