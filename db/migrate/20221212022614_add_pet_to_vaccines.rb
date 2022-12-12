class AddPetToVaccines < ActiveRecord::Migration[7.0]
  def change
    add_reference :vaccines, :pet, null: false, foreign_key: true
  end
end
