class AddColumnsToDewormings < ActiveRecord::Migration[7.0]
  def change
    add_column :dewormings, :date, :date
    add_reference :dewormings, :pet, null: false, foreign_key: true
  end
end
