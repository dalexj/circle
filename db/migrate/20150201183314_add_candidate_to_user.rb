class AddCandidateToUser < ActiveRecord::Migration
  def change
    add_column :users, :candidate, :boolean
  end
end
