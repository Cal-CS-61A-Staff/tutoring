#import "../../61c_exam/lib.typ": *

#align(center)[
  #text(size: 15pt, weight: "bold")[Reference: New `Link` and `Tree` Types]
]

Use these definitions for every question in this worksheet.

```python
from __future__ import annotations
from dataclasses import dataclass, field

type LinkedList[T] = Link[T] | tuple[()]

@dataclass
class Link[T]:
    first: T
    rest: LinkedList[T] = ()

    def __str__(self):
        return format_link(self)

def format_link(s: Link):
    string = '(' + str(s.first)
    remaining = s.rest
    while isinstance(remaining, Link):
        string += ' ' + str(remaining.first)
        remaining = remaining.rest
    assert remaining == (), f'{s!r} is not a LinkedList'
    return string + ')'

@dataclass
class Tree[T]:
    label: T
    branches: list[Tree[T]] = field(default_factory=list)

    def __str__(self):
        return format_tree(self)

def format_tree(t: Tree, indent='') -> str:
    assert isinstance(t, Tree), f'{t!r} is not a Tree'
    assert isinstance(t.branches, list), f'branches of {t!r} is not a list'
    string = indent + str(t.label)
    for b in t.branches:
        string += '\n' + format_tree(b, indent + '  ')
    return string

def is_leaf(t: Tree) -> bool:
    return not t.branches
```

// #block(width: 100%, stroke: 0.7pt, inset: 8pt)[
//   *Updated conventions:* the empty linked list is `()`; test for a non-empty
//   linked list with `isinstance(s, Link)`; access tree data using `t.label` and
//   `t.branches`; and test for a leaf using `is_leaf(t)`.
// ]
