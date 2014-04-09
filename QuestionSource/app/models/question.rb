class Question < ActiveRecord::Base
  belongs_to :section
  has_many :answers
  attr_accessible :desc, :name, :score, :submitted, :user, :section
  validates_presence_of :name, :desc
end
