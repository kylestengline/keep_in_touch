class ChangeLimitOnPhoneNumber < ActiveRecord::Migration[5.0]
  def change
    change_column :contacts, :phone_number, :integer, :limit => 8
  end
end
