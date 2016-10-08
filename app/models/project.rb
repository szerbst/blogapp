class Project < ApplicationRecord
	belongs_to :user
	has_many :posts, dependent: :destroy
	has_many :images, dependent: :destroy

	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  	searchable do
  		text :title, :description, :make, :model, :project_type
  	end

end
