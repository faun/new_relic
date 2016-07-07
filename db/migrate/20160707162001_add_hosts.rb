class AddHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.text :name
      t.integer :organization_id
      t.timestamps
    end

    change_column_null :hosts, :organization_id, false
  end
end
