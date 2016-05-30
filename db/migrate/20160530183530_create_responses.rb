class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :content
      t.integer :user_id
      t.integer :story_id

      t.timestamps null: false
    end
  end
end
