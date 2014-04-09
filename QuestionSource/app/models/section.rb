class Section < ActiveRecord::Base
  attr_accessible :name, :id
  has_many :questions
  validates_presence_of :name
end
