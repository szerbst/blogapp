class AddDetailsToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :year, :int
    add_column :projects, :make, :string
    add_column :projects, :model, :string
    add_column :projects, :project_type, :string
  end
end
