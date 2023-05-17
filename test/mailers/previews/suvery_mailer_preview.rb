# Preview all emails at http://localhost:3000/rails/mailers/suvery_mailer
class SuveryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/suvery_mailer/mail_suvery
  def mail_suvery
    SuveryMailer.mail_suvery
  end

end
