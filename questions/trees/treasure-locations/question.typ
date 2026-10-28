#import "../../../61c_exam/lib.typ": *

= Where's the Treasure?

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Original source:* Spring 2026 - Final - Question 4 | *Level:* Challenge
]

The function `treasure_locations` accepts a single parameter `t`, an instance of the `Tree` class where all non-leaf nodes have two branches, the label of each node is either `'room'` or `'treasure'`, and only leaf nodes can have the `'treasure'` label. Here's a drawing of an example input tree:

#align(center)[
  #image("treasure-tree.png", width: 350pt)
]

The function returns a list of locations of treasures in `t`, where each location is a two-element list with the "depth" as the first element and the "right" as the second element. The "depth" of the root node is 0, and it increases by one at each level of the tree down from the root node. The right-most node of each level of the tree has a "right" of 0, and it increases from there, so it represents the number of nodes on that level that are to the right of the given node.

Here's the same tree where each node is labeled with its location:

#align(center)[
  #image("treasure-locations.png", width: 350pt)
]

When `treasure_locations` is called on the example tree, it returns `[[2, 2], [2, 1]]`, since the two treasures are located at `[2, 2]` and `[2, 1]`.

#part(points: 9)[
  Complete the `treasure_locations` function below according to the doctests and description.

  *Note:* `sum([[2, 3]], [1]) == [1, 2, 3]`; the sum starts at `[1]`, then adds `[2, 3]`.

  ```python
  def treasure_locations(t):
      """Return the [depth, right] location of each treasure in t.

      >>> t1 = Tree('room', [Tree('treasure'), Tree('room')])
      >>> print(t1)
      room
        treasure
        room
      >>> treasure_locations(t1)
      [[1, 1]]
      >>> t2 = Tree('room', [Tree('room', [Tree('room'), Tree('treasure')]),
      ...                    Tree('room', [Tree('treasure'), Tree('room')])])
      >>> treasure_locations(t2)
      [[2, 2], [2, 1]]
      >>> no_treasures = Tree('room', [Tree('room'),
      ...                              Tree('room', [Tree('room'), Tree('room')])])
      >>> treasure_locations(no_treasures)
      []
      """
      def helper(t, depth, right):
          if t.label == 'treasure':
              return _________
                     # (a)
          locations = [helper(
              _________,
              # (b)
              _________,
              # (c)
              _________ + len(t.branches) - 1 - i
              # (d)
          ) for i in _________]
                     # (e)
          return sum(locations, [])
      _________
      # (f)
  ```

  #grid(
    columns: 2,
    gutter: 8pt,
    [(a) #answer_box(width: 205pt, height: 30pt)[`[[depth, right]]`]],
    [(b) #answer_box(width: 205pt, height: 30pt)[`t.branches[i]`]],
    [(c) #answer_box(width: 205pt, height: 30pt)[`depth + 1`]],
    [(d) #answer_box(width: 205pt, height: 30pt)[`right * 2`]],
    [(e) #answer_box(width: 205pt, height: 30pt)[`range(len(t.branches))`]],
    [(f) #answer_box(width: 205pt, height: 30pt)[`return helper(t, 0, 0)`]],
  )
]
