#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Beadazzled

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Spring 2022 Midterm 2 - Question 4 | *Level:* Regular
]

Implement `make_necklace`, which creates a linked list whose values repeat the
strings in `beads` in order until the result has `length` elements. Assume
`beads` is non-empty and `length` is non-negative.

```python
def make_necklace(beads: list[str], length: int) -> LinkedList[str]:
    """Return a linked list of LENGTH beads, repeating BEADS in order.

    >>> wavy = make_necklace(["~", "@"], 3)
    >>> print(wavy)
    (~ @ ~)
    >>> wavy
    Link(first='~', rest=Link(first='@', rest=Link(first='~', rest=())))
    >>> print(make_necklace(["}", "O", "{"], 9))
    (} O { } O { } O {)
    >>> make_necklace(["x"], 0) == ()
    True
    """
    if _______:                         # (a)
        return _______                  # (b)
    return Link(
        _______,                        # (c)
        make_necklace(_______, _______) # (d), (e)
    )
```

#part(points: 1)[
  Fill in blank (a).

  #answer_box(width: 70%)[`length == 0`]
]

#part(points: 1)[
  Fill in blank (b).

  #box(width: 100%)[
    #multi-choice(
      cols: 4,
      none-above: false,
      correct()[`()`],
      [`None`],
      [`Link()`],
      [`[]`],
    )
  ]
]

#part(points: 1)[
  Fill in blank (c).

  #answer_box(width: 70%)[`beads[0]`]
]

#part(points: 2)[
  Fill in blank (d).

  #answer_box(width: 70%)[`beads[1:] + beads[:1]`]
]

#part(points: 1)[
  Fill in blank (e).

  #answer_box(width: 70%)[`length - 1`]
]

// Each recursive call rotates the Python list of beads one position to the
// left, so its first item is the next bead to add. Reaching length 0 produces
// the empty tuple required by the new LinkedList type.
