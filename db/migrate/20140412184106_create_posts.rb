class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :private
      t.integer :user_id
      t.string :url

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
