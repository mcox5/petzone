class AddColumnsToVaccine < ActiveRecord::Migration[7.0]
  def change
    add_column :vaccines, :date, :date
  end
end
