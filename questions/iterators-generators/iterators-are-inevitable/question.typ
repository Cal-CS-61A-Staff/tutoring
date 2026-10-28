#import "../../../61c_exam/lib.typ": *

#import "../../../61c_exam/states.typ"

= Iterators Are Inevitable

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Spring 2019 Final - Question 1 | *Level:* Regular
]

For each of the expressions in the table below, write the output displayed by the interactive Python interpreter when the expression is evaluated. The output may have multiple lines. The first row is completed for you.

- If an error occurs, write #smallcaps[*Error*], but include all output displayed before the error.
- To display a function value, write #smallcaps[*Function*].
- To display an iterator/generator value, write #smallcaps[*Iterator*].
- If an expression would take forever to evaluate, write #smallcaps[*Forever*].

The interactive interpreter displays the contents of the `repr` string of the value of a successfully evaluated expression, unless it is `None`.

Assume that you have started `python3` and executed the code below first, then you evaluate each expression in the table in the order shown. Expressions evaluated by the interpreter have a cumulative effect.

```python
def love():
    yield 1000
    yield from [2000, 3000]

x = love()
L = list(x)

def alternate(real, ity):
    i1, i2 = iter(real), iter(ity)
    try:
        while True:
            yield next(i1)
            yield next(i2)
    except StopIteration:
        yield 'inevitable'

thanos = ['power', 'space', 'reality']
tony = ['mind', 'soul', 'time']
i = iter(tony)
next(i)
tony.extend(list(i))
thanos = tony[2::-2]
```

#table(
  columns: (1fr, 1.3fr),
  align: (left + horizon, left + horizon),
  inset: (x: 10pt, y: 14pt),
  table.header([*Expression*], [*Output*]),
  [`pow(10, 2)`], [`100`],
  [`print(print('end', print('game')), x)`], [#context if states.printanswers.get() [#stack(dir: ttb, spacing: 1em, `game`, `end None`, `None Iterator`)]],
  [`L`], [#context if states.printanswers.get() [`[1000, 2000, 3000]`]],
  [`next(x)`], [#context if states.printanswers.get() [`Error`]],
  [`tony`], [#context if states.printanswers.get() [`['mind', 'soul', 'time', 'soul', 'time']`]],
  [`list(alternate(thanos[1:], thanos))`], [#context if states.printanswers.get() [`['mind', 'time', 'inevitable']`]],
)
