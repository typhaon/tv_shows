class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :role, null: false
      t.string :actor, null: false
      t.string :description
      t.integer :television_shows_id
    end
  end
end
