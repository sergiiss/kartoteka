class CreateDistricts < ActiveRecord::Migration[5.1]
  def up
    create_table :districts do |t|
      t.string :name, limit: 200
      t.date :decree_date
      t.date :completion_date
      t.integer :performed, default: 0

      t.timestamps
    end
  end

  def down
    drop_table :districts
  end
end
