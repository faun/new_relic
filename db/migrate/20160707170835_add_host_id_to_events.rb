class AddHostIdToEvents < ActiveRecord::Migration
  def change
    remove_column :events, :hostname
    add_column :events, :host_id, :integer
    change_column_null :events, :host_id, false
  end
end
