class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :desc, :score, :submitted, :user
end
