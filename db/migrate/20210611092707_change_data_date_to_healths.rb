class ChangeDataDateToHealths < ActiveRecord::Migration[5.2]
  def change
    change_column :healths, :date, :date
  end
end
