class CreateCommunityComments < ActiveRecord::Migration[5.2]
  def change
    create_table :community_comments do |t|
      t.string :comment
      t.integer :community_id
      t.integer :user_id
      t.integer :account_id
      t.timestamps
    end
  end
end
