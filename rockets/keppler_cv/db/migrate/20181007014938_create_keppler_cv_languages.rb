class CreateKepplerCvLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_cv_languages do |t|
      t.string :image
      t.string :name
      t.integer :percentage
      t.string :color
      t.integer :position
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
