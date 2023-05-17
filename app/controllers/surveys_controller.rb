class SurveysController < ApplicationController
  before_action :set_survery, only: %i[ destroy edit update]

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new()
    render 'form'
  end

  def create
    @survey = Survey.new(set_params)
    if @survey.save
      flash[:success] = 'La Pregunta fue creada exitosamente'
      redirect_to surveys_path
    else
      render 'form'
    end
  end

  def edit
    render 'form'
  end

  def update
    if @survey.update(set_params)
      flash[:success] = 'Eliminado Exitosamente'
    else
      flash[:error] = 'Error al eliminar'
    end
    redirect_to surveys_path
  end

  def destroy
    if @answer.blank?
      @survey.destroy
      flash[:success] = 'Eliminado Exitosamente'
    else
      flash[:error] = 'Error al eliminar'
    end
    redirect_to surveys_path
  end

  private

  def set_survery
    @survey = Survey.find(params[:id])
    @answer = SurveryAnswer.where(survey_id: @survey.id).first
  end

  def set_params
    params.require(:survey).permit(:title, :question)
  end

end
