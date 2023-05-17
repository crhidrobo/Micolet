class SurveryAnswersController < ApplicationController
  before_action :set_answer, only: %i[ update]

  def index
    @surveys = Survey.all
  end

  def new
    step = params[:step].to_i
    user = params[:user_id]
    if SurveryAnswer.where(user_id: user).blank?
      Survey.all.each_with_index do |question, index|
        answers = SurveryAnswer.new(survey_id: question.id, user_id: user, step: (index + 1))
        answers.save
      end
    end
    @survery_answer = SurveryAnswer.where(user_id: user, step: step).first
    render 'form'
  end

  def update
    @survery_answer.update(set_params)
    step = @survery_answer.step + 1
    user = @survery_answer.user_id
    if SurveryAnswer.where(user_id: user).count >= step
      redirect_to new_survery_answer_path(step: step, user_id: user)
    else
      redirect_to root_path
    end
  end

  private

  def set_answer
    @survery_answer = SurveryAnswer.find(params[:id])
  end

  def set_params
    params.require(:survery_answer).permit(:user_id, :survey_id, :answer)
  end
end
