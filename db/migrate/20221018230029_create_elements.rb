class CreateElements < ActiveRecord::Migration[5.2]
  def change
    create_table :elements do |t|
      t.string :element_type
      t.integer :position
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
