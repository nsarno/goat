class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
    end

    add_index :characters, :name, unique: true
  end
end
