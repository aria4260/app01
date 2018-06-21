class AddColumnVerifyTokenIntoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :verify_token, :string
  end
end
