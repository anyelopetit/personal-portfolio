class AddActiveToKepplerCvProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_cv_projects, :active, :boolean
  end
end
