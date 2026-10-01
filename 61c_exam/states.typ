/// Set up state for the exam
#let printanswers = state("printanswers", false)
#let questions = state("questions", ())
#let question-num = counter("question-num")
#let part-num = counter("part-num")
#let mc-letters = state("mc-letters", false)
#let ans-color = state("ans-color", black)

/// Returns the number of questions in the entire exam
#let num_questions() = questions.at(<exam-end>).len()

/// Returns the number of points in the entire exam.
#let num_points() = {
  if num_questions() == 0 { 
    0 
  } else { 
    questions.at(<exam-end>).map(q => q.points).sum()
  }
}

#let BASE_FONT_SIZE = 11pt
#let LARGE_PRINT_SCALE_FACTOR = 1.5
#let LARGE_PRINT = false
// TODO: if LARGE_PRINT is true, use scale factor