class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|

      t.string :title
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end
