#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Pokemon SQarLet

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Fall 2022 - Final 9 | *Level:* Challenge
]

You've been hired as the newest Gym Leader of the Paldea region! Now you need
to decide what team to make. All your available Pokemon (for this question,
Pokemon stats have been simplified) are listed in a SQL table `Pokemon`:

#table(
  columns: 7,
  [*Name*], [*Type1*], [*Type2*], [*Move1*], [*Move2*], [*BaseAttack*], [*BaseDefense*],
  [Rattata], [Normal], [None], [Endeavor], [Quick Attack], [0], [0],
  [Maushold], [Normal], [None], [Population Bomb], [Tidy Up], [30], [30],
  [Cyclizar], [Dragon], [Normal], [Shed Tail], [Dragon Rush], [100], [40],
  [Meowscarada], [Grass], [Dark], [Flower Trick], [Agility], [80], [40],
  [Farigiraf], [Normal], [Psychic], [Agility], [Twin Beam], [40], [50],
)

You also have a table `Moves` listing all Pokemon moves:

#table(
  columns: 3,
  [*Name*], [*MoveAttack*], [*MoveDefense*],
  [Endeavor], [250], [0],
  [Quick Attack], [40], [45],
  [Shed Tail], [0], [150],
  [Dragon Rush], [80], [0],
  [Flower Trick], [90], [55],
  [Agility], [50], [20],
  [Twin Beam], [80], [30],
  [Population Bomb], [100], [50],
  [Tidy Up], [30], [150],
)

#part(points: 7, breakable: false)[
  Create a table `Attack`, which lists the `Name` and `TotalAttack` of each
  Pokemon. The total attack of a Pokemon is equal to the sum of a Pokemon's
  `BaseAttack` and the `MoveAttack` of both moves it knows. Order rows by total
  attack.

  For example, Maushold has a base attack of 30, and has two moves with
  `MoveAttack` values 100 and 30, respectively. Its total attack is
  $30 + 100 + 30 = 160$. With the above tables, you should have the following
  result:

  #table(
    columns: 2,
    [*Name*], [*TotalAttack*],
    [Maushold], [160],
    [Farigiraf], [170],
    [Cyclizar], [180],
    [Meowscarada], [220],
    [Rattata], [290],
  )

  ```sql
  CREATE TABLE Attack AS
  SELECT __(a)__ AS Name, __(b)__ AS TotalAttack FROM __(c)__ WHERE __(d)__
  ORDER BY TotalAttack;
  ```

  #subpart[
  *(a) (1 pt)* Select all options that could fill in blank (a).
  #multi-select(
    cols: 3,
    none-above: false,
    [`Name`],
    correct()[`p.Name`],
    [`q.Name`],
    [`a.Name`],
    [`b.Name`],
  )
  ]

  #subpart[
  *(b) (2 pt)* Fill in blank (b).
  #answer_box(width: 100%)[`BaseAttack + a.MoveAttack + b.MoveAttack`]
  ]

  #subpart[
  *(c) (2 pt)* Select all options that could fill in blank (c).
  #multi-select(
    cols: 2,
    none-above: false,
    [`Pokemon, Moves`],
    [`Pokemon, Pokemon, Moves`],
    [`Pokemon, Moves, Moves`],
    [`Pokemon as p, Moves as a`],
    [`Pokemon as p, Pokemon as q, Moves as a`],
    correct()[`Pokemon as p, Moves as a, Moves as b`],
  )
  ]

  #subpart[
  *(d) (2 pt)* Fill in blank (d).
  #answer_box(width: 100%)[`p.Move1 = a.Name AND p.Move2 = b.Name`]
  ]
]
