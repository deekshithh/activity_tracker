class CreateTactivities < ActiveRecord::Migration
  def change
    create_table :tactivities do |t|
      t.belongs_to :task, index: true
      t.string :name
      t.text :description
      t.datetime :begins_at
      t.datetime :ends_at

      t.timestamps null: false
    end
  end
end
