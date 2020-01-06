class CreateDistricts < ActiveRecord::Migration[5.1]
  def up
    create_table :districts do |t|
      t.string :name
      t.string :phone, limit: 30

      t.timestamps
    end
  end

  def down
    drop_table :districts
  end
end
