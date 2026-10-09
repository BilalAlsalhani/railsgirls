class Comment < ApplicationRecord
  validates :user_name, presence:true
  validates :body,  presence:true
  belongs_to :idea
end
