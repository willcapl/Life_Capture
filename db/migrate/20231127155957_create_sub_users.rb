class CreateSubUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_users do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :relationship_to_user
      t.date :dob
      t.string :childhood_location
      t.string :post_education
      t.string :birthplace
      t.string :career
      t.string :adult_life_location
      t.string :hobbies
      t.string :life_after_retirement

      t.timestamps
    end
  end
end
