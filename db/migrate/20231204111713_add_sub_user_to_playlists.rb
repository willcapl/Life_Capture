class AddSubUserToPlaylists < ActiveRecord::Migration[7.1]
  def change
    add_reference :playlists, :sub_user, foreign_key: true
  end
end
