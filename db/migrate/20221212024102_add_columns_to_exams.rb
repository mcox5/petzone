class AddColumnsToExams < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :date, :date
    add_reference :exams, :pet, null: false, foreign_key: true
  end
end
