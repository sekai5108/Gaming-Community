class Community < ApplicationRecord
  belongs_to :user
  has_many :community_comments
end
