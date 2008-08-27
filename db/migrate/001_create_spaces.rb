class CreateSpaces < ActiveRecord::Migration
  def self.up
    create_table :spaces do |t|
      t.string :name
      t.string :key
      t.text :description
      t.integer :pages_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :spaces
  end
end
