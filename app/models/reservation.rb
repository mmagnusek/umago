class Reservation < ActiveRecord::Base
  validates :email, format: { with: Devise.email_regexp, allow_blank: true }
  validates :date_from, :date_to, :state, presence: true

  scope :ordered, -> { order(date_from: :asc) }
end
