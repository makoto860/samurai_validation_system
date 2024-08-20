class CreateRents < ActiveRecord::Migration[7.1]
  def change
    create_table :rents do |t|
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.integer :total_people, :default => 0
      t.integer :total_day, :default => 0
      t.integer :total_amount, :default => 0
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
