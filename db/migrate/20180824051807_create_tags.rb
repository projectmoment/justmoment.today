class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :body
      t.integer :user_id
      t.integer :comment_id
      t.timestamps null: false
    end
  end
end
