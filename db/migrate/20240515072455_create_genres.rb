class CreateGenres < ActiveRecord::Migration[6.1]
  
  def change
    create_table :genres do |t|

      t.timestamps
      t.string :name, null: false
    end
    
    add_column :genres, :is_active, :boolean, default: true
    
  end
end
