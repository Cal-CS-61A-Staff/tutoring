#import "../states.typ": *

#let add_points_hidden(n) = context {
  let question-number = question-num.get().at(0)
    
  questions.update(it => {
    it.at(question-number - 1).points += n
    return it
  })
}

#let add_points(n) = context {
  add_points_hidden(n)
  if n > 0 [(#n #if n == 1 [point] else [points]) ]
}

#let qref(label) = context {
  "Q"
  str(question-num.at(label).at(0))
  "."
  str(part-num.at(label).at(0))
}

#let qnum() = context [
  Q#question-num.get().at(0).#part-num.get().at(0)
]

#let part(
  points: none,
  noprompt: false,
  body
) = {
  part-num.step()
  if points == none { points = 1 }
  
  context {
    if noprompt {
      stack(dir: ltr, spacing: 0.5em, qnum(), add_points(points), body)
    } else {
      grid(
        columns: (2em, 1fr),
        align: (right + top, left + top),
        inset: 2pt,
        qnum(),
        [ 
          #if points > 0 { box(add_points(points)) }
          #body 
        ]
      )
    }
  }
}


