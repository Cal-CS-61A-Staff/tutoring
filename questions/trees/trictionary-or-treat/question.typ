#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Trictionary or Treat

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Fall 2018 Midterm 2 - Question 7 | *Level:* Challenge
]

A trictionary consists of a key tree `k` and a value tree `v` with the same shape. A key's values are the labels at the corresponding positions in `v`; keys may repeat. Implement `lookups(k, key)` to yield one function per match. Each function accepts a value tree and returns the label at that match's position. Complete `new_lookup` as well.

```python
k = Tree(5, [
    Tree(7, [Tree(2)]),
    Tree(8, [Tree(3), Tree(4)]),
    Tree(5, [Tree(4), Tree(2)])])
v = Tree('Go', [
    Tree('C', [Tree('C')]),
    Tree('A', [Tree('S'), Tree(6)]),
    Tree('L', [Tree(1), Tree('A')])])

def lookups(k, key):
    """Yield a lookup for each occurrence of key in k.

    >>> [f(v) for f in lookups(k, 2)]
    ['C', 'A']
    >>> [f(v) for f in lookups(k, 3)]
    ['S']
    >>> [f(v) for f in lookups(k, 6)]
    []
    """
    if _______:  # (a)
        yield lambda v: _______  # (b)
    for i in range(len(k.branches)):
        _______:  # (c)
            yield new_lookup(i, lookup)

def new_lookup(i, f):
    def g(v):
        return _______  # (d)
    return g
```

#part(points: 2)[
  Fill in blanks (a) and (b).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(a)#h(0.6em)])[`k.label == key`],
    answer_box(width: 100%, pre: [(b)#h(0.6em)])[`v.label`],
  )
]

#part(points: 2)[
  Fill in blank (c).

  #multi-choice(
    cols: 2,
    none-above: false,
    correct()[`for lookup in lookups(k.branches[i], key)`],
    [`for lookup in lookups(k, key)`],
    [`for lookup in lookups(k.branches, key)`],
    [`for lookup in lookups(k.branches[i], key.label)`],
    [`for lookup in k.branches[i]`],
  )
]

#part(points: 1)[
  Fill in blank (d).

  #multi-choice(
    cols: 3,
    none-above: false,
    correct()[`f(v.branches[i])`],
    [`f(v)`],
    [`f(v.branches)`],
    [`f(v.branches[i].label)`],
    [`v.branches[i]`],
  )
]

// Solution notes (from the official solutions):
// A root match reads v.label. For a match in branch i, first select
// v.branches[i], then apply the lookup for the remaining path. Each call to
// new_lookup saves its own i and f for the returned function.
