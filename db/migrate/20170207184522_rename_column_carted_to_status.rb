class RenameColumnCartedToStatus < ActiveRecord::Migration[5.0]
  def change
    rename_column :carted_products, :carted, :status
  end
end
