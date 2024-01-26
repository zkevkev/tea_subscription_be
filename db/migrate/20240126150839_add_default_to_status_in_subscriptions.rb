class AddDefaultToStatusInSubscriptions < ActiveRecord::Migration[7.1]
  def change
    change_column :subscriptions, :status, :integer, default: 1
  end
end
