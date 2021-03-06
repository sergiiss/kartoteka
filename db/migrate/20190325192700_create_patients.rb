class CreatePatients < ActiveRecord::Migration[5.1]
  def up
    create_table :patients do |t|
      t.integer :identifier
      t.string :first_name, limit: 50
      t.string :middle_name, limit: 50
      t.string :last_name, limit: 50
      t.integer :age
      t.string :address
      t.string :phone, limit: 20
      t.text :diagnosis
      t.date :operation_date
      t.date :visit_date
      t.date :next_visit_date

      t.timestamps
    end
  end

  def down
    drop_table :patients
  end
end
