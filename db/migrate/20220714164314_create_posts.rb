class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :link
      t.string :caption

      t.timestamps
    end
  end
end
