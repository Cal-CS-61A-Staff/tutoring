#import "../../61c_exam/lib.typ": *
#import "../../61c_exam/questions/answer-box.typ": answer_box

= Do You Yield?

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Fall 2019 Midterm 2 - Question 5 (Part B adapted to counting a line's executions) | *Level:* Regular
]

Implement the generator `partitions(n, m)`. Each yielded string describes one way to write positive integer `n` as a sum of non-increasing positive integers no larger than positive integer `m`. Yield each partition exactly once, in the order shown.

Do not add `lambda`, `if`, `and`, `or`, lists, tuples, or dictionaries beyond those already present in the template. Blanks (c) and (e) each contain the two arguments of a recursive call, separated by a comma.

```python
def partitions(n, m):
    """Yield partitions of n with parts no larger than m.

    >>> list(partitions(1, 1))
    ['1']
    >>> list(partitions(2, 2))
    ['2', '1 + 1']
    >>> list(partitions(4, 2))
    ['2 + 2', '2 + 1 + 1', '1 + 1 + 1 + 1']
    """
    if _______:  # (a)
        yield _______  # (b)
    if n > 0 and m > 0:
        for p in partitions(_______):  # (c)
            yield _______  # (d)
        yield from partitions(_______)  # (e)
```

#part(points: 2)[
  Fill in blanks (a) and (b).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(a)#h(0.6em)])[`n == m`],
    answer_box(width: 100%, pre: [(b)#h(0.6em)])[`str(m)`],
  )
]

#part(points: 1)[
  Fill in blank (c).

  #multi-choice(
    cols: 3,
    none-above: false,
    correct()[`n - m, m`],
    [`n - m, m - 1`],
    [`n - 1, m`],
    [`n, m - 1`],
    [`n, m`],
  )
]

#part(points: 2)[
  Fill in blank (d).

  #answer_box(width: 70%, pre: [(d)#h(0.6em)])[`str(m) + ' + ' + p`]
]

#part(points: 1)[
  Fill in blank (e).

  #multi-choice(
    cols: 3,
    none-above: false,
    correct()[`n, m - 1`],
    [`n - m, m`],
    [`n - m, m - 1`],
    [`n - 1, m`],
    [`n, m`],
  )
]

*Part B: Counting a line.* Assume `partitions` is implemented correctly. For a positive integer `n`, how many times does line X run?

```python
for p in partitions(n, 2):
    print(p)  # X
```

#part(points: 1)[
  Select the Python expression in `n` for the number of times line X runs.

  #multi-choice(
    cols: 3,
    none-above: false,
    correct()[`n // 2 + 1`],
    [`n // 2`],
    [`(n + 1) // 2`],
    [`n`],
    [`n + 1`],
  )
]

// Solution notes (from the official solutions):
// A partition either includes m or uses parts up to m - 1. For Part B, choose
// 0 through n // 2 twos; the remaining parts are ones. Each choice yields one
// partition and one execution of line X.
