class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :accounts
  has_many :communities, dependent: :destroy
  has_many :community_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image

end
