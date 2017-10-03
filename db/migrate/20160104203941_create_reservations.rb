class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :date_from
      t.date :date_to
      t.string :name
      t.string :email
      t.text :notice

      t.timestamps null: false
    end
  end
end
