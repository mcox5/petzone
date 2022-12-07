class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.date :birthday
      t.string :gender
      t.integer :weight
      t.boolean :spayed
      t.string :allergies
      t.string :color
      t.boolean :chiped
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
