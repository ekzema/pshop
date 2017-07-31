class AddColumnSortToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :sort_top, :integer, default: 0
  end
end
