class CreateInnerCircles < ActiveRecord::Migration
  def change
    create_table :inner_circles do |t|
      t.string :name

      t.timestamps
    end
  end
end
