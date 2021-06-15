class ChangeTimeOfActlogs < ActiveRecord::Migration[5.2]
  def up
    change_column :actlogs, :start_time, :time, default: '00:00:00'
    change_column :actlogs, :end_time, :time, default: '00:00:00'
  end
  
  def down
    change_column :actlogs, :start_time, :time
    change_column :actlogs, :end_time, :time
  end
end
