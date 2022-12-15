class AddAppointmentToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_reference :meetings, :appointment, foreign_key: true
  end
end
