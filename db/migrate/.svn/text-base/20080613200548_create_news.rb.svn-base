class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.integer :user_id
      t.string :story
      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
