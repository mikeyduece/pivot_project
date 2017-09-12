class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :image_path
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
