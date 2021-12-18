class CreateCommunityComments < ActiveRecord::Migration[5.2]
  def change
    create_table :community_comments do |t|

      t.timestamps
    end
  end
end
