class AddInnerCircleToWarmer < ActiveRecord::Migration
  def change
    add_reference :warmers, :inner_circle, index: true
  end
end
