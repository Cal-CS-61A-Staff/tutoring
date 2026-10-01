#import "../states.typ"

#let answer_box(
  width: 50%,
  pre-width: 0.75fr,
  height: 2.25 * 12pt,
  fontsize: auto,
  pre: "",
  post: "",
  answer
) = context {
  show raw: set text(top-edge: 0pt)
  set text(12pt)

  v(-0.5em)
  box(width: width, height: height, stroke: .5pt)[
    #set align(horizon)
    #if states.printanswers.get() [ 
      // #grid(
      //   columns: 1,
      //   align: left,
      //   inset: 6pt,
      //   [#pre #answer #post]
      // )
      #place(horizon)[
        #stack(dir:ltr, h(0.5em), pre, answer, post)
        // #h(0.5em) #pre #answer #post
      ]
    ] else {
      grid(
        columns: (pre-width, 1fr, 0.5fr),
        align: (left, left, right),
        inset: 6pt,
        [#pre], [], [#post]
      )
    }
  ]
  v(-0.5em)
}
