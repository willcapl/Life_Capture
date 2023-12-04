class AddDateToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :answer_date, :date
  end
end
