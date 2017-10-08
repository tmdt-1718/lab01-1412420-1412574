class Blog < ApplicationRecord

  #rel
  belongs_to :user

  #validates
  validates :content, presence: true
end
