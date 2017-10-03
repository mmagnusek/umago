class Reservation < ActiveRecord::Base
  validates :email,   presence: true, format: Devise.email_regexp
end
