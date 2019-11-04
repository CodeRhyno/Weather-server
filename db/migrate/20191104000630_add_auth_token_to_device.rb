class AddAuthTokenToDevice < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :auth_token, :string
  end
end
