class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.boolean :upvote
      t.integer :voter

      t.timestamps
    end
  end
end
