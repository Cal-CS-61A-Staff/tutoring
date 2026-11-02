#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Off to the Races

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Spring 2026 Midterm 2 - Question 9 (adapted to a single-line count and loop iteration counts) | *Level:* Regular
]

Both functions keep only the words shorter than `length`. Each question asks for one count for an input linked list containing `n` words. For loops, count how many times the body runs; do not count condition checks.

*Recursive version.*

```python
def remove_long_words1(links, length):
    if not isinstance(links, Link):
        return ()
    if len(links.first) >= length:  # A
        return remove_long_words1(links.rest, length)
    return Link(links.first, remove_long_words1(links.rest, length))
```

#part(points: 2)[
  For an input list of `n` words, how many times does line A run in total?

  #answer_box(width: 40%)[n times]
]

*Iterative version.* This version can change the links in the input.

```python
def remove_long_words2(links, length):
    head = links
    while isinstance(head, Link) and len(head.first) >= length:  # Loop 1
        head = head.rest
    if not isinstance(head, Link):
        return ()
    prev = head
    curr = head.rest
    while isinstance(curr, Link):  # Loop 2
        if len(curr.first) >= length:
            prev.rest = curr.rest
        else:
            prev = curr
        curr = curr.rest
    return head
```

#part(points: 2)[
  Suppose the input contains `n >= 1` words and the first word is shorter than `length`. How many times does the body of Loop 2 run?

  #answer_box(width: 40%)[n - 1 times]
]

#part(points: 2)[
  Now suppose all `n` words have length greater than or equal to `length`. How many times does the body of Loop 1 run?

  #answer_box(width: 40%)[n times]
]

#context if states.printanswers.get() [
  #block(width: 100%, stroke: 0.5pt, inset: 10pt)[
    *Solution:* When the first word is short, Loop 1 is skipped and `curr` starts at the second word. Loop 2 visits each of the remaining `n - 1` words once, including words it removes. When every word is long, Loop 1 advances through all `n` words before reaching the empty list.
  ]
]
