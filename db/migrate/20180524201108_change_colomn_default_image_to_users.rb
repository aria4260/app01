class ChangeColomnDefaultImageToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :image, 'default_user.jpg'
  end
end
