class CreateHome < ActiveRecord::Migration
  def self.up
    create_table :home, :force => true do |t|
      t.text :welcome
    end
    Home.create :welcome => nil
  end

  def self.down
    drop_table :home
  end
end
