class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :hostname
      t.text :payload
      t.datetime :timestamp
      t.timestamps
    end
  end
end
