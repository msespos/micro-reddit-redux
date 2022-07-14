class AddDownvotesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :downvotes, :integer
  end
end
