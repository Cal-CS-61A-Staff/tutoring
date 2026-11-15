#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= No More Folders!!

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Level:* Regular
]

An `Entry` value is either a `File` containing its name or a `Folder` containing a list of entries. Implement `list_files`,
which takes in a list of Entry records `entries` and returns a list of strings which are the file names of every file in `entries`.

```gleam
import gleam/list

pub type Entry {
  File(name: String)
  Folder(contents: List(Entry))
}

pub fn list_files(entries: List(Entry)) -> List(String) {
  case entries {
    [] -> []
    [Folder(contents), ..rest] ->
      list.append(_______, _______)             // (a), (b)
    [File(name), ..rest] ->
      [_______, .._______]                      // (c), (d)
  }
}

let entry_list0 = [
  Folder([File("Hello.txt")]),
  File("World.txt")
]

assert list_files(entry_list0) == ["Hello.txt", "World.txt"]

let entry_list1 = [
  Folder([Folder([File("a.txt")]), File("b.txt"), File("c.txt")]),
  File("d.txt"),
  Folder([File("e.txt"), Folder([File("f.txt")])])
]

assert list_files(entry_list1) == ["a.txt", "b.txt", "c.txt", "d.txt", "e.txt", "f.txt"]

let entry_list2 = [
  Folder([File("a.txt"), Folder([File("b.txt"), File("c.txt")])]),
  Folder([]),
  File("d.txt")
]

assert list_files(entry_list2) == ["a.txt", "b.txt", "c.txt", "d.txt"]
```

#part[
  Fill in blanks (a) and (b).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(a)#h(0.6em)])[`list_files(contents)`],
    answer_box(width: 100%, pre: [(b)#h(0.6em)])[`list_files(rest)`],
  )
]

#part[
  Fill in blanks (c) and (d).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    answer_box(width: 100%, pre: [(c)#h(0.6em)])[`name`],
    answer_box(width: 100%, pre: [(d)#h(0.6em)])[`list_files(rest)`],
  )
]
