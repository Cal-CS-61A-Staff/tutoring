#import "../../61c_exam/lib.typ": *
#import "../../61c_exam/questions/answer-box.typ": answer_box

= Mapping and Counting

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Spring 2022 Midterm 2 - Question 6 (adapted to loop iteration counts and a comparison of the loops) | *Level:* Regular
]

Each implementation returns a Python list containing `f(x)` for each element of an input linked list. Assume `f` returns normally, does not mutate the input, and does not call either mapping function. Each question concerns one use of an implementation on a linked list containing `n` elements. Count loop body executions, excluding condition checks and work inside `f`.

*Version 1:* Build the Python list directly.

```python
def maplink_to_list1(f, lnk):
    """Apply f to each linked-list element, preserving order.

    >>> maplink_to_list1(lambda x: x * x, Link(3, Link(4, Link(5))))
    [9, 16, 25]
    """
    new_lst = []
    while isinstance(lnk, Link):  # Loop 1
        new_lst.append(f(lnk.first))
        lnk = lnk.rest
    return new_lst
```

#part(points: 2)[
  For an input list containing `n` elements, how many times does the body of Loop 1 run?

  #answer_box(width: 40%)[n times]
]

*Version 2:* Build a mapped linked list, then copy its values.

```python
def maplink_to_list2(f, lnk):
    """Apply f to each linked-list element, preserving order."""
    def map_link(f, lnk):
        if not isinstance(lnk, Link):
            return ()
        return Link(f(lnk.first), map_link(f, lnk.rest))
    mapped_lnk = map_link(f, lnk)
    new_lst = []
    while isinstance(mapped_lnk, Link):  # Loop 2
        new_lst.append(mapped_lnk.first)
        mapped_lnk = mapped_lnk.rest
    return new_lst
```

#part(points: 2)[
  For an input list containing `n` elements, how many times does the body of Loop 2 run?

  #answer_box(width: 40%)[n times]
]

#part(points: 2)[
  For inputs of the same length, does either loop run more times than the other, or do they run the same number of times? Compare only the loop bodies.

  #answer_box(width: 100%)[The same number: each loop runs n times.]
]

// Solution notes (from the official solutions):
// Each iteration of Loop 1 processes one element and advances to the next node,
// so with n nodes the body runs n times (zero for an empty list). The mapped
// list has one node for each input element, so Loop 2 also runs n times. This
// compares the loop bodies only; building the mapped list is separate work
// performed before Loop 2 begins.
