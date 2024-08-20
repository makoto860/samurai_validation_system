class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
