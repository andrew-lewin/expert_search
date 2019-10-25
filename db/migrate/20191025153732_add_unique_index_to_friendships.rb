class AddUniqueIndexToFriendships < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_index :friendships, [:expert_id, :friend_id], unique: true
  end
end
