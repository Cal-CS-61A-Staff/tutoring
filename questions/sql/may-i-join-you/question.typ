#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= An SQL Query walks over and says: "May I JOIN you?"

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Spring 2026 - Final 3 | *Level:* Challenge
]

You are managing a music festival and have the following database. Any queries
you write should also work if you are given larger versions of these tables.

`artists`:
#table(
  columns: 4,
  [*aconst*], [*name*], [*genres*], [*rec_labels*],
  [1], [Sudan Archives], [Electro, R&B], [Stones Throw],
  [2], [Hozier], [Blues, Folk, Soul], [Rubyworks, Island, Columbia],
  [3], [SZA], [Hip-Hop, Pop, R&B], [TDE, RCA],
  [4], [Shakey Graves], [Blues, Country, Folk, Rock], [Dualtone],
  [5], [Bad Bunny], [Hip-Hop, Latin Trap, Reggaeton], [Hear This Music, Rimas],
)

`performances`:
#table(
  columns: 5,
  [*pconst*], [*aconst*], [*stage*], [*start_time*], [*duration*],
  [1], [3], [Main], [17:00], [60],
  [2], [1], [Meadow], [15:00], [45],
  [3], [1], [Main], [21:00], [90],
  [4], [5], [Main], [18:00], [60],
  [5], [2], [Meadow], [17:00], [60],
  [6], [4], [Meadow], [18:00], [45],
  [7], [2], [Main], [20:00], [60],
)

#part(points: 2)[
  Complete the query to retrieve the name and record labels of all artists who
  are in the Folk genre.

  ```sql
  SELECT ______________ FROM artists WHERE ______________________;
  ```

  #answer_box(width: 100%)[
    ```sql
    SELECT name, rec_labels FROM artists WHERE genres LIKE '%Folk%';
    ```
  ]
]

#part(points: 3)[
  Complete the query to display the name of each artist alongside the stage
  they performed on and the duration of the performance in order of longest to
  shortest (an artist can appear multiple times if they perform multiple
  times).

  ```sql
  SELECT a.name, p.stage, p.duration FROM ________________________________
  ON ____________________ ORDER BY ________________;
  ```

  #answer_box(width: 100%)[
    ```sql
    SELECT a.name, p.stage, p.duration FROM artists AS a JOIN performances AS p
    ON a.aconst = p.aconst ORDER BY p.duration DESC;
    ```
  ]
]

#part(points: 4)[
  Complete the query to return the names of performers who are on stage for
  strictly more than 2 hours (i.e. more than 120 minutes) and also display the
  duration of their longest performance as column `longest_show`.

  ```sql
  SELECT a.name, ________________ AS longest_show FROM artists AS a JOIN performances AS p
  ON ____________________ GROUP BY ____________ HAVING ____________________;
  ```

  #answer_box(width: 100%)[
    ```sql
    SELECT a.name, MAX(p.duration) AS longest_show FROM artists AS a JOIN performances AS p
    ON a.aconst = p.aconst GROUP BY p.aconst HAVING SUM(p.duration) > 120;
    ```
  ]
]

#part(points: 4)[
  You write the following query:

  ```sql
  SELECT first.start_time, first.stage AS stage1, second.stage AS stage2
  FROM performances AS first JOIN performances AS second
  ON first.pconst != second.pconst
  WHERE first.start_time = second.start_time;
  ```

  Complete the table this query returns. You may not need to use all the rows.

  #table(
    columns: (1fr, 1fr, 1fr),
    [*start_time*], [*stage1*], [*stage2*],
    [~], [], [],
    [~], [], [],
    [~], [], [],
    [~], [], [],
    [~], [], [],
    [~], [], [],
  )

  #answer_box(width: 100%)[
    #table(
      columns: 3,
      [*start_time*], [*stage1*], [*stage2*],
      [17:00], [Main], [Meadow],
      [18:00], [Main], [Meadow],
      [17:00], [Meadow], [Main],
      [18:00], [Meadow], [Main],
    )
  ]
]

#part(points: 3)[
  Any single performance that is at least 60 minutes requires hiring stage
  hands at a different pay bracket. Complete the query to find the total stage
  time (in minutes) per stage, but only include the time for performances that
  go for at least an hour. Label the total column `total_mins`, and sort by
  total minutes from highest to lowest.

  ```sql
  SELECT stage, _______ FROM performances _______;
                  (a)                       (b)
  ```

  *i. (1 pt)* Fill in blank (a).
  #multi-choice(
    cols: 2,
    none-above: false,
    [`MAX(duration) AS total_mins`],
    correct()[`SUM(duration) AS total_mins`],
    [`SUM(COUNT(*)) AS total_mins`],
    [`COUNT(*) AS total_mins`],
  )

  *ii. (2 pt)* Fill in blank (b).
  #multi-choice(
    cols: 1,
    none-above: false,
    [`GROUP BY stage HAVING duration >= 60 ORDER BY total_mins DESC`],
    [`GROUP BY pconst HAVING duration >= 60 ORDER BY total_mins DESC`],
    [`GROUP BY stage HAVING duration >= 60 ORDER BY total_mins`],
    correct()[`WHERE duration >= 60 GROUP BY stage ORDER BY total_mins DESC`],
    [`WHERE start_time - duration >= 60 GROUP BY stage ORDER BY total_mins`],
  )
]
