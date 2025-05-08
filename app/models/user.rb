class User < ApplicationRecord
  has_many :enrolments, dependent: :destroy, validate: true
  has_secure_password :password

  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }, allow_blank: true

  def active_enrolments
    enrolments.where('start_date <= ? AND end_date >= ?', Date.today, Date.today)
  end
end
