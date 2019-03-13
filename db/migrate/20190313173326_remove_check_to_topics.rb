class RemoveCheckToTopics < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :color, :boolean
    remove_column :topics, :money, :boolean
  end
end
