class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.references :user_id, index: true, null: false
      t.references :role_id, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :user_roles, :user_ids
    add_foreign_key :user_roles, :role_ids
  end
end
