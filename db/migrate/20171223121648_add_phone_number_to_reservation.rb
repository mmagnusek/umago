class AddPhoneNumberToReservation < ActiveRecord::Migration[4.2]
  def change
    add_column :reservations, :phone_number, :string
  end
end
