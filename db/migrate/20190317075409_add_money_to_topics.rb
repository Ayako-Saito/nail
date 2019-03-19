class AddMoneyToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :money, :string
  end
end
