#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Students in SQL

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Fall 2025 - Final 8 | *Level:* Regular
]

The `students` table has one row per student and columns for their `name`
(string), the `discussion_id` (int) of their discussion, and a `keyword`
(string) chosen by the student. The keyword was used to place the student in a
discussion with other students who selected the same keyword.

The `discussions` table has one row per discussion and columns for the
discussion's unique `id` (int), the `ta` (string) who leads the discussion, and
the `room` (string) where the discussion is located.

The first few rows in each table are shown below. *Not all rows are shown.*

#grid(
  columns: (auto, auto, auto),
  gutter: 14pt,
  [
    `students`:
    #table(
      columns: 3,
      [*name*], [*discussion_id*], [*keyword*],
      [Chris], [2], [kickstart],
      [Pranav], [0], [tortilla],
      [Sebastian], [0], [tortilla],
      [Lavanya], [2], [kickstart],
      [Mia], [1], [unit2],
      [Mahanth], [0], [tortilla],
    )
    ...
  ],
  [
    `discussions`:
    #table(
      columns: 3,
      [*id*], [*ta*], [*room*],
      [1], [Rhys], [VLSB203],
      [2], [Amr], [Evans2],
      [0], [Janet], [Soda310],
    )
    ...
  ],
  [
    Expected result (Q3.1):
    #table(
      columns: 2,
      [*keyword*], [*total*],
      [tortilla], [3],
    )
    Expected result (Q3.2):
    #table(
      columns: 2,
      [*ta*], [*id*],
      [Rhys], [1],
      [Caleb], [12],
    )
  ],
)

#part(points: 3, breakable: false)[
  Select the most frequently used `keyword`, and the total number of students
  with that `keyword`. Assume there is one keyword used more than any other (no
  ties).

  ```sql
  SELECT keyword, __(a)__ AS total
    FROM students __(b)__;
  ```

  #subpart[
  *(a) (1 pt)* Fill in blank (a).
  #multi-choice(
    cols: 6,
    none-above: false,
    [`1`],
    [`name`],
    correct()[`COUNT(*)`],
    [`MAX(keyword)`],
    [`MAX(name)`],
    [`MAX(COUNT(*))`],
  )
  ]

  #subpart[
  *(b) (2 pt)* Fill in blank (b).
  #multi-choice(
    cols: 2,
    none-above: false,
    [`GROUP BY keyword`],
    [`GROUP BY keyword HAVING MAX(COUNT(*))`],
    [`GROUP BY keyword HAVING COUNT(*) = MAX(COUNT(*))`],
    [`GROUP BY keyword LIMIT MAX(COUNT(*))`],
    [`GROUP BY keyword ORDER BY keyword DESC LIMIT 1`],
    correct()[`GROUP BY keyword ORDER BY COUNT(*) DESC LIMIT 1`],
    [`AS s1 JOIN students AS s2 ON s1.keyword = s2.keyword LIMIT 1`],
    [`ORDER BY COUNT(*) DESC`],
    [`ORDER BY keyword DESC`],
    [`ORDER BY keyword DESC LIMIT MAX(COUNT(*))`],
    [`ORDER BY keyword DESC LIMIT 1`],
  )
  ]
]

#part(points: 3, breakable: false)[
  Create a new table `big` with one row for each discussion that has more than
  20 students. The columns give the `ta` name and discussion `id` for each of
  these discussions.

  The expected `big` result is shown above. The first row indicates that the
  discussion with ID 1 taught by Rhys has more than 20 students in it (even
  though only 1 of these students is shown in the example rows of the
  `students` table).

  ```sql
  CREATE TABLE big AS
    SELECT ta, id
      FROM students
        JOIN discussions __(c)__;
  ```

  #subpart[
  *(c) (3 pt)* Fill in blank (c).
  #answer_box(width: 100%)[`ON discussion_id = id GROUP BY id HAVING COUNT(*) > 20` *(*`GROUP BY discussion_id` also works*)*]
  ]
]
