class Project < ApplicationRecord
	belongs_to :user
	has_many :posts
	has_many :images, as: :imageable
	has_many :post_images, through: :posts, as: :imageable, source: :images
	has_many :comments, as: :commentable
	has_many :favorites, as: :favorable


	has_attached_file :picture, styles: { large: "600x600>", medium: "250x250>", thumb: "100x100>" }
  	crop_attached_file :picture, :aspect => "16:9", min_size: "250x250"
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  	searchable do
  		text :title, :description, :make, :model, :project_type
  	end

	private

	def validate_dimensions
		dimensions = Paperclip::Geometry.from_file(self.picture.queued_for_write[:original])
    	self.errors.add(:picture, "Please upload a file at least 200 pixels wide") if dimensions.width < 200
    	self.errors.add(:picture, "Please upload a file at least 200 pixels tall") if dimensions.height < 200
	end

end
