#import "../../61c_exam/lib.typ": *

= Hog Revisited

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Fall 2022 Midterm 2 - Question 3 | *Level:* Regular
]

Represent a die by an iterator over its outcomes. Each call to `next(dice)` produces the next roll.

*Part A: Cycling outcomes.* Implement `make_test_dice` so that it repeatedly yields the values in `outcomes`, in order, forever. Assume `outcomes` is a non-empty list.

```python
def make_test_dice(outcomes):
    """Yield the outcomes repeatedly, in their original order.

    >>> dice = make_test_dice([1, 2, 3])
    >>> [next(dice) for _ in range(8)]
    [1, 2, 3, 1, 2, 3, 1, 2]
    """
    outcomes = list(outcomes)
    while True:
        for i in _______:  # (a)
            _______  # (b)
```

#part(points: 1)[
  Which expressions could fill in blank (a)?

  #multi-choice(
    cols: 1,
    none-above: false,
    correct()[`outcomes`],
    [`outcomes + make_test_dice(outcomes)`],
    [`outcomes.extend(make_test_dice(outcomes))`],
    [`outcomes[0] + make_test_dice(outcomes[1:])`],
    [`make_test_dice(outcomes) + make_test_dice(outcomes)`],
    [`make_test_dice(outcomes[0]) + make_test_dice(outcomes[1:])`],
  )
]

#part(points: 2)[
  Fill in blank (b).

  #multi-choice(
    cols: 1,
    none-above: false,
    correct()[`yield i`],
    [`yield outcomes`],
    [`yield outcomes[i]`],
    [`yield from i`],
    [`return i`],
  )
]

#pagebreak()

*Part B: Scoring a turn.* Implement `roll_dice`. It must consume exactly `num_rolls` outcomes from the iterator. If any outcome is 1, return 1; otherwise, return their sum. Assume `num_rolls` is positive.

```python
def roll_dice(num_rolls, dice):
    """Score a turn while consuming every requested roll.

    >>> dice = make_test_dice([6, 6, 6, 6, 6, 1])
    >>> roll_dice(5, dice)  # 6, 6, 6, 6, 6
    30
    >>> roll_dice(5, dice)  # 1, 6, 6, 6, 6
    1
    >>> roll_dice(2, dice)  # 6, 1
    1
    >>> roll_dice(10, make_test_dice([2, 4, 3]))
    29
    """
    rolls = _______  # (c)
    if _______:  # (d)
        return 1
    _______  # (e)
```

#part(points: 2)[
  Fill in blank (c).

  #multi-choice(
    cols: 1,
    none-above: false,
    correct()[`[next(dice) for _ in range(num_rolls)]`],
    [`[next(dice) for _ in range(num_rolls - 1)]`],
    [`[dice for _ in range(num_rolls)]`],
    [`next(dice)`],
    [`list(dice)`],
  )
]

#part(points: 1)[
  Fill in blank (d).

  #multi-choice(
    cols: 2,
    none-above: false,
    correct()[`1 in rolls`],
    [`1 not in rolls`],
    [`rolls == 1`],
    [`rolls[0] == 1`],
    [`sum(rolls) == 1`],
  )
]

#part(points: 2)[
  Fill in blank (e).

  #multi-choice(
    cols: 2,
    none-above: false,
    correct()[`return sum(rolls)`],
    [`return sum(dice)`],
    [`return len(rolls)`],
    [`return max(rolls)`],
    [`return rolls`],
  )
]

// Solution notes (from the official solutions):
// Part A: Iterating over outcomes visits each stored value once. The surrounding
// while True repeats that traversal. Calling the generator function produces a
// generator object; it does not produce a list that can be added to outcomes.
// Part B: Collecting the rolls first advances the iterator exactly num_rolls
// times, even when an early roll is 1. Returning immediately when a 1 appears
// would leave the iterator in the wrong position for the next turn.
