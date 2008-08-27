class AddSiteTitleEtcToHome < ActiveRecord::Migration
  def self.up
    add_column :home, :site_title, :string
    add_column :home, :site_slogan, :string
  end

  def self.down
    remove_column :home, :site_title
    remove_column :home, :site_slogan
  end
end
