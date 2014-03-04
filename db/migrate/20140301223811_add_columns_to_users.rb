class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_alcohol, :integer, { default: 0 }
    add_column :users, :total_caffeine, :integer, { default: 0 }
    add_column :users, :total_nicotine, :integer, { default: 0 }
  end
end
