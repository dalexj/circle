class AddUserToInnerCircles < ActiveRecord::Migration
  def change
    add_reference :inner_circles, :user, index: true
  end
end
