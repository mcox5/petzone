class FixColumnType < ActiveRecord::Migration[7.0]
  def change
    rename_column :pets, :type, :specie
  end
end
