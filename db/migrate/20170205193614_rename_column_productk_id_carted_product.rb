class RenameColumnProductkIdCartedProduct < ActiveRecord::Migration[5.0]
  def change
    rename_column :carted_products, :productk_id, :product_id
  end
end
