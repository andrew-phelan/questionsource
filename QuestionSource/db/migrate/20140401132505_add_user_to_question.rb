class AddUserToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :user, :string
  end
end
