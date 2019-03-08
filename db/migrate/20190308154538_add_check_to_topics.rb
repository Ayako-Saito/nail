class AddCheckToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :color, :boolean
    add_column :topics, :money, :boolean
  end
end
