module QuizzesHelper

  def construct_quiz_obj(question)
    res_obj = {}
    res_obj[:id] = question.id
    res_obj[:body] = question.body
    res_obj[:answers] = question.answers
    res_obj[:id] = question.id
    res_obj
  end
end
