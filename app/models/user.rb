class User < ApplicationRecord
  has_many :des_preferences, dependent: :destroy
  has_many :survery_answers, dependent: :destroy
  accepts_nested_attributes_for :des_preferences
  validates :name, presence: true
  validates :email, presence: { if: :email_validator }, uniqueness: true
  require 'net/http'
  require 'net/https'

  private

  def email_validator
    if email.blank?
      errors.add(:email, 'email required')
    else
      uri = URI("https://emailvalidation.abstractapi.com/v1/?api_key=b3d80e89ae494417b12e2cc972bc4c21&email=#{email}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      request =  Net::HTTP::Get.new(uri)

      response = http.request(request)
      score = JSON.parse(response.body)['quality_score'].to_f
      errors.add(:email, 'email score') if score < 0.7
    end
  end
end
