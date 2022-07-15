class RenameVoterToUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :votes, :voter, :user_id
  end
end
