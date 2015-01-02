class CreateWarmers < ActiveRecord::Migration
  def change
    create_table :warmers do |t|
      t.string :name
      t.string :linkedin_url
      t.text :description
      t.string :resume_url

      t.timestamps
    end
  end
end
