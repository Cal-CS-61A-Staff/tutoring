#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Model, View, Update

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Lecture 32 - Browsers and Web Applications | *Level:* Regular-Hard
]

A web application built with the Lustre framework keeps a counter and a history
of the counts it has shown. Complete its `update` function. Ignore effects, so
`update` returns only a `Model`.

```gleam
pub type Model {
  Model(count: Int, history: List(Int))
}

pub type Msg {
  UserClickedAdd
  UserClickedReset
}

pub fn update(model: Model, msg: Msg) -> Model {
  case msg {
    UserClickedAdd -> Model(_______, [_______, ..model.history])  // (a), (b)
    UserClickedReset -> Model(_______, model.history)             // (c)
  }
}

assert update(Model(0, []), UserClickedAdd) == Model(1, [0])
assert update(Model(3, [2, 1, 0]), UserClickedReset) == Model(0, [2, 1, 0])
```

#part(points: 2)[
  Fill in blanks (a) and (b).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(a)#h(0.6em)])[`model.count + 1`],
    answer_box(width: 100%, pre: [(b)#h(0.6em)])[`model.count`],
  )
]

#part(points: 1)[
  Fill in blank (c).

  #multi-choice(
    cols: 4,
    none-above: false,
    correct()[`0`], [`1`], [`model.count`], [`[]`],
  )
]

#part(points: 1)[
  The model starts as `Model(0, [])`. The user clicks add three times, then reset,
  then add. What is the model now?

  #answer_box(width: 60%)[`Model(1, [0, 2, 1, 0])`]
]

#part(points: 1)[
  The user clicks the add button. Which of the following happen? Select *all*
  that apply.

  #multi-select(
    cols: 1,
    none-above: false,
    correct()[The framework sends the message `UserClickedAdd` to `update`.],
    correct()[`update` returns a new `Model`, and the old `Model` value is unchanged.],
    correct()[The framework calls `view` on the new model, then edits the DOM efficiently.],
    [The framework changes the `count` of the old `Model` in place.],
    [The framework parses the whole HTML page again from scratch.],
  )
]

*Client and server.* The Hog GUI uses Python for the game simulation and Gleam
for the web interface. The Gleam code runs in the browser (the client), and the
Python code runs on a server.

#part(points: 1)[
  Which of the following does the *server* do? Select *all* that apply.

  #multi-select(
    cols: 2,
    none-above: false,
    correct()[Randomly roll dice], [Configure a game],
    correct()[Simulate a game], [Let human players take turns],
    correct()[Compute strategies for computer players], [Show outcomes],
  )
]

// Solution notes:
// A new count is one more than the current count, and the current count is
// pushed onto the front of the history. Reset sets the count to 0 and keeps the
// history. Starting from Model(0, []): add gives Model(1, [0]), add gives
// Model(2, [1, 0]), add gives Model(3, [2, 1, 0]), reset gives
// Model(0, [2, 1, 0]), and add gives Model(1, [0, 2, 1, 0]). Gleam values are
// immutable, so update always builds a new Model. The model and messages are
// ordinary Gleam; the view uses Lustre functions to make elements, attributes
// and events.
