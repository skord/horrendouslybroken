class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.string :url
      t.references :bucket, index: true

      t.timestamps
    end
  end
end
