class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string "name" , :null => false
      t.string "email" 
      t.integer "phone_num"
      t.timestamps
    end
  end
end
