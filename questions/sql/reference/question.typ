#import "../../../61c_exam/lib.typ": *

#metadata("sql-reference") <titled-question>

#align(center)[
  #text(size: 15pt, weight: "bold")[SQL Reference]
]

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  This page summarizes the SQL features used in this worksheet. All queries
  follow SQLite rules. Every statement ends with a semicolon.
]

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  [
    *Structure of a query*

    ```text
    SELECT [columns]      -- 5
      FROM [tables]       -- 1
      WHERE [condition]   -- 2
      GROUP BY [columns]  -- 3
      HAVING [condition]  -- 4
      ORDER BY [columns]  -- 6
      LIMIT [number];     -- 7
    ```

    Only `SELECT` is required, and the clauses that appear must be in this
    order. The numbers show the order in which they are evaluated.

    *Creating tables*

    ```text
    CREATE TABLE dogs AS
      SELECT "abe" AS name, 7 AS age UNION
      SELECT "fox"        , 2;
    ```

    `SELECT` without `FROM` makes a one-row table. `UNION` combines the rows of
    two tables with the same number of columns (and removes duplicates).

    *Columns and expressions*

    `SELECT age * 7 AS dog_years` names a column, and the name can be used in
    `WHERE`, `ORDER BY`, and `HAVING`.

    Operators: `+`, `-`, `*`, `/`, `%`, `=`/`==`, `!=`/`<>`, `<`, `<=`, `>`,
    `>=`, `AND`, `OR`, `NOT`, and `||` (joins strings).

    - Integer division drops the remainder: `7 / 2` is `3`, but `7.0 / 2` is
      `3.5`.
    - `'yes'` and `"yes"` are strings; an unquoted `yes` is a column name.

    *Sorting and limiting*

    - `ORDER BY age` sorts in increasing order; `ORDER BY age DESC` sorts in
      decreasing order. `ORDER BY a, b` breaks ties in `a` using `b`.
    - `LIMIT n` keeps only the first `n` rows, and is usually combined with
      `ORDER BY`.
  ],
  [
    *Joining tables*

    Listing several tables in `FROM` joins them: the result has one row for
    every combination of a row from each table. These are equivalent:

    ```text
    SELECT * FROM a, b WHERE a.x = b.y;
    SELECT * FROM a JOIN b ON a.x = b.y;
    SELECT * FROM a JOIN b WHERE a.x = b.y;
    ```

    If `a` has 3 rows and `b` has 4 rows, `FROM a, b` has 12 rows before
    filtering.

    To join a table with itself, give each copy a name with `AS`:

    ```text
    SELECT p.name, c.name -- p older than c
      FROM dogs AS p, dogs AS c
      WHERE p.age > c.age;
    ```

    Use `table.column` (like `p.name`) when a column name appears in more
    than one table; otherwise the table name may be left out.

    *Aggregation and grouping*

    Aggregate functions combine many rows into one value:
    `COUNT(*)`, `SUM(x)`, `AVG(x)`, `MAX(x)`, `MIN(x)`.

    - Without `GROUP BY`, an aggregate combines all rows into one row.
    - With `GROUP BY col`, there is one output row per distinct value of
      `col`, and each aggregate combines only the rows in that group.
    - `WHERE` filters rows _before_ grouping and cannot use aggregates.
      `HAVING` filters groups _after_ grouping and can use them:

    ```text
    SELECT age, COUNT(*) FROM dogs
      WHERE name != "abe"   -- drop rows
      GROUP BY age
      HAVING COUNT(*) > 1;  -- drop groups
    ```

    With two or more arguments, `MAX` and `MIN` are not aggregates:
    `MAX(3, 8)` is `8` for each row, like Python's `max`.

    *Bare columns with `MAX` and `MIN`*

    A _bare column_ is a selected column that is neither aggregated nor
    listed in `GROUP BY`. When a query uses exactly one `MAX(x)` or `MIN(x)`
    aggregate, SQLite takes bare columns from the row that has the maximum
    or minimum value:

    ```text
    SELECT name, MAX(age) -- oldest dog
      FROM dogs;
    ```

    With `GROUP BY`, it gives one such row per group.
  ],
)
