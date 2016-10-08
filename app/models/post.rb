class Post < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :images, dependent: :destroy

	acts_as_taggable 

  	searchable do
  		text :title, :content
  	end

end
