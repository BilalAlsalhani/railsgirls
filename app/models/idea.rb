class Idea < ApplicationRecord
    validates :name, presence:true
    validates :description, presence:true
    has_many :comments
    has_one_attached :picture
end
