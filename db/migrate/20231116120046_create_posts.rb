class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :station
      t.string :battery
      t.string :wifi
      t.string :people

      t.timestamps
    end
  end
end
