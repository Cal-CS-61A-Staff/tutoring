#import "../../../61c_exam/lib.typ": *


= We're All the Same to Them

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Summer 2017 Final - Question 1 | *Level:* Challenge
]

For each of the expressions in the table below, write the output displayed by the interactive Python interpreter when the expression is evaluated. The output may have multiple lines. If an error occurs, write "Error", but include all output displayed before the error. If a function value is displayed, write "Function". If an iterator or generator value would be displayed, write "Iterator" (instead of something like `<iterator object at 0x...>`).

_Recall:_ The interactive interpreter displays the value of a successfully evaluated expression, unless it is `None`.

Assume that you have started `python3` and executed the following statements:

```python
def tee(iterable):
    it = iter(iterable)
    queues = [[], []]
    def gen(lst):
        while True:
            if not lst:
                try:
                    value = next(it)
                except StopIteration:
                    return
                for q in queues:
                    q.append(value)
            yield lst.pop(0)
    return [gen(queues[0]), gen(queues[1])]

yum = ['avocado', 'quinoa', 'cream cheese']
```

Expressions are evaluated in the order shown and have a cumulative effect. The first row is completed for you.

#let stmts(..lines) = stack(dir: ttb, spacing: 0.8em, ..lines.pos())
#let ans(body) = context if states.printanswers.get() [#body]

#table(
  columns: (1fr, 1fr),
  align: (left + horizon, left + horizon),
  inset: (x: 10pt, y: 11pt),
  table.header([*Expression*], [*Output*]),
  [`print(yum[0] + ' ' + yum[-1]) * 5`], [#stmts(`avocado cream cheese`, `Error`)],
  [`print(print(next(iter(yum))), next(yum))`], ans(stmts(`avocado`, `Error`)),
  [`next(iter(next(iter(yum))))`], ans(`'a'`),
  stmts(`eat = iter(tee(yum))`, `neat = next(eat)`, `next(neat)`), ans(`'avocado'`),
  stmts(`yum[0] = yum.pop()`, `yum.append(next(neat))`, `yum[:2]`), ans(`['cream cheese', 'quinoa']`),
  [`next(neat)`], ans(`'quinoa'`),
  stmts(`munch = next(iter(tee(yum)))`, `next(munch) + ' ' + next(next(eat))`), ans(`'cream cheese avocado'`),
)
