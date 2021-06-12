class ChangeDataDateToActlogs < ActiveRecord::Migration[5.2]
  def change
    change_column :actlogs, :date, :date
  end
end
