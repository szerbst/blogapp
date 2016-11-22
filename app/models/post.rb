class Post < ApplicationRecord
  belongs_to :project, touch: true
  belongs_to :user, touch: true
  has_many :images, as: :imageable
  has_many :comments, as: :commentable

	acts_as_taggable

  	searchable do
  		text :title, :content
  	end

end
