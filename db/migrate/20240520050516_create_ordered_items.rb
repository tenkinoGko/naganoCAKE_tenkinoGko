class CreateOrderedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_items do |t|

      t.timestamps
      t.integer :order_id, null: false
      t.integer :item_id, null: false
    end
  end
end
