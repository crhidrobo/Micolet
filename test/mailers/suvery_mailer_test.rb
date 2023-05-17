require "test_helper"

class SuveryMailerTest < ActionMailer::TestCase
  test "mail_suvery" do
    mail = SuveryMailer.mail_suvery
    assert_equal "Mail Micolet", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Buen dia", mail.body.encoded
  end

end
