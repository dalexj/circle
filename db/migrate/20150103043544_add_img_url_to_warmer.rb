class AddImgUrlToWarmer < ActiveRecord::Migration
  def change
    add_column :warmers, :img_url, :string
  end
end
