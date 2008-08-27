class AddUserCounterCache < ActiveRecord::Migration
  def self.up
    add_column :users, :pages_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :pages_count
  end
end
