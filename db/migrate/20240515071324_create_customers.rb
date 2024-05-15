class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|

      t.timestamps
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :post_code
      t.string :address
      t.string :telephone_number
      t.string :email
      t.string :enbrypted_password
      t.boolean :is_active

    end
  end
end
