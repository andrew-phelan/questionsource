class Question < ActiveRecord::Base
  belongs_to :section
  has_many :answers
  attr_accessible :desc, :name, :score, :submitted, :user, :section
end
