#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= The Big SQL

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Summer 2019 - Final 8 | *Level:* Regular
]

The `ingredients` table describes the `dish` and `part` for each part of each
dish at a restaurant. The `shops` table describes the `food`, `shop`, and
`price` for each part of a dish sold at each of two shops. All ingredients
(parts) are sold by both shops, and each ingredient will only appear once for
each shop. Write your SQL statements so that they would still be correct if
table contents changed. You can assume the `shops` table will only ever contain
two shops (A and B).

#grid(
  columns: (auto, auto, auto, auto),
  gutter: 24pt,
  [
    `ingredients`:
    #table(
      columns: 2,
      [*dish*], [*part*],
      [chili], [beans],
      [chili], [onions],
      [soup], [broth],
      [soup], [onions],
      [beans], [beans],
    )
  ],
  [
    `shops`:
    #table(
      columns: 3,
      [*food*], [*shop*], [*price*],
      [beans], [A], [2],
      [beans], [B], [2],
      [onions], [A], [3],
      [onions], [B], [2],
      [broth], [A], [3],
      [broth], [B], [5],
    )
  ],
  [
    Expected result (Q4.1):
    #table(
      columns: 2,
      [*food*], [*lowest_price*],
      [beans], [2],
      [broth], [3],
      [onions], [2],
    )
  ],
  [
    Expected result (Q4.2):
    #table(
      columns: 2,
      [*dish*], [*total_cost*],
      [beans], [2],
      [chili], [5],
      [soup], [6],
    )
  ],
)

#part(points: 2, breakable: false)[
  Select a two-column table with one row per food that describes the lowest
  price for each food. The expected result is shown above.

  ```sql
  SELECT food, __(a)__ AS lowest_price
    FROM shops
    __(b)__;
  ```

  #subpart[
  *(a) (1 pt)* Fill in blank (a).
  #answer_box(width: 100%)[`MIN(price)`]
  ]

  #subpart[
  *(b) (1 pt)* Fill in blank (b).
  #answer_box(width: 100%)[`GROUP BY food`]
  ]
]

#part(points: 4, breakable: false)[
  Select a two-column table with one row per dish that describes the total cost
  of each dish if all parts are purchased from shop A. The expected result is
  shown above.

  ```sql
  SELECT dish, __(c)__ AS total_cost
    FROM __(d)__
    GROUP BY __(e)__;
  ```

  #subpart[
  *(c) (1 pt)* Fill in blank (c).
  #answer_box(width: 100%)[`SUM(price)`]
  ]

  #subpart[
  *(d) (2 pt)* Fill in blank (d).
  #answer_box(width: 100%)[`ingredients JOIN shops ON food = part AND shop = "A"` *(*`WHERE` instead of `AND` also works*)*]
  ]

  #subpart[
  *(e) (1 pt)* Fill in blank (e).
  #answer_box(width: 100%)[`dish`]
  ]
]

#part(points: 4, breakable: false)[
  In two different ways, select a one-column table of all foods that have a
  different price at each shop. Each query should list each such food once.

  Expected result (rows may appear in any order):
  #table(
    columns: 1,
    [*food*],
    [onions],
    [broth],
  )

  ```sql
  SELECT __(f)__
    FROM __(g)__
      JOIN __(h)__ ON __(i)__;
  ```

  #subpart[
  *(f) (0.5 pt)* Fill in blank (f).
  #answer_box(width: 100%)[`a.food` *or* `b.food`]
  ]

  #subpart[
  *(g) (0.5 pt)* Fill in blank (g).
  #answer_box(width: 100%)[`shops AS a`]
  ]

  #subpart[
  *(h) (0.5 pt)* Fill in blank (h).
  #answer_box(width: 100%)[`shops AS b`]
  ]

  #subpart[
  *(i) (1 pt)* Fill in blank (i).
  #answer_box(width: 100%)[`a.food = b.food AND a.price > b.price` *or* `a.food = b.food AND a.price < b.price`]
  ]

  #v(8pt)

  ```sql
  SELECT __(j)__
    FROM shops
    GROUP BY __(k)__;
  ```

  #subpart[
  *(j) (0.5 pt)* Fill in blank (j).
  #answer_box(width: 100%)[`food`]
  ]

  #subpart[
  *(k) (1 pt)* Fill in blank (k).
  #answer_box(width: 100%)[`food HAVING MAX(price) > MIN(price)` *(*`!=` also works*)* *or* `food HAVING COUNT(DISTINCT price) > 1`]
  ]
]
