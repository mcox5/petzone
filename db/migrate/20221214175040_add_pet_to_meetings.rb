class AddPetToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_reference :meetings, :pet, null: false, foreign_key: true
  end
end
