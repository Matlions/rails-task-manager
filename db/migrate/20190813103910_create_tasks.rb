class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :details
      t.boolean :completed, default: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.timestamps
    end
  end
end
