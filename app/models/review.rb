class Review < ApplicationRecord
  belongs_to :reviewer, class_name: :User
  belongs_to :course

  validates :rating, :feedback, {presence: true}
end
