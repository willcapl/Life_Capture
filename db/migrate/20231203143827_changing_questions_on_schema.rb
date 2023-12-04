class ChangingQuestionsOnSchema < ActiveRecord::Migration[7.1]
  def change
    remove_column :sub_users, :post_education, :string
    remove_column :sub_users, :life_after_retirement, :string
    add_column :sub_users, :education, :string
  end
end
