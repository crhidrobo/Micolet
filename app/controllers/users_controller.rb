class UsersController < ApplicationController
  before_action :set_user, only: %i[ destroy ]
  include UsersHelper
  def index
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    @des_preferences = params.dig(:user, :des_preference, :preference_id)
    return if @des_preferences.nil?

    if @user.save
      save_preference
      SuveryMailer.with(user: @user).mail_suvery.deliver_now
      flash[:success] = 'El usuario fue creado exitosamente a su correo llegara la información necesaria'
      redirect_to root_path
    else
      render 'index'
    end
  end

  def admin
    @users = User.all
  end

  private

  def save_preference
    @des_preferences.each do |item|
      @user.des_preferences.build(preference_id: item).save
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, des_preferences_attributes: %i[id preference_id user_id] )
  end

  def set_user
    @user = User.find(params[:id])
  end

end
