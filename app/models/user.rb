class User < ApplicationRecord
	has_many :projects
	has_many :posts
	has_many :comments, as: :commentable
	has_many :favorites, as: :favorable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
         
end
