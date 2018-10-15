class CreateKepplerCvProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_cv_projects do |t|
      t.string :image
      t.string :name
      t.text :description
      t.string :url
      t.integer :position
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
