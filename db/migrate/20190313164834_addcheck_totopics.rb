class AddcheckTotopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :box, :string
  end
end
