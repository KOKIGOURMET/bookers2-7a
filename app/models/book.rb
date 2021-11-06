class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user



	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
