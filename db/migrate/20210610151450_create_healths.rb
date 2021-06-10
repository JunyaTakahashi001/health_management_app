class CreateHealths < ActiveRecord::Migration[5.2]
  def change
    create_table :healths do |t|
      t.integer :date, null: false
      t.decimal :temperature_morning, precision: 3, scale: 1
      t.decimal :temperature_night, precision: 3, scale: 1
      t.string :cough
      t.string :dyspnea
      t.string :nasal
      t.string :throat
      t.string :headache
      t.string :diarrhea
      t.string :taste
      t.string :smell
      t.text :ather

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
