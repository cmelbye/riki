class CreatePagesTable < ActiveRecord::Migration
  def self.up
    create_table :pages, :force => true do |t|
      t.string :title
      t.text :text
      t.string :comment
      t.integer :space_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
