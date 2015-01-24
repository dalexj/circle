class DropWarmersTable < ActiveRecord::Migration
  def change
    drop_table :warmers
  end
end
