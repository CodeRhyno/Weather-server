class CreateData < ActiveRecord::Migration[6.0]
  def change
    create_table :data do |t|
      t.references :device, null: false, foreign_key: true
      t.string :temp
      t.string :humidity
      t.string :pressure

      t.timestamps
    end
  end
end
