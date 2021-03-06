class AddDefaultValueToPointsAndPrivilege < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :points, :integer, :default => 0
    change_column :users, :privilege, :integer, :default => 0
  end

  def down
    change_column :users, :points, :integer, :default => nil
    change_column :users, :privilege, :integer, :default => nil
  end
end
