#import "../../../61c_exam/lib.typ": *
#import "../../../61c_exam/questions/answer-box.typ": answer_box

= Browser Basics

#block(width: 100%, stroke: (left: 2pt), inset: 7pt)[
  *Adapted from:* Lecture 32 - Browsers and Web Applications | *Level:* Regular, Challenge
]

#part(points: 1)[
  A web browser is an interpreter for which of the following languages? Select
  *all* that apply.

  #multi-select(
    cols: 3,
    none-above: false,
    correct()[HTML], correct()[CSS], correct()[JavaScript], [Gleam], [Python],
  )
]

#part(points: 1)[
  Which of the following best describes the Document Object Model (DOM)?

  #multi-choice(
    cols: 1,
    none-above: false,
    correct()[The tree of elements that is created by parsing HTML],
    [The list of rules that CSS uses to style a page],
    [The set of JavaScript functions that handle events],
    [The JavaScript that Gleam code is compiled into],
  )
]

#part(points: 1)[
  Which of the following statements about event-driven programming are true?
  Select *all* that apply.

  #multi-select(
    cols: 1,
    none-above: false,
    correct()[Code runs in response to user actions and other events, such as a scheduled time being reached.],
    correct()[An event handler is a function associated with an element in the DOM.],
    correct()[When an event occurs, the browser calls its handler, which can change the DOM.],
    [A web page's code runs from top to bottom exactly once and then stops.],
    [An event handler must return a new DOM, which the browser then replaces the old one with.],
  )
]

#part(points: 1)[
  Which one of the following is a way for a web page to display output, rather
  than to take input from the user?

  #multi-choice(
    cols: 2,
    none-above: false,
    [A text entry box], [A slider],
    [A checkbox], correct()[Image and video display],
  )
]

#part(points: 1)[
  Web pages are sandboxed. Which of the following statements are true? Select
  *all* that apply.

  #multi-select(
    cols: 1,
    none-above: false,
    correct()[A page cannot read your files without permission.],
    correct()[A page cannot use your camera without permission.],
    [A page can read any file in your Downloads folder, but cannot change it.],
    [A page cannot communicate with a server, because it would escape the sandbox.],
  )
]

// Solution notes:
// A browser interprets HTML, CSS and JavaScript. Gleam is compiled to
// JavaScript before it runs in a browser. HTML describes the tree of elements
// (the DOM), CSS describes how they are displayed, and JavaScript describes
// behavior. Event handlers do not return a DOM; they change the existing DOM.
// Text boxes, sliders and checkboxes take input, while image and video display
// is a way to display output. Sandboxing limits access to files and devices,
// but pages can still communicate with servers.
