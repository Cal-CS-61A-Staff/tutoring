#import "../../61c_exam/lib.typ": *

= Skipping Around

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Summer 2021 - Midterm - Question 2(b) | *Level:* Challenge
]

A skip list is defined as a sublist of a list such that each element in the sublist is
non adjacent in the original list. For original list `[5, 6, 8, 2]`, the lists
`[5, 8]`, `[5, 2]`, `[6, 2]`, `[5]`, `[6]`, `[8]`, `[2]`, `[]` are all skip lists of
the original list. The empty list is always a skip list of any list.

Given a list `int_lst` of unique integers, return a list of all unique skip lists of `int_lst`
where *each skip list contains integers in strictly increasing order*. The order in which the skip lists are returned does not matter.

```python
def list_skipper(int_lst):
    """
    >>> list_skipper([5,6,8,2])
    [[5, 8], [5], [6], [8], [2], []]
    >>> list_skipper([1,2,3,4,5])
    [[1, 3, 5], [1, 3], [1, 4], [1, 5], [1], [2, 4], [2, 5], [2], [3, 5], [3], [4], [5], []]
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
    with_first = [ _________ for x in with_first if x == [] or ____________]
                   # (d)                                      # (e)
    return with_first + without_first
```

#part(points: 1)[
  What line of code could go in blank (a)?

  #answer_box(width: 440pt, height: 30pt)[`[[]]`]
]

#part(points: 1)[
  Which of these could fill in blank (b)?

  #multi-choice(
    cols: 2,
    none-above: false,
    [`list_skipper(int_lst)`],
    [`list_skipper(int_lst[1:])`],
    correct()[`list_skipper(int_lst[2:])`],
    [`list_skipper(int_lst[0])`],
    [`list_skipper(int_lst[:-1])`],
  )
]

#part(points: 1)[
  What line of code could go in blank (c)?

  #answer_box(width: 440pt, height: 30pt)[`list_skipper(int_lst[1:])`]
]

#part(points: 1)[
  Which of these could fill in blank (d)?

  #multi-choice(
    cols: 2,
    none-above: false,
    [`x`],
    [`x[0]`],
    [`[x[0]] + int_lst`],
    correct()[`[int_lst[0]] + x`],
    [`int_lst.append(x)`],
    [`x.append(int_lst)`],
  )
]

#part(points: 1)[
  Which of these could fill in blank (e)?

  #multi-choice(
    cols: 2,
    none-above: false,
    [`x[0] < int_lst[0]`],
    [`x < int_lst[0]`],
    correct()[`x[0] > int_lst[0]`],
  )
]
