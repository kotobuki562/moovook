class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :book_name
      t.integer :category_id
      t.text :wrap_up
      t.text :impressions
      t.text :action_plan
      t.references :user

      t.timestamps
    end
  end
end
