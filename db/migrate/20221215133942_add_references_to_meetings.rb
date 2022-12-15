class AddReferencesToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_reference :meetings, :vaccine, foreign_key: true
    add_reference :meetings, :deworming, foreign_key: true
    add_reference :meetings, :treatment, foreign_key: true
  end
end
