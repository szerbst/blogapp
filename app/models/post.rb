class Post < ApplicationRecord
  belongs_to :project, touch: true
  belongs_to :user, touch: true
  has_many :images, dependent: :destroy

	acts_as_taggable 

  	searchable do
  		text :title, :content
  	end

end
