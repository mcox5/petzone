class CreateDewormings < ActiveRecord::Migration[7.0]
  def change
    create_table :dewormings do |t|
      t.string :name
      t.integer :interval

      t.timestamps
    end
  end
end
