class PreferencesController < ApplicationController
  before_action :set_preference, only: %i[ destroy ]

  def index
    @preferences = Preference.all
  end

  def new
    @preference = Preference.new()
    render 'form'
  end

  def create
    @preference = Preference.new(set_params)
    if @preference.save
      flash[:success] = 'La preferencia fue creada exitosamente'
      redirect_to preferences_path
    else
      render 'form'
    end
  end

  def destroy
    if @despreference.blank?
      @preference.destroy
      flash[:success] = 'Eliminado Exitosamente'
    else
      flash[:error] = 'Error al eliminar'
    end
    redirect_to preferences_path
  end

  private

  def set_preference
    @preference = Preference.find(params[:id])
    @despreference = DesPreference.where(preference_id: @preference.id).first
  end

  def set_params
    params.require(:preference).permit(:preference, :description)
  end

end
