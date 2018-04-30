class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :comment
      t.date :photo_date
      t.boolean :publish

      t.timestamps
    end
  end
end
