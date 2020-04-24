class AddTwitterDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :encrypted_twitter_consumer_key, :string
    add_column :users, :encrypted_twitter_consumer_key_iv, :string
    add_column :users, :encrypted_twitter_consumer_secret, :string
    add_column :users, :encrypted_twitter_consumer_secret_iv, :string
    add_column :users, :encrypted_twitter_access_token, :string
    add_column :users, :encrypted_twitter_access_token_iv, :string
    add_column :users, :encrypted_twitter_access_token_secret, :string
    add_column :users, :encrypted_twitter_access_token_secret_iv, :string

    add_column :users, :twitter_uid, :string, index: true
    add_column :users, :twitter_nickname, :string
    add_column :users, :twitter_name, :string
    add_column :users, :twitter_image, :string
  end
end
