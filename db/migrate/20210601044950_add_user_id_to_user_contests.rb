class AddUserIdToUserContests < ActiveRecord::Migration[6.1]
  def change
  	add_column :user_contests, :user_id, :integer
  end
end
