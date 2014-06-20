class FixCharactersColumnName < ActiveRecord::Migration
  def change
    rename_column :characters, :television_shows_id, :television_show_id
  end
end
