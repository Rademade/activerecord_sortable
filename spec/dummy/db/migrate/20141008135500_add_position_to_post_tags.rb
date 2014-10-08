class AddPositionToPostTags < ActiveRecord::Migration

  def self.up
    add_column :post_tags, :position, :integer
  end

  def self.down
    remove_column :post_tags, :position
  end

end
