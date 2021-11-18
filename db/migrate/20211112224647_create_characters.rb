class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :url_picture
      t.string :name
      t.integer :age
      t.decimal :weight
      t.text :history

      t.timestamps
    end
  end
end
