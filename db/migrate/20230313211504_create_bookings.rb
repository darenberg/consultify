class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
