class CreateDailyDigests < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_digests do |t|
      t.references :user, null: false, foreign_key: true
      t.date :tweeted_on
      t.json :raw_tweets, array: true

      t.timestamps
    end
  end
end
