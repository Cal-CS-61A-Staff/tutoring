#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Cheap Donuts

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Fall 2023 - Final 8 | *Level:* Challenge
]

There are three tables in a database:

- The `donuts` table has a row for each menu option at a donut shop. There are
  columns for the `kind` (string) of dough and `flavor` (string). For example,
  there is one row for chocolate cake donuts (although the store may have many
  such donuts, they only have one menu option for this kind & flavor
  combination).
- The price of a donut depends only on the dough. The `prices` table has a row
  for each kind of dough. The `dough` (string) column contains the kind; the
  `price` (number) column is for one donut made from that kind of dough.
- Your friends only care about the flavor, not the kind of dough. The
  `quantity` table contains one row for every flavor your friends want. The
  `choice` (string) column is the flavor they want and the `k` (number) column
  is the number of donuts of that flavor they want.

#part(points: 6, breakable: false)[
  Create a table with two columns, `flavor` (string) and `total` (number) with
  one row for each flavor your friends want. The `total` column contains the
  *least expensive* total cost of buying `k` donuts of that flavor, where `k` is
  the number your friends want.

  The rows of the result can appear in any order. Here is an example, but
  complete the query so that it would work even if the contents or number of
  rows were different.

  #grid(
    columns: (auto, auto, auto, auto),
    gutter: 12pt,
    [
      `donuts`:
      #table(
        columns: 2,
        [*kind*], [*flavor*],
        [cake], [chocolate],
        [cake], [lemon],
        [cake], [vanilla],
        [raised], [cinnamon],
        [raised], [chocolate],
      )
    ],
    [
      `prices`:
      #table(
        columns: 2,
        [*dough*], [*price*],
        [cake], [2],
        [raised], [3],
      )
    ],
    [
      `quantity`:
      #table(
        columns: 2,
        [*choice*], [*k*],
        [chocolate], [6],
        [cinnamon], [3],
        [vanilla], [3],
      )
    ],
    [
      result:
      #table(
        columns: 2,
        [*flavor*], [*total*],
        [chocolate], [12],
        [cinnamon], [9],
        [vanilla], [6],
      )
    ],
  )

  ```sql
  SELECT flavor, _______ AS total FROM _______ WHERE _______ GROUP BY _______;
                   (a)                  (b)           (c)              (d)
  ```

  #subpart[
  *(a) (2 pt)* Fill in blank (a).
  #answer_box(width: 100%)[`MIN(price) * k` or `MIN(price * k)`]
  ]

  #subpart[
  *(b) (1 pt)* Fill in blank (b).
  #multi-choice(
    cols: 2,
    none-above: false,
    [`quantity, prices`],
    correct()[`quantity, donuts, prices`],
    [`donuts, prices AS a, prices AS b`],
    [`quantity, prices AS a, prices AS b`],
  )
  ]

  #subpart[
  *(c) (2 pt)* Fill in blank (c).
  #answer_box(width: 100%)[`kind=dough AND choice=flavor`]
  ]

  #subpart[
  *(d) (1 pt)* Fill in blank (d).
  #multi-choice(
    cols: 4,
    none-above: false,
    [`quantity`],
    [`dough`],
    [`kind`],
    correct()[`flavor`],
  )
  ]
]
