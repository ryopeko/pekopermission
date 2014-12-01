class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.integer :user_id
      t.boolean :enabled

      t.timestamps
    end
  end
end
