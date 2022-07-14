class AddUpvotesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :upvotes, :integer
  end
end
