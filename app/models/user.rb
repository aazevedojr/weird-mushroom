class User < ApplicationRecord
  has_many :courses, foreign_key: :maker_id
  has_many :reviews, foreign_key: :reviewer_id
  has_many :challenges, foreign_key: :proposer_id

  validates :email, :username, {uniqueness: true, presence: true}

  has_secure_password
end
