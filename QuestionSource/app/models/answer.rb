class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :desc, :score, :submitted, :user
  validates_presence_of :desc, :user
end
