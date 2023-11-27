class CreatePlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :playlists do |t|
      t.references :response, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
