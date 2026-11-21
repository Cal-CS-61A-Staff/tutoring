#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Room Service

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Spring 2023 - Final 7 | *Level:* Regular
]

The `finals` table has columns `hall` (strings) and `course` (strings), and has
rows for each lecture `hall` in which a `course` is holding its final exam. Each
`course` and each `hall` value may appear multiple times because a course may
use multiple lecture halls at the same time, and a lecture hall may hold finals
for multiple courses at different times.

The `sizes` table has columns `room` (strings) and `seats` (numbers), and has one
row per unique `room` on campus containing the number of `seats` in that room.
Each `room` appears once. All lecture halls are rooms.

#part(points: 8, breakable: false)[
  Create a table with two columns, `course` (string) and `seats` (number), and
  with one row containing the name of the `course` and the total number of
  `seats` in final rooms for that course. Only include a row for *each course
  that uses at least two rooms for its final*.

  #grid(
    columns: (auto, auto, auto),
    gutter: 14pt,
    [
      `finals`:
      #table(
        columns: 2,
        [*hall*], [*course*],
        [RSF], [61A],
        [Wheeler], [61A],
        [RSF], [61B],
      )
    ],
    [
      `sizes`:
      #table(
        columns: 2,
        [*room*], [*seats*],
        [RSF], [900],
        [Wheeler], [700],
        [310 Soda], [40],
      )
    ],
    [
      Expected result:
      #table(
        columns: 2,
        [*course*], [*seats*],
        [61A], [1600],
      )
    ],
  )

  ```sql
  SELECT course, SUM(__(a)__) AS seats
    FROM __(b)__
    GROUP BY __(c)__;
  ```

  #subpart[
  *(a) (1 pt)* Fill in blank (a).
  #multi-choice(
    cols: 4,
    none-above: false,
    [`course`],
    [`room`],
    correct()[`seats`],
    [`sizes`],
  )
  ]

  #subpart[
  *(b) (4 pt)* Fill in blank (b).
  #answer_box(width: 100%)[`finals JOIN sizes ON hall = room`]
  ]

  #subpart[
  *(c) (3 pt)* Fill in blank (c).
  #multi-choice(
    cols: 2,
    none-above: false,
    [`hall WHERE seats > 1`],
    [`hall HAVING seats > 1`],
    [`hall WHERE sizes > 1`],
    [`hall HAVING sizes > 1`],
    [`hall WHERE COUNT(*) > 1`],
    [`hall HAVING COUNT(*) > 1`],
    [`course WHERE seats > 1`],
    [`course HAVING seats > 1`],
    [`course WHERE sizes > 1`],
    [`course HAVING sizes > 1`],
    [`course WHERE COUNT(*) > 1`],
    correct()[`course HAVING COUNT(*) > 1`],
  )
  ]
]