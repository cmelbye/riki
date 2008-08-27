class CreateRevisionsTable < ActiveRecord::Migration
  def self.up
    create_table :revisions, :force => true do |t|
      t.string :title
      t.text :text
      t.string :comment
      t.integer :space_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :revisions
  end
end
