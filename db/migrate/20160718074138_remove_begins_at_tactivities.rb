class RemoveBeginsAtTactivities < ActiveRecord::Migration
  def change
  	add_column :tactivities, :hours, :float
  	add_column :tactivities, :start_date, :date
  	remove_column :tactivities, :begins_at
  	remove_column :tactivities, :ends_at
  end
end
