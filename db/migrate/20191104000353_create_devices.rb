class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.references :user, null: false, foreign_key: true
      t.string :model_number
      t.string :reg_number
      t.boolean :is_alive

      t.timestamps
    end
  end
end
