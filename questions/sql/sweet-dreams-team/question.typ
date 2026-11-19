#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= The Sweet Dreams Team

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Summer 2024 - Final 8 | *Level:* Challenge
]

The USA Basketball Men's National Team is competing in the 2024 Olympics and
needs your help to analyze their players' performances. Complete the SQL
queries using the two tables below.

_Hint:_ You may use SQL keywords in the blanks.

The `box_scores` table contains data on how many minutes they spent playing in
one game as well as how many points, rebounds, and assists each player got in
that game. The `nba_data` table contains data on which National Basketball
Association (NBA) team each player plays for as well as which position each
player plays.

#grid(
  columns: (auto, auto),
  gutter: 14pt,
  [
    `box_scores`:
    #table(
      columns: 5,
      [*name*], [*minutes*], [*points*], [*rebounds*], [*assists*],
      [LeBron James], [20.4], [14], [4], [4],
      [Anthony Edwards], [20.6], [13], [2], [1],
      [Stephen Curry], [21.8], [13], [2], [2],
      [Anthony Davis], [17.6], [12], [10], [1],
      [Joel Embiid], [16.6], [10], [7], [3],
      [Jrue Holiday], [17.8], [8], [4], [3],
      [Bam Adebayo], [17.6], [8], [5], [1],
      [Devin Booker], [20.0], [7], [2], [1],
      [Jayson Tatum], [17.8], [6], [3], [2],
      [Micah Potter], [2.5], [3], [0], [0],
      [Tyrese Haliburton], [14.8], [2], [2], [3],
      [Derrick White], [11.3], [1], [2], [2],
    )
  ],
  [
    `nba_data`:
    #table(
      columns: 3,
      [*name*], [*nba_team*], [*position*],
      [LeBron James], [Lakers], [Forward],
      [Anthony Edwards], [Timberwolves], [Guard],
      [Stephen Curry], [Warriors], [Guard],
      [Anthony Davis], [Lakers], [Center],
      [Joel Embiid], [Sixers], [Center],
      [Jrue Holiday], [Celtics], [Guard],
      [Bam Adebayo], [Heat], [Center],
      [Devin Booker], [Suns], [Guard],
      [Jayson Tatum], [Celtics], [Forward],
      [Micah Potter], [Jazz], [Center],
      [Tyrese Haliburton], [Pacers], [Guard],
      [Derrick White], [Celtics], [Guard],
    )
  ],
)

#part(points: 2, breakable: false)[
  *Points-Per-Minute.* Write a SQL query that returns the names of the top 5
  players with the most points-per-minute (PPM) who played for at least 5
  minutes in order from highest PPM to lowest PPM. PPM is calculated as points
  divided by minutes.

  Expected output:
  #table(
    columns: 1,
    [*name*],
    [LeBron James],
    [Anthony Davis],
    [Anthony Edwards],
    [Joel Embiid],
    [Stephen Curry],
  )

  ```sql
  SELECT name FROM __________;
                      (a)
  ```

  #subpart[
  *(a) (2 pt)* Fill in blank (a).
  #answer_box(width: 100%)[`box_scores WHERE minutes >= 5 ORDER BY points / minutes DESC LIMIT 5`]
  ]
]

#part(points: 4, breakable: false)[
  *More Rebounds = More Points?* Write a SQL query that returns the names of NBA
  teams and average number of points scored by players that play for that NBA
  team in order from most average rebounds to least average rebounds for the
  NBA teams that have a total of 5 or more rebounds across all their players.
  Only players who played for at least 5 minutes should be considered in these
  calculations.

  Expected output:
  #table(
    columns: 2,
    [*nba_team*], [*average points*],
    [Sixers], [10.0],
    [Lakers], [13.0],
    [Heat], [8.0],
    [Celtics], [5.0],
  )

  ```sql
  SELECT __________ FROM __________ WHERE __________ GROUP BY __________ ORDER BY __________;
           (b)             (c)             (d)                (e)                (f)
  ```

  #subpart[
  *(b) (1 pt)* Fill in blank (b).
  #answer_box(width: 100%)[`nba_team, AVG(points)`]
  ]

  #subpart[
  *(c) (0.5 pt)* Fill in blank (c).
  #multi-choice(
    cols: 2,
    none-above: false,
    [`box_scores`],
    [`nba_data`],
    [`box_scores AS b1, box_scores AS b2`],
    [`nba_data AS n1, nba_data AS n2`],
    correct()[`box_scores AS b, nba_data AS n`],
  )
  ]

  #subpart[
  *(d) (1 pt)* Fill in blank (d).
  #answer_box(width: 100%)[`minutes >= 5 AND b.name = n.name`]
  ]

  #subpart[
  *(e) (0.5 pt)* Fill in blank (e).
  #answer_box(width: 100%)[`nba_team HAVING SUM(rebounds) >= 5`]
  ]

  #subpart[
  *(f) (1 pt)* Fill in blank (f).
  #answer_box(width: 100%)[`AVG(rebounds) DESC`]
  ]
]

#part(points: 4, breakable: false)[
  *Assists-Per-Minute.* Write a SQL query that returns each position, the name
  of the one player with the most assists-per-minute (APM) in that position,
  and that player's APM value in order from highest APM to lowest APM. APM is
  calculated as assists divided by minutes. Only players who played for at
  least 5 minutes should be considered in these calculations.

  _Hint:_ When a query selects `MAX(...)` or `MIN(...)` alongside other columns
  that are not grouped (bare columns), SQLite fills those columns using the row
  that produced the maximum or minimum value.

  Expected output:
  #table(
    columns: 3,
    [*position*], [*name*], [*APM*],
    [Guard], [Tyrese Haliburton], [0.2027027027027027],
    [Forward], [LeBron James], [0.19607843137254904],
    [Center], [Joel Embiid], [0.18072289156626503],
  )

  ```sql
  SELECT __________ FROM __________ WHERE __________ GROUP BY __________ ORDER BY __________;
           (g)             (h)             (i)                (j)                (k)
  ```

  #subpart[
  *(g) (1 pt)* Fill in blank (g).
  #answer_box(width: 100%)[`position, b.name, MAX(assists / minutes)` or `position, n.name, MAX(assists / minutes)`]
  ]

  #subpart[
  *(h) (0.5 pt)* Fill in blank (h).
  #multi-choice(
    cols: 2,
    none-above: false,
    [`box_scores`],
    [`nba_data`],
    [`box_scores AS b1, box_scores AS b2`],
    [`nba_data AS n1, nba_data AS n2`],
    correct()[`box_scores AS b, nba_data AS n`],
  )
  ]

  #subpart[
  *(i) (1 pt)* Fill in blank (i).
  #answer_box(width: 100%)[`minutes >= 5 AND b.name = n.name`]
  ]

  #subpart[
  *(j) (0.5 pt)* Fill in blank (j).
  #answer_box(width: 100%)[`position`]
  ]

  #subpart[
  *(k) (1 pt)* Fill in blank (k).
  #answer_box(width: 100%)[`MAX(assists / minutes) DESC` or `assists / minutes DESC`]
  ]
]
