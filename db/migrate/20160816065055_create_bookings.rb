class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.text :message
      t.string :status
      t.string :start_date
      t.string :end_date
      t.car :references
      t.user :references

      t.timestamps
    end
  end
end
