class AddSomeModels < ActiveRecord::Migration[5.1]
  def up
    create_table :quality_controls do |t|
      t.date :decree_date
      t.string :name
      t.belongs_to :district

      t.timestamps
    end

    create_table :paragraphs do |t|
      t.date :completion_date
      t.text :todo
      t.integer :performed, default: 0
      t.belongs_to :decree

      t.timestamps
    end

    create_table :decrees do |t|
      t.integer :identifier
      t.string :name
      t.date :date
      t.integer :option, default: 0
      t.belongs_to :quality_control

      t.timestamps
    end
  end

  def down
    drop_table :quality_controls
    drop_table :paragraphs
    drop_table :decrees
  end
end
