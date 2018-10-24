# This migration comes from keppler_cv (originally 20181023220356)
class CreateKepplerCvCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_cv_certificates do |t|
      t.string :image
      t.string :name
      t.integer :position
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
