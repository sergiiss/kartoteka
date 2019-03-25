class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.integer :identifier
      t.string :first_name, limit: 50
      t.string :middle_name, limit: 50
      t.string :last_name, limit: 50
      t.integer :age
      t.string :address
      t.string :phone, limit: 20
      t.text :diagnosis
      t.datetime :date_operation
      t.datetime :interval

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
