#import "../states.typ"

#let _correct() = context [
  #let fill = white

  #if states.printanswers.get() {
    fill = black
  }

  #square(size: 10pt, fill: fill, stroke: black)
]

#let _bad() = [
  #let check_stroke = stroke(
    thickness: 2.3pt,
    paint: luma(50%),
    cap: "round"
  )

  #place(
       center + horizon,
       dx: -1.5pt, dy: 1.5pt,
       [ #line(length: 4pt, angle: 55deg, stroke: check_stroke) ]
   )

   #place(
     center + horizon,
     dx: 2pt, dy: 3.1pt,
     [ #line(length: 8pt, angle: -60deg, stroke: check_stroke) ]
   )

   #square(size: 10pt, stroke: black)
]

#let _choice() = [
  #square(size: 10pt, stroke: black)
]

#let correct(body) = {
  (
    "selection": _correct,
    "body": [#body]
  )
}

#let bad(body) = {
  (
    "selection": _bad,
    "body": [#body]
  )
}

#let choice(selection, body) = {
  grid(
    columns: 3,
    column-gutter: 5pt,
    align: horizon,
    [#h(6pt)],
    selection(),
    [#body]
  )
}


#let multi-select(cols: 1, none-above: false, ..body) = {
  let num-items = body.pos().len() + if none-above {1}
  columns(cols)[
    #for (i, b) in body.pos().enumerate() {
      if type(b) == dictionary { choice(b.selection, b.body) }
      if type(b) == content { choice(_choice, b) }
      if (calc.rem(i + 1, calc.round((num-items) / cols)) == 0
        and cols > 1
        and i + 1 != num-items
      ) [ #colbreak() ]
    }
    #if none-above {
     choice(circle.with(radius: 5pt), [None of the above])
    }
  ]
}

#let multi-choice(cols, none-above, ..body) = {
  show square: it => circle(radius: it.width.length / 2, fill: it.fill, stroke: it.stroke)

  multi-select(cols, none-above, ..body)
}

// #let multi-choice(cols: 1, none-above: true, inline: false, ..body) = {
//   let cols_value = cols
//   if inline {
//     cols_value = body.pos().count()
//   }
//   show square: it => circle(radius: it.width.length / 2, fill: it.fill, stroke: it.stroke)

//   multi-select(cols_value, none-above, ..body)
// }
