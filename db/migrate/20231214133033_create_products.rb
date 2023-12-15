class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :data
      t.string :phone_number

      t.timestamps
    end
  end
end
