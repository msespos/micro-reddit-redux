class AddPostIdToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :post_id, :bigint
  end
end
