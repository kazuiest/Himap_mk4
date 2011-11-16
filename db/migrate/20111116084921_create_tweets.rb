class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.string :content
      t.decimal :ratitude
      t.decimal :longitude
      t.string :rate

      t.timestamps
    end
  end
end
