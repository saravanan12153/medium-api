class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :subtitle
      t.string :url
      t.string :avatar
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
