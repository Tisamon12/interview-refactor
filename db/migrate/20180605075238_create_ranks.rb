class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.references :user, index: true
      t.references :tv_show, index: true
      t.float :value

      t.timestamps null: false
    end
    add_foreign_key :ranks, :users
    add_foreign_key :ranks, :tv_shows
  end
end
