#import "../../61c_exam/lib.typ": *

= Skipping Around

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Summer 2021 - Midterm - Question 2(b)
]

A *skip list* is a sublist of a list such that no two selected elements were
adjacent in the original list. For `[5, 6, 8, 2]`, examples include `[5, 8]`,
`[5, 2]`, `[6, 2]`, every singleton list, and `[]`. The empty list is always a
skip list.

Given a list `int_lst` of unique integers, return all unique skip lists in which
the integers are strictly increasing. The order of the returned skip lists does
not matter.

```python
def list_skipper(int_lst):
    """Return all strictly increasing skip lists of int_lst.

    >>> list_skipper([5, 6, 8, 2])
    [[5, 8], [5], [6], [8], [2], []]
    >>> list_skipper([1, 2, 3, 4, 5])
    [[1, 3, 5], [1, 3], [1, 4], [1, 5], [1], [2, 4], [2, 5],
     [2], [3, 5], [3], [4], [5], []]
    >>> list_skipper([])
    [[]]
    """
    if len(int_lst) == 0:
        return ________________
               # (a)
    with_first = ___________________
                 # (b)
    without_first = ____________________
                    # (c)
    with_first = [_________ for x in with_first
                  # (d)
                  if x == [] or ____________]
                                # (e)
    return with_first + without_first
```

#part(points: 1)[
  Fill in blank (a).

  #answer_box(width: 440pt, height: 30pt)[]
]

#part(points: 1)[
  Fill in blank (b).

  #multi-choice(
    cols: 1,
    none-above: false,
    [`list_skipper(int_lst)`],
    [`list_skipper(int_lst[1:])`],
    [`list_skipper(int_lst[2:])`],
    [`list_skipper(int_lst[0])`],
    [`list_skipper(int_lst[:-1])`],
  )
]

#part(points: 1)[
  Fill in blank (c).

  #answer_box(width: 440pt, height: 30pt)[]
]

#part(points: 1)[
  Fill in blank (d).

  #multi-choice(
    cols: 1,
    none-above: false,
    [`x`],
    [`x[0]`],
    [`[x[0]] + int_lst`],
    [`[int_lst[0]] + x`],
    [`int_lst.append(x)`],
    [`x.append(int_lst)`],
  )
]

#part(points: 1)[
  Fill in blank (e).

  #multi-choice(
    cols: 1,
    none-above: false,
    [`x[0] < int_lst[0]`],
    [`x < int_lst[0]`],
    [`x[0] > int_lst[0]`],
    [`x > int_lst[0]`],
    [`x[0] == int_lst[1]`],
    [`len(x) < len(int_lst)`],
  )
]
