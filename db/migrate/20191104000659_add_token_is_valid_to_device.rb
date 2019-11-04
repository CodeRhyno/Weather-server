class AddTokenIsValidToDevice < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :token_is_valid, :boolean
  end
end
