class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
