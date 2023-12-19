class AddOverallToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :overall, :integer
  end
end
