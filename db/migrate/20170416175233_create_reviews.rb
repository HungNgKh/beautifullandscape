class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :image_id
      t.text :content

      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, :image_id
    add_index :reviews, [:user_id, :image_id], unique: true
  end
end
