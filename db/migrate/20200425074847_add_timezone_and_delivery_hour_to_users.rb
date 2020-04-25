class AddTimezoneAndDeliveryHourToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :timezone, :string
    add_column :users, :delivery_hour, :string
  end
end
