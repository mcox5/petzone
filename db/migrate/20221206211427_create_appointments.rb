class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :veterinary_name
      t.string :doctor_name
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
