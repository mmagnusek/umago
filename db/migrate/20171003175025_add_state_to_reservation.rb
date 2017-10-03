class AddStateToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :state, :string
    Reservation.update_all(state: 'confirmed')

    change_column_null(:reservations, :state, false)
  end
end
