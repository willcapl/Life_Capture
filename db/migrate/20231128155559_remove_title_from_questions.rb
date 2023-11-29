class RemoveTitleFromQuestions < ActiveRecord::Migration[7.1]
  def change
    remove_column :questions, :title
    add_column :questions, :title, :string
  end
end
