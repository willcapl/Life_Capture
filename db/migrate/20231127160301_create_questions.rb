class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.references :sub_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
