class MakeReportsPolymorphic < ActiveRecord::Migration[5.2]
  def change
    rename_column :reports, :post_id, :reportable_id
    add_column :reports, :reportable_type, :string

    add_index :reports, %i[user_id reportable_id reportable_type], unique: true
    add_index :reports, %i[reportable_id reportable_type]

    remove_foreign_key :reports, :posts
  end
end
