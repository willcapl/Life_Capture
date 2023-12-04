class MakingRelationshipToUserDefault < ActiveRecord::Migration[7.1]
  def change
    remove_column :sub_users, :relationship_to_user
    remove_column :sub_users, :birthplace
  end
end
