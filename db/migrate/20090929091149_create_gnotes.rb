class CreateGnotes < ActiveRecord::Migration
  def self.up
    create_table :gnotes,:options=>"charset=utf8" do |t|
      t.string :contact
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :gnotes
  end
end
