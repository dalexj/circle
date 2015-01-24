class UpdateUserTable < ActiveRecord::Migration
  def change
    add_column :users, :owner, :boolean
    add_column :users, :linkedin_url, :string
  end
end
