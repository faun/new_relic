class AddOrganization < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
