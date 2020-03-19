class RedoDateTimeAttribute < ActiveRecord::Migration[6.0]
  def change
    change_column :furnitures, :sell_by, :date
    change_column :furnitures, :purchase_date, :date
  end
end
