class AddOrganizationIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :organization_id, :integer
    change_column_null :events, :organization_id, false
  end
end
