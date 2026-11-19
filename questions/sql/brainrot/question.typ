#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= WHERE Brainrot='Italian'

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Spring 2025 - Final 8 | *Level:* Regular
]

The `who` table has one row per character with its `name` (a unique string),
`size` (a number), and `kind` (a string). The `kinds` table has one row per kind
that shows whether it's `living` (`'yes'` or `'no'`) and `what` kind it is (a
unique string).

#grid(
  columns: (auto, auto),
  gutter: 14pt,
  [
    `who`:
    #table(
      columns: 3,
      [*name*], [*size*], [*kind*],
      [tralalero tralala], [800.0], [reptile],
      [bombardiro crocodillo], [600.0], [reptile],
      [lirili larila], [1500.0], [mammal],
      [capuchino assassino], [60.0], [object],
      [brr brr patapim], [80.0], [mammal],
      [chimpanzini bananini], [90.0], [mammal],
      [tung tung tung sahur], [200.0], [object],
    )
  ],
  [
    `kinds`:
    #table(
      columns: 2,
      [*living*], [*what*],
      [yes], [mammal],
      [yes], [reptile],
      [no], [object],
    )
  ],
)

#part(points: 3, breakable: false)[
  Fill in blank (a) to create a one-row, one-column table containing the
  `total` size of all characters that have a `living` kind.

  #table(
    columns: 1,
    [*total*],
    [3070.0],
  )

  ```sql
  SELECT SUM(size) AS total FROM _______;
                                   (a)
  ```

  #subpart[
  *(a) (3 pt)* Fill in blank (a).
  #multi-choice(
    cols: 1,
    none-above: false,
    [`who JOIN kinds ON kind=what WHERE kind=living`],
    [`who JOIN kinds ON kind=what WHERE kind='living'`],
    [`who JOIN kinds ON kind=what WHERE living=yes`],
    correct()[`who JOIN kinds ON kind=what WHERE living='yes'`],
    [`who JOIN kinds ON kind=kinds WHERE kind=living`],
    [`who JOIN kinds ON kind=kinds WHERE kind='living'`],
    [`who JOIN kinds ON kind=kinds WHERE living=yes`],
    [`who JOIN kinds ON kind=kinds WHERE living='yes'`],
  )
  ]
]

#part(points: 3, breakable: false)[
  Two characters can battle if the smaller one is at least half the size of the
  larger one (or they are the same size). Complete the query to create a table
  with one row per character that has two columns: the character's `name` and
  the `number` of other characters it can battle. For example,
  `lirili larila` can only battle `tralalero tralala` because all other
  characters are too small. Do not include rows for characters that cannot
  battle any other characters.

  #table(
    columns: 2,
    [*name*], [*number*],
    [bombardiro crocodillo], [1],
    [brr brr patapim], [2],
    [capuchino assassino], [2],
    [chimpanzini bananini], [2],
    [lirili larila], [1],
    [tralalero tralala], [2],
  )

  ```sql
  SELECT a.name,COUNT(*) FROM who AS a, who AS b
  WHERE a.name != b.name AND _______ GROUP BY a.name;
                               (b)
  ```

  #subpart[
  *(b) (3 pt)* Select all options that could fill in blank (b).
  #multi-select(
    cols: 1,
    none-above: false,
    [`a.size >= b.size * 0.5`],
    [`b.size >= a.size * 0.5`],
    [`a.size >= b.size * 0.5 OR b.size >= a.size * 0.5`],
    correct()[`a.size >= b.size * 0.5 AND b.size >= a.size * 0.5`],
    [`MIN(a.size, b.size) >= b.size * 0.5`],
    [`a.size >= MAX(a.size, b.size) * 0.5`],
    correct()[`MIN(a.size, b.size) >= MAX(a.size, b.size) * 0.5`],
    correct()[`MIN(a.size / b.size, b.size / a.size) >= 0.5`],
    [`MAX(a.size / b.size, b.size / a.size) >= 0.5`],
  )
  ]
]
