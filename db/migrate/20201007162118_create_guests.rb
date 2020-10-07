class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :age
      t.string :gender_id
      t.integer :category_id
      t.string :street
      t.string :neighborhood
      t.string :cep
      t.integer :street_number
      t.string :state
      t.string :phone

      t.timestamps null: false
    end
  end
end
