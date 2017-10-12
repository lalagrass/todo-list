class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.text :description
      t.integer :priority
      t.boolean :done
      t.datetime :datetime_create
      t.datetime :datetime_done
      t.timestamps
    end
  end
end
