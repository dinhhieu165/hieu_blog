class ChangeBirthdayTypeInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :birthday, :date
  end
end
