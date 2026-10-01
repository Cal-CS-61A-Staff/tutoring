#import "../states.typ": *

#let solution(title: "Solution", grading: none, body) = context {
  if printanswers.get() {
    box(width: 100%, height: auto, stroke: 0.5pt, inset: 6pt)[
      #if grading != none [
        *Grading:* #grading
      ]
      *#title:* #body
    ]
  }
}