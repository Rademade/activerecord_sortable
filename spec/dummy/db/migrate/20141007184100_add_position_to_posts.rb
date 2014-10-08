class AddPositionToPosts < ActiveRecord::Migration

  def self.up
    add_column :posts, :position, :integer
    add_column :posts, :user_position, :integer
  end

  def self.down
    remove_column :posts, :position
    remove_column :posts, :user_position
  end

end
