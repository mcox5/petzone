class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.string :name
      t.date :last_application
      t.integer :interval
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
