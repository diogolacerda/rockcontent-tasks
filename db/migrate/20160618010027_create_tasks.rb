class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :board, index: true, foreign_key: true
      t.references :priority_type, index: true, foreign_key: true
      t.references :task_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
