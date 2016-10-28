class AddFeaturedToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :featured, :boolean
  end
end
