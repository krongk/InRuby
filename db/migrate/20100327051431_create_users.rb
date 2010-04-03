class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      
      t.column :phone,                      :string
      t.column :message,                    :text
      t.column :bg_message,                 :text
      t.column :language,                   :string
    end
    User.create(:login=>'kenrome',:email=>'kenrome@163.com',:password=>'0020010',:password_confirmation=>'0020010')
    User.create(:login=>'admin',:email=>'kenrome@gamil.com',:password=>'inruby',:password_confirmation=>'inruby')

  end

  def self.down
    drop_table "users"
  end
end
