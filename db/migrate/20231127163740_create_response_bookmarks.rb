class CreateResponseBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :response_bookmarks do |t|
      t.references :question, null: false, foreign_key: true
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
