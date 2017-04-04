class Review < ApplicationRecord
  belongs_to :tplay
  belongs_to :user
  validates_length_of :comment, :maximum => 150
end
