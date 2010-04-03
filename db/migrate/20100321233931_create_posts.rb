class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts,:options=>"charset=utf8" do |t|
      t.string :category
      t.string :title
      t.text :document

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
