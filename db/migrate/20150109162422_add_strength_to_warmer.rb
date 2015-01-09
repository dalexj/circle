class AddStrengthToWarmer < ActiveRecord::Migration
  def change
    add_column :warmers, :strength, :integer
  end
end
