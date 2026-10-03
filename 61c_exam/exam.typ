#import "coverpage.typ": frontpage
#import "questions.typ": *

#let todo(body) = [
  #text(size: 36pt, fill: red)[*TODO:* #body]
]

#let blankpage() = context [
  #set page(header: none)
  #let before = query(selector(<titled-question>).before(here()))
  #let after = query(selector(<titled-question>).after(here()))
    
  #block(height: 100%, width: 100%, breakable: false)[
    #align(horizon + center)[
      This page left intentionally (mostly) blank <blank-page>
      
      #v(10pt)
      
      #if after.len() == 0 [
        Please do not tear off any pages from the exam.
      ] else if before.len() == 0 [
        The exam begins on the next page.
        #pagebreak()
      ] else [
        The exam continues on the next page.
        #pagebreak()
      ]
    ]
  ]
]

#let footer_continues() = context {
  let before = query(selector(<titled-question>).before(here()))
  let after = query(selector(<titled-question>).after(here()))

  let blank-before = query(selector(<blank-page>).before(here()))
  let blank-after = query(selector(<blank-page>).after(here()))
  
  if before.len() == 0 { return }
  let next_q_page = if after.len() == 0 { 
    0 
  } else {
    after.first().location().page()
  }
  
  let last_q_page = before.last().location().page()
  
  if next_q_page != here().page() + 1 and here().page() != counter(page).at(<exam-end>).at(0) [
    (Question #states.question-num.get().at(0) continues...)
  ]
}

#let header_continued() = context {
  let before = query(selector(<titled-question>).before(here()))
  let after = query(selector(<titled-question>).after(here()))

  let blank-before = query(selector(<blank-page>).before(here()))
  let blank-after = query(selector(<blank-page>).after(here()))

  if before.len() == 0 { return }
  let next_q_page = if after.len() == 0 { 
    0 
  } else {
    after.first().location().page()
  }
  
  let last_q_page = before.last().location().page()
  if last_q_page != here().page() and next_q_page != here().page() [
    (Question #states.question-num.get().at(0) continued...)
  ]
}

#let exam_header() = {
  set text(10pt)
  header_continued()
}

#let exam_footer(  
  class,
  semester,
  exam,
) = context {
  let page_num = counter(page).get().at(0)
  let num_pages = counter(page).final().at(0)
  
  set text(size: 10pt)
  grid(columns: (1fr, 0.3fr, 1fr), 
    align:(left, center, right),
    [ #if page_num != 1 [ #exam #footer_continues()]],
    [ Page #page_num of #num_pages ], 
    [ #if page_num != 1 [ #class --- #semester ]]
  )
    
  [ #text(size: 8pt, style: "italic")[ This content is protected and may not be shared, uploaded, or distributed. ]]
}

#let exam(
  class: "CS61C",
  instructors: ("CodaBot", "EvanBot"),
  semester: "Fall 2024",
  exam: "Midterm",
  time: "110 minutes",
  print_answers: false,
  mc-letters: false,
  expected_points: 100,
  last-edited: datetime.today().display("[weekday], [month repr:long] [day padding:none], [year]"),
  body
) = {
  set page(
    paper: "us-letter",
    header: exam_header(),
    footer: exam_footer(class, semester, exam), 
    numbering: "1",
    margin: (top: 1.4cm, bottom: 1.4cm, left: 1.5cm, right: 1.5cm),
  )
  
  set text(
    font: "New Computer Modern",
    size: 9.5pt,
    // ligatures: false,
    // historical-ligatures: false,
    features: ("lith": 0)
  )
  
  set par(
    justify: true,
    leading: 0.35em,
  )

  show heading: it => titled-question(title: it)
  
  show raw: set text(font: "DejaVu Sans Mono", size: 0.82em, weight: 400, top-edge: 0pt)

  show raw.where(block: true, lang: "text"): it => code_block(it, disp-nums: false)

  // Change the languages below to change styling of code blocks
  // created using ```
  show raw.where(block: true, lang: "py"): it => code_block(it, disp-nums: true, post-pad: 1em)
  show raw.where(block: true, lang: "python"): it => code_block(it, disp-nums: true, post-pad: 1em)
  show raw.where(block: true, lang: "sql"): it => code_block(it, disp-nums: true, post-pad: 1em)
  show raw.where(block: true, lang: "txt"): it => code_block(it, disp-nums: false, post-pad: 1em)

  show ref: it => {
    let el = it.element
    if el != none and ( el.func() == text or el.func() == raw) {
      // Override question references.
      qref(it.target)
    } else {
      // Other references as usual.
      it
    }
  }

  states.mc-letters.update(it => mc-letters)
  states.printanswers.update(it => print_answers)
  frontpage(class, instructors, semester, exam, time, last-edited)
  states.printanswers.update(it => print_answers)
  states.ans-color.update(it => red.darken(10%))
  
  [ 
    #body 

    #metadata("exam-end") <exam-end>
  ]

}
