class AddColumnToTreatments < ActiveRecord::Migration[7.0]
  def change
    add_column :treatments, :until, :date
  end
end
