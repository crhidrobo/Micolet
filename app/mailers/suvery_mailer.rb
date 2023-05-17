class SuveryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.suvery_mailer.mail_suvery.subject
  #
  def mail_suvery
    @user = params[:user]
    @url = "http://localhost:3000#{url_for(controller: 'survery_answers', action: 'new', user_id: @user.id, step: 1, only_path: true)}"
    @greeting = "#{@use}"

    mail to: "#{@user.email}"
  end
end
