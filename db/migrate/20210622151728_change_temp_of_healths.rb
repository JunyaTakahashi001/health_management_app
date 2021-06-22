class ChangeTempOfHealths < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :healths, :temperature_morning, default: '00.0'
      change_column :healths, :temperature_night, default: '00.0'
    end
    
    def down
      change_column :healths, :temperature_morning
      change_column :healths, :temperature_night
    end
  end
end
