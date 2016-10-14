class Project < ApplicationRecord
	belongs_to :user
	has_many :posts, dependent: :destroy
	has_many :images, dependent: :destroy

	has_attached_file :picture, styles: { large: "600x600>", medium: "250x250>", thumb: "100x100>" }
  	crop_attached_file :picture, :aspect => "16:9", min_size: "250x250"
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  	searchable do
  		text :title, :description, :make, :model, :project_type
  	end

end
