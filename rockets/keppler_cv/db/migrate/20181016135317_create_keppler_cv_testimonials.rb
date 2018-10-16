class CreateKepplerCvTestimonials < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_cv_testimonials do |t|
      t.string :photo
      t.string :name
      t.string :charge
      t.text :testimonial
      t.integer :position
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
