class Board < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  validates_presence_of :name, :user
end
