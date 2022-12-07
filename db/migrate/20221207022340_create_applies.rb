class CreateApplies < ActiveRecord::Migration[7.0]
  def change
    create_table :applies do |t|
      t.date :date
      t.references :vaccine, null: false, foreign_key: true
      t.references :deworming, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
