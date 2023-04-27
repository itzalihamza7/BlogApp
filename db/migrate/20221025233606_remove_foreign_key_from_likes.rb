class RemoveForeignKeyFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :likes, :posts
  end
end
