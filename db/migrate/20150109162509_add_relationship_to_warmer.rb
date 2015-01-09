class AddRelationshipToWarmer < ActiveRecord::Migration
  def change
    add_column :warmers, :relationship, :integer
  end
end
