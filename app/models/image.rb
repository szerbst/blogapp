class Image < ApplicationRecord
	belongs_to :imageable, polymorphic: true

	has_attached_file :picture, styles: { large: "600x600>", medium: "250x250>", thumb: "100x100>" }
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end