class Post < ApplicationRecord
  belongs_to :project, touch: true
  belongs_to :user, touch: true

	acts_as_taggable 

  	searchable do
  		text :title, :content
  	end

end
